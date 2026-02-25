'use client'

import { useEffect, useState } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { supabase } from '@/lib/supabase'

interface Stats {
    total: number
    correct: number
    wrong: number
    bySubject: Record<string, { total: number; correct: number }>
}

interface SubjectRow {
    subject: string
    total: number
    correct: number
    accuracy: number
}

export default function DashboardPage() {
    const { user, profile } = useAuth()
    const [stats, setStats] = useState<Stats>({ total: 0, correct: 0, wrong: 0, bySubject: {} })
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        if (!user) return
        const load = async () => {
            const { data } = await supabase
                .from('question_attempts')
                .select('is_correct, questions(subject)')
                .eq('student_id', user.id)

            if (!data) { setLoading(false); return }

            const bySubject: Record<string, { total: number; correct: number }> = {}
            let correct = 0

            for (const row of (data as unknown) as { is_correct: boolean; questions: { subject: string } | null }[]) {
                const subject = row.questions?.subject || 'Unknown'
                if (!bySubject[subject]) bySubject[subject] = { total: 0, correct: 0 }
                bySubject[subject].total++
                if (row.is_correct) { correct++; bySubject[subject].correct++ }
            }

            setStats({ total: data.length, correct, wrong: data.length - correct, bySubject })
            setLoading(false)
        }
        load()
    }, [user])

    const accuracy = stats.total > 0 ? Math.round((stats.correct / stats.total) * 100) : 0

    const subjectRows: SubjectRow[] = Object.entries(stats.bySubject).map(([subject, s]) => ({
        subject,
        total: s.total,
        correct: s.correct,
        accuracy: s.total > 0 ? Math.round((s.correct / s.total) * 100) : 0,
    })).sort((a, b) => b.total - a.total)

    const weakTopics = subjectRows.filter(s => s.accuracy < 50 && s.total >= 3)

    return (
        <div>
            <div className="page-header">
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: 12 }}>
                    <div>
                        <h1 className="page-title">
                            Welcome back, {profile?.name?.split(' ')[0]} 👋
                        </h1>
                        <p className="page-subtitle">Here&apos;s your CTV practice progress</p>
                    </div>
                    {(profile?.streak ?? 0) > 0 && (
                        <div className="streak-badge">
                            🔥 {profile?.streak} Day Streak
                        </div>
                    )}
                </div>
            </div>

            <div className="page-body">
                {loading ? (
                    <div className="loading-overlay">
                        <div className="spinner" />
                    </div>
                ) : (
                    <>
                        {/* Stats grid */}
                        <div className="grid-4" style={{ marginBottom: 24 }}>
                            <div className="stat-card">
                                <div className="stat-icon" style={{ background: 'rgba(108,99,255,0.12)' }}>
                                    <svg width={18} viewBox="0 0 24 24" fill="none" stroke="var(--accent-light)" strokeWidth={2}>
                                        <path d="M9 11l3 3L22 4M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11" />
                                    </svg>
                                </div>
                                <div className="stat-label">Total Attempted</div>
                                <div className="stat-value">{stats.total}</div>
                                <div className="stat-sub">All time questions</div>
                            </div>
                            <div className="stat-card">
                                <div className="stat-icon" style={{ background: 'rgba(34,197,94,0.12)' }}>
                                    <svg width={18} viewBox="0 0 24 24" fill="none" stroke="var(--success)" strokeWidth={2}>
                                        <path d="M22 11.08V12a10 10 0 11-5.93-9.14M22 4L12 14.01l-3-3" />
                                    </svg>
                                </div>
                                <div className="stat-label">Correct</div>
                                <div className="stat-value" style={{ color: 'var(--success)' }}>{stats.correct}</div>
                                <div className="stat-sub">Right answers</div>
                            </div>
                            <div className="stat-card">
                                <div className="stat-icon" style={{ background: 'rgba(239,68,68,0.12)' }}>
                                    <svg width={18} viewBox="0 0 24 24" fill="none" stroke="var(--error)" strokeWidth={2}>
                                        <circle cx="12" cy="12" r="10" /><path d="M15 9l-6 6M9 9l6 6" />
                                    </svg>
                                </div>
                                <div className="stat-label">Wrong</div>
                                <div className="stat-value" style={{ color: 'var(--error)' }}>{stats.wrong}</div>
                                <div className="stat-sub">Incorrect answers</div>
                            </div>
                            <div className="stat-card">
                                <div className="stat-icon" style={{ background: accuracy >= 70 ? 'rgba(34,197,94,0.12)' : accuracy >= 50 ? 'rgba(245,158,11,0.12)' : 'rgba(239,68,68,0.12)' }}>
                                    <svg width={18} viewBox="0 0 24 24" fill="none" stroke={accuracy >= 70 ? 'var(--success)' : accuracy >= 50 ? 'var(--warning)' : 'var(--error)'} strokeWidth={2}>
                                        <path d="M18 20V10M12 20V4M6 20v-6" />
                                    </svg>
                                </div>
                                <div className="stat-label">Accuracy</div>
                                <div
                                    className="stat-value"
                                    style={{ color: accuracy >= 70 ? 'var(--success)' : accuracy >= 50 ? 'var(--warning)' : stats.total === 0 ? 'var(--text-muted)' : 'var(--error)' }}
                                >
                                    {accuracy}%
                                </div>
                                <div className="stat-sub">{accuracy >= 70 ? 'Excellent!' : accuracy >= 50 ? 'Good going' : stats.total === 0 ? 'Not started' : 'Needs work'}</div>
                            </div>
                        </div>

                        <div className="grid-2" style={{ gap: 24 }}>
                            {/* Subject-wise */}
                            <div className="card">
                                <h3 style={{ marginBottom: 16 }}>Subject Performance</h3>
                                {subjectRows.length === 0 ? (
                                    <div className="empty-state" style={{ padding: 32 }}>
                                        <p style={{ fontSize: 14 }}>No data yet — start practicing!</p>
                                    </div>
                                ) : (
                                    <table className="data-table">
                                        <thead>
                                            <tr>
                                                <th>Subject</th>
                                                <th>Attempted</th>
                                                <th>Correct</th>
                                                <th>Accuracy</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {subjectRows.map(row => (
                                                <tr key={row.subject}>
                                                    <td style={{ color: 'var(--text-primary)', fontWeight: 500 }}>{row.subject}</td>
                                                    <td>{row.total}</td>
                                                    <td style={{ color: 'var(--success)' }}>{row.correct}</td>
                                                    <td>
                                                        <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                                                            <div className="progress-bar-track" style={{ width: 60 }}>
                                                                <div
                                                                    className="progress-bar-fill"
                                                                    style={{
                                                                        width: `${row.accuracy}%`,
                                                                        background: row.accuracy >= 70 ? 'var(--success)' : row.accuracy >= 50 ? 'var(--warning)' : 'var(--error)'
                                                                    }}
                                                                />
                                                            </div>
                                                            <span style={{ fontSize: 13, fontWeight: 500 }}>{row.accuracy}%</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                )}
                            </div>

                            {/* Weak topics */}
                            <div className="card">
                                <h3 style={{ marginBottom: 16 }}>⚠️ Weak Topics</h3>
                                {weakTopics.length === 0 ? (
                                    <div className="empty-state" style={{ padding: 32 }}>
                                        {stats.total === 0 ? (
                                            <>
                                                <p style={{ fontSize: 14, color: 'var(--text-secondary)' }}>Start practicing to see weak topics</p>
                                                <a href="/practice" className="btn btn-primary btn-sm" style={{ marginTop: 8 }}>
                                                    Start Practice
                                                </a>
                                            </>
                                        ) : (
                                            <p style={{ fontSize: 14, color: 'var(--success)' }}>
                                                🎉 No weak topics! Keep it up.
                                            </p>
                                        )}
                                    </div>
                                ) : (
                                    <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
                                        {weakTopics.map(t => (
                                            <div key={t.subject}
                                                style={{ padding: '12px 14px', background: 'var(--error-bg)', borderRadius: 'var(--radius-sm)', border: '1px solid rgba(239,68,68,0.2)', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                                                <div>
                                                    <div style={{ fontWeight: 500, fontSize: 14, color: 'var(--text-primary)' }}>{t.subject}</div>
                                                    <div style={{ fontSize: 12, color: 'var(--text-muted)', marginTop: 2 }}>{t.total} attempted</div>
                                                </div>
                                                <span className="badge badge-error">{t.accuracy}%</span>
                                            </div>
                                        ))}
                                        <a href="/practice" className="btn btn-secondary btn-sm" style={{ marginTop: 4 }}>
                                            Practice weak topics →
                                        </a>
                                    </div>
                                )}
                            </div>
                        </div>
                    </>
                )}
            </div>
        </div>
    )
}
