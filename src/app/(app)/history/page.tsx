'use client'

import { useEffect, useState } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { supabase } from '@/lib/supabase'

interface AttemptRow {
    id: string
    selected_answer: string
    is_correct: boolean
    attempted_at: string
    questions: {
        subject: string
        question_text: string
        correct_answer: string
        difficulty: string
    } | null
}

export default function HistoryPage() {
    const { user } = useAuth()
    const [attempts, setAttempts] = useState<AttemptRow[]>([])
    const [loading, setLoading] = useState(true)
    const [page, setPage] = useState(0)
    const PAGE_SIZE = 20

    useEffect(() => {
        if (!user) return
        const load = async () => {
            const { data } = await supabase
                .from('question_attempts')
                .select('*, questions(subject, question_text, correct_answer, difficulty)')
                .eq('student_id', user.id)
                .order('attempted_at', { ascending: false })
                .range(page * PAGE_SIZE, (page + 1) * PAGE_SIZE - 1)
            setAttempts(data as unknown as AttemptRow[] || [])
            setLoading(false)
        }
        load()
    }, [user, page])

    return (
        <div>
            <div className="page-header">
                <h1 className="page-title">Attempt History</h1>
                <p className="page-subtitle">All your past question attempts</p>
            </div>
            <div className="page-body">
                {loading ? (
                    <div className="loading-overlay"><div className="spinner" /></div>
                ) : attempts.length === 0 ? (
                    <div className="empty-state">
                        <div style={{ fontSize: 48 }}>📋</div>
                        <h3>No history yet</h3>
                        <p>Start practicing to see your attempt history here</p>
                        <a href="/practice" className="btn btn-primary" style={{ marginTop: 8 }}>Start Practice</a>
                    </div>
                ) : (
                    <>
                        <div className="card" style={{ padding: 0, overflow: 'hidden' }}>
                            <table className="data-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Question</th>
                                        <th>Subject</th>
                                        <th>Difficulty</th>
                                        <th>Your Answer</th>
                                        <th>Correct</th>
                                        <th>Result</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {attempts.map((a, i) => (
                                        <tr key={a.id}>
                                            <td style={{ color: 'var(--text-muted)', fontSize: 12 }}>{page * PAGE_SIZE + i + 1}</td>
                                            <td style={{ maxWidth: 280, color: 'var(--text-primary)' }}>
                                                <span title={a.questions?.question_text}>
                                                    {a.questions?.question_text?.slice(0, 60)}
                                                    {(a.questions?.question_text?.length ?? 0) > 60 ? '…' : ''}
                                                </span>
                                            </td>
                                            <td>
                                                <span className="badge badge-accent" style={{ fontSize: 11 }}>
                                                    {a.questions?.subject}
                                                </span>
                                            </td>
                                            <td>
                                                <span className={`badge ${a.questions?.difficulty === 'Easy' ? 'badge-success' : a.questions?.difficulty === 'Hard' ? 'badge-error' : 'badge-warning'}`} style={{ fontSize: 11 }}>
                                                    {a.questions?.difficulty}
                                                </span>
                                            </td>
                                            <td style={{ fontWeight: 600 }}>{a.selected_answer}</td>
                                            <td style={{ color: 'var(--success)', fontWeight: 600 }}>{a.questions?.correct_answer}</td>
                                            <td>
                                                {a.is_correct ? (
                                                    <span className="badge badge-success">✓ Correct</span>
                                                ) : (
                                                    <span className="badge badge-error">✗ Wrong</span>
                                                )}
                                            </td>
                                            <td style={{ fontSize: 12, color: 'var(--text-muted)' }}>
                                                {new Date(a.attempted_at).toLocaleDateString('en-IN', { day: '2-digit', month: 'short', year: '2-digit' })}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                        <div style={{ display: 'flex', gap: 8, marginTop: 16, justifyContent: 'center' }}>
                            <button className="btn btn-secondary btn-sm" onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0}>← Prev</button>
                            <span style={{ display: 'flex', alignItems: 'center', fontSize: 13, color: 'var(--text-muted)' }}>Page {page + 1}</span>
                            <button className="btn btn-secondary btn-sm" onClick={() => setPage(p => p + 1)} disabled={attempts.length < PAGE_SIZE}>Next →</button>
                        </div>
                    </>
                )}
            </div>
        </div>
    )
}
