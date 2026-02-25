-- ============================================================
-- Padichiya — CTV Practice Arena
-- Supabase Database Schema
-- Run this in the Supabase SQL Editor
-- ============================================================

-- 1. Student Profiles
CREATE TABLE IF NOT EXISTS public.student_profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  name TEXT NOT NULL,
  register_number TEXT,
  role TEXT NOT NULL DEFAULT 'student' CHECK (role IN ('student', 'admin')),
  streak INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.student_profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own profile" ON public.student_profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON public.student_profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON public.student_profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- 2. Questions
CREATE TABLE IF NOT EXISTS public.questions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  subject TEXT NOT NULL,
  question_text TEXT NOT NULL,
  option_a TEXT NOT NULL,
  option_b TEXT NOT NULL,
  option_c TEXT NOT NULL,
  option_d TEXT NOT NULL,
  correct_answer TEXT NOT NULL CHECK (correct_answer IN ('A', 'B', 'C', 'D')),
  explanation TEXT NOT NULL DEFAULT '',
  gate_year INTEGER,
  source_type TEXT NOT NULL DEFAULT 'Practice Question'
    CHECK (source_type IN ('GATE PYQ', 'GATE-inspired', 'Practice Question')),
  difficulty TEXT NOT NULL DEFAULT 'Medium'
    CHECK (difficulty IN ('Easy', 'Medium', 'Hard')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;

-- All authenticated users can read questions
CREATE POLICY "Authenticated users can read questions" ON public.questions
  FOR SELECT TO authenticated USING (true);

-- Only admins can insert/update questions (handled application-side)
CREATE POLICY "Admins can insert questions" ON public.questions
  FOR INSERT TO authenticated WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.student_profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- 3. Question Attempts
CREATE TABLE IF NOT EXISTS public.question_attempts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  student_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  question_id UUID REFERENCES public.questions(id) ON DELETE CASCADE NOT NULL,
  selected_answer TEXT NOT NULL CHECK (selected_answer IN ('A', 'B', 'C', 'D')),
  is_correct BOOLEAN NOT NULL,
  attempted_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.question_attempts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own attempts" ON public.question_attempts
  FOR SELECT USING (auth.uid() = student_id);

CREATE POLICY "Users can insert own attempts" ON public.question_attempts
  FOR INSERT WITH CHECK (auth.uid() = student_id);

-- 4. Bookmarks
CREATE TABLE IF NOT EXISTS public.bookmarks (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  student_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  question_id UUID REFERENCES public.questions(id) ON DELETE CASCADE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(student_id, question_id)
);

ALTER TABLE public.bookmarks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can manage own bookmarks" ON public.bookmarks
  FOR ALL USING (auth.uid() = student_id);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_attempts_student ON public.question_attempts(student_id);
CREATE INDEX IF NOT EXISTS idx_attempts_question ON public.question_attempts(question_id);
CREATE INDEX IF NOT EXISTS idx_bookmarks_student ON public.bookmarks(student_id);
CREATE INDEX IF NOT EXISTS idx_questions_subject ON public.questions(subject);
CREATE INDEX IF NOT EXISTS idx_questions_difficulty ON public.questions(difficulty);
