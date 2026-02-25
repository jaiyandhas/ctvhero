import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

export type Database = {
    public: {
        Tables: {
            student_profiles: {
                Row: {
                    id: string
                    name: string
                    register_number: string | null
                    role: 'student' | 'admin'
                    streak: number
                    created_at: string
                }
                Insert: {
                    id: string
                    name: string
                    register_number?: string | null
                    role?: 'student' | 'admin'
                    streak?: number
                }
                Update: {
                    name?: string
                    register_number?: string | null
                    streak?: number
                }
            }
            questions: {
                Row: {
                    id: string
                    subject: string
                    question_text: string
                    option_a: string
                    option_b: string
                    option_c: string
                    option_d: string
                    correct_answer: string
                    explanation: string
                    gate_year: number | null
                    source_type: string
                    difficulty: string
                    created_at: string
                }
                Insert: {
                    subject: string
                    question_text: string
                    option_a: string
                    option_b: string
                    option_c: string
                    option_d: string
                    correct_answer: string
                    explanation: string
                    gate_year?: number | null
                    source_type: string
                    difficulty: string
                }
            }
            question_attempts: {
                Row: {
                    id: string
                    student_id: string
                    question_id: string
                    selected_answer: string
                    is_correct: boolean
                    attempted_at: string
                }
                Insert: {
                    student_id: string
                    question_id: string
                    selected_answer: string
                    is_correct: boolean
                }
            }
            bookmarks: {
                Row: {
                    id: string
                    student_id: string
                    question_id: string
                    created_at: string
                }
                Insert: {
                    student_id: string
                    question_id: string
                }
            }
        }
    }
}
