'use client'

import { useEffect, useState, useCallback } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { supabase } from '@/lib/supabase'

interface Question {
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
}

const SUBJECTS = ['All Subjects', 'Computer Organization', 'Digital Logic', 'Data Structures']
const DIFFICULTIES = ['All Levels', 'Easy', 'Medium', 'Hard']
const OPTION_LABELS = ['A', 'B', 'C', 'D']

export default function PracticePage() {
    const { user, profile, refreshProfile } = useAuth()
    const [questions, setQuestions] = useState<Question[]>([])
    const [current, setCurrent] = useState(0)
    const [selected, setSelected] = useState<string | null>(null)
    const [submitted, setSubmitted] = useState(false)
    const [loading, setLoading] = useState(true)
    const [subject, setSubject] = useState('All Subjects')
    const [difficulty, setDifficulty] = useState('All Levels')
    const [bookmarked, setBookmarked] = useState(false)
    const [streakCount, setStreakCount] = useState(0)
    const [answeredCount, setAnsweredCount] = useState(0)
    const [correctCount, setCorrectCount] = useState(0)

    const loadQuestions = useCallback(async () => {
        setLoading(true)
        let query = supabase.from('questions').select('*')
        if (subject !== 'All Subjects') query = query.eq('subject', subject)
        if (difficulty !== 'All Levels') query = query.eq('difficulty', difficulty)
        const { data } = await query.limit(200)
        if (data) {
            // Shuffle
            const shuffled = [...data].sort(() => Math.random() - 0.5)
            setQuestions(shuffled as Question[])
        }
        setCurrent(0)
        setSelected(null)
        setSubmitted(false)
        setLoading(false)
    }, [subject, difficulty])

    useEffect(() => { loadQuestions() }, [loadQuestions])

    const checkBookmark = useCallback(async (qId: string) => {
        if (!user) return
        const { data } = await supabase
            .from('bookmarks')
            .select('id')
            .eq('student_id', user.id)
            .eq('question_id', qId)
            .single()
        setBookmarked(!!data)
    }, [user])

    useEffect(() => {
        if (questions[current]) checkBookmark(questions[current].id)
    }, [current, questions, checkBookmark])

    const handleSubmit = async () => {
        if (!selected || !user || !questions[current]) return
        const q = questions[current]
        const isCorrect = selected === q.correct_answer
        setSubmitted(true)
        setAnsweredCount(c => c + 1)
        if (isCorrect) setCorrectCount(c => c + 1)

        // Record attempt
        await supabase.from('question_attempts').insert({
            student_id: user.id,
            question_id: q.id,
            selected_answer: selected,
            is_correct: isCorrect,
        })

        // Update streak in profile
        if (isCorrect) {
            const newStreak = (profile?.streak || 0) + 1
            setStreakCount(newStreak)
            await supabase.from('student_profiles').update({ streak: newStreak }).eq('id', user.id)
            await refreshProfile()
        } else {
            await supabase.from('student_profiles').update({ streak: 0 }).eq('id', user.id)
            setStreakCount(0)
        }
    }

    const handleNext = () => {
        if (current < questions.length - 1) {
            setCurrent(c => c + 1)
            setSelected(null)
            setSubmitted(false)
        }
    }

    const handleBookmark = async () => {
        if (!user || !questions[current]) return
        const qId = questions[current].id
        if (bookmarked) {
            await supabase.from('bookmarks').delete().eq('student_id', user.id).eq('question_id', qId)
            setBookmarked(false)
        } else {
            await supabase.from('bookmarks').insert({ student_id: user.id, question_id: qId })
            setBookmarked(true)
        }
    }

    const q = questions[current]

    const getOptionClass = (letter: string): string => {
        if (!submitted) return selected === letter ? 'option-btn selected' : 'option-btn'
        if (letter === q?.correct_answer) return 'option-btn correct'
        if (letter === selected && letter !== q?.correct_answer) return 'option-btn wrong'
        return 'option-btn'
    }

    const optionTexts = q ? [q.option_a, q.option_b, q.option_c, q.option_d] : []

    return (
        <div>
            <div className="page-header">
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: 12 }}>
                    <div>
                        <h1 className="page-title">Practice Mode</h1>
                        <p className="page-subtitle">GATE-style MCQ — one question at a time</p>
                    </div>
                    {streakCount > 0 && (
                        <div className="streak-badge">🔥 {streakCount} streak</div>
                    )}
                </div>
            </div>

            <div className="page-body">
                {/* Filters */}
                <div style={{ display: 'flex', gap: 12, marginBottom: 20, flexWrap: 'wrap', alignItems: 'center' }}>
                    <select
                        className="form-select"
                        style={{ width: 200 }}
                        value={subject}
                        onChange={e => setSubject(e.target.value)}
                    >
                        {SUBJECTS.map(s => <option key={s}>{s}</option>)}
                    </select>
                    <select
                        className="form-select"
                        style={{ width: 160 }}
                        value={difficulty}
                        onChange={e => setDifficulty(e.target.value)}
                    >
                        {DIFFICULTIES.map(d => <option key={d}>{d}</option>)}
                    </select>
                    <button className="btn btn-secondary btn-sm" onClick={loadQuestions}>
                        🔀 Shuffle
                    </button>
                    {answeredCount > 0 && (
                        <span style={{ fontSize: 13, color: 'var(--text-muted)', marginLeft: 'auto' }}>
                            Session: {correctCount}/{answeredCount} correct
                        </span>
                    )}
                </div>

                {loading ? (
                    <div className="loading-overlay"><div className="spinner" /></div>
                ) : questions.length === 0 ? (
                    <div className="empty-state">
                        <h3>No questions found</h3>
                        <p>Try changing the subject or difficulty filter</p>
                    </div>
                ) : (
                    <>
                        {/* Progress */}
                        <div style={{ marginBottom: 16 }}>
                            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6, fontSize: 12, color: 'var(--text-muted)' }}>
                                <span>Question {current + 1} of {questions.length}</span>
                                <span>{Math.round(((current + 1) / questions.length) * 100)}%</span>
                            </div>
                            <div className="progress-bar-track">
                                <div className="progress-bar-fill" style={{ width: `${((current + 1) / questions.length) * 100}%` }} />
                            </div>
                        </div>

                        {/* Question card */}
                        <div className="card fade-in" key={q.id}>
                            {/* Meta */}
                            <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap', marginBottom: 16, alignItems: 'center' }}>
                                <span className="badge badge-accent">{q.subject}</span>
                                <span className={`badge ${q.difficulty === 'Easy' ? 'badge-success' : q.difficulty === 'Hard' ? 'badge-error' : 'badge-warning'}`}>
                                    {q.difficulty}
                                </span>
                                <span className="badge badge-muted">{q.source_type}</span>
                                {q.gate_year && <span className="badge badge-muted">GATE {q.gate_year}</span>}
                                {!q.gate_year && q.source_type.toLowerCase().includes('gate') && (
                                    <span className="badge badge-muted">Year not specified</span>
                                )}
                            </div>

                            <div className="question-number">Question {current + 1}</div>
                            <div className="question-text">{q.question_text}</div>

                            {/* Options */}
                            <div className="options-grid">
                                {OPTION_LABELS.map((letter, i) => (
                                    <button
                                        key={letter}
                                        className={getOptionClass(letter)}
                                        onClick={() => !submitted && setSelected(letter)}
                                        disabled={submitted}
                                    >
                                        <span className="option-letter">{letter}</span>
                                        <span>{optionTexts[i]}</span>
                                    </button>
                                ))}
                            </div>

                            {/* Submit */}
                            {!submitted && (
                                <div className="action-bar">
                                    <button
                                        className="btn btn-primary"
                                        onClick={handleSubmit}
                                        disabled={!selected}
                                    >
                                        Submit Answer
                                    </button>
                                    <button className="btn btn-ghost btn-sm" onClick={handleBookmark}>
                                        {bookmarked ? '🔖 Bookmarked' : '+ Retry Later'}
                                    </button>
                                </div>
                            )}

                            {/* Feedback after submit */}
                            {submitted && (
                                <div className="fade-in">
                                    <div className={`alert ${selected === q.correct_answer ? 'alert-success' : 'alert-error'}`}>
                                        {selected === q.correct_answer ? (
                                            <>✅ Correct! The answer is <strong>Option {q.correct_answer}</strong></>
                                        ) : (
                                            <>❌ Incorrect. The correct answer is <strong>Option {q.correct_answer}</strong></>
                                        )}
                                    </div>

                                    <div className="explanation-box">
                                        <div style={{ fontWeight: 600, color: 'var(--text-primary)', marginBottom: 6, fontSize: 13 }}>
                                            💡 Explanation
                                        </div>
                                        {q.explanation}
                                    </div>

                                    <div className="action-bar">
                                        <button
                                            className="btn btn-primary"
                                            onClick={handleNext}
                                            disabled={current >= questions.length - 1}
                                        >
                                            Next Question →
                                        </button>
                                        <button
                                            className={`btn ${bookmarked ? 'btn-success' : 'btn-secondary'} btn-sm`}
                                            onClick={handleBookmark}
                                        >
                                            {bookmarked ? '🔖 Bookmarked' : '🔖 Retry Later'}
                                        </button>
                                        {current >= questions.length - 1 && (
                                            <button className="btn btn-ghost btn-sm" onClick={loadQuestions}>
                                                Restart 🔄
                                            </button>
                                        )}
                                    </div>
                                </div>
                            )}
                        </div>
                    </>
                )}
            </div>
        </div>
    )
}
