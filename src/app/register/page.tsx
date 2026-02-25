'use client'

import { useState, FormEvent } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase'

export default function RegisterPage() {
    const router = useRouter()
    const [formData, setFormData] = useState({
        name: '', registerNumber: '', email: '', password: ''
    })
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)

    const handleRegister = async (e: FormEvent) => {
        e.preventDefault()
        setError('')
        if (formData.password.length < 6) { setError('Password must be at least 6 characters'); return }
        setLoading(true)
        try {
            // Sign up (email confirmation is OFF in Supabase)
            const { data, error: signUpError } = await supabase.auth.signUp({
                email: formData.email,
                password: formData.password,
            })
            if (signUpError) throw signUpError
            if (!data.user) throw new Error('No user returned — please try again')

            // Create profile immediately (session is available since confirm is OFF)
            const { error: profileError } = await supabase.from('student_profiles').insert({
                id: data.user.id,
                name: formData.name,
                register_number: formData.registerNumber || null,
                role: 'student',
                streak: 0,
            })
            if (profileError) throw profileError

            router.push('/dashboard')
        } catch (err: unknown) {
            setError(err instanceof Error ? err.message : 'Registration failed')
        } finally {
            setLoading(false)
        }
    }

    return (
        <div className="auth-page">
            <div className="auth-card fade-in">
                <div className="auth-logo">
                    <div className="auth-logo-title">Padichiya</div>
                    <div className="auth-logo-sub">CTV Practice Arena · GATE Prep</div>
                </div>

                <h2 className="auth-title">Create account</h2>
                <p style={{ color: 'var(--text-secondary)', fontSize: 14, marginBottom: 24 }}>
                    Join and start your CTV preparation journey
                </p>

                {error && (
                    <div className="alert alert-error">
                        <svg width={16} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={2}>
                            <circle cx="12" cy="12" r="10" /><path d="M12 8v4M12 16h.01" />
                        </svg>
                        {error}
                    </div>
                )}

                <form onSubmit={handleRegister}>
                    <div className="form-group">
                        <label className="form-label">Full Name</label>
                        <input
                            className="form-input"
                            type="text"
                            placeholder="Your full name"
                            value={formData.name}
                            onChange={e => setFormData(f => ({ ...f, name: e.target.value }))}
                            required
                            autoFocus
                        />
                    </div>
                    <div className="form-group">
                        <label className="form-label">Register Number <span style={{ color: 'var(--text-muted)' }}>(optional)</span></label>
                        <input
                            className="form-input"
                            type="text"
                            placeholder="e.g. 2021CS001"
                            value={formData.registerNumber}
                            onChange={e => setFormData(f => ({ ...f, registerNumber: e.target.value }))}
                        />
                    </div>
                    <div className="form-group">
                        <label className="form-label">Email Address</label>
                        <input
                            className="form-input"
                            type="email"
                            placeholder="you@college.edu"
                            value={formData.email}
                            onChange={e => setFormData(f => ({ ...f, email: e.target.value }))}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label className="form-label">Password</label>
                        <input
                            className="form-input"
                            type="password"
                            placeholder="Min. 6 characters"
                            value={formData.password}
                            onChange={e => setFormData(f => ({ ...f, password: e.target.value }))}
                            required
                        />
                    </div>
                    <button
                        type="submit"
                        className="btn btn-primary btn-full btn-lg"
                        disabled={loading}
                        style={{ marginTop: 8 }}
                    >
                        {loading ? <span className="spinner" /> : null}
                        {loading ? 'Creating account...' : 'Create Account'}
                    </button>
                </form>

                <div className="auth-switch">
                    Already have an account?{' '}
                    <Link href="/login">Sign in</Link>
                </div>

                <div style={{ textAlign: 'center', marginTop: 20, fontSize: 11, color: 'var(--text-muted)', lineHeight: 1.7 }}>
                    🍊 Built with orange juice &amp; poor decisions<br />
                    <span style={{ color: 'var(--accent-light)', fontWeight: 600 }}>Jaiyandh A S</span>
                    <span> · 23CDR060</span>
                </div>
            </div>
        </div>
    )
}
