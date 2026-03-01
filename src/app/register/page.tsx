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

            // When confirm email is off, Supabase auth.signUp with existing email 
            // returns success but with zero identities
            if (data.user.identities && data.user.identities.length === 0) {
                throw new Error('An account with this email already exists. Please sign in.')
            }

            // Create profile immediately (session is available since confirm is OFF)
            // Use UPSERT so if they failed halfway previously, they don't get a primary key error
            const { error: profileError } = await supabase.from('student_profiles').upsert({
                id: data.user.id,
                name: formData.name,
                register_number: formData.registerNumber || null,
                role: 'student',
                streak: 0,
            }, { onConflict: 'id' })

            if (profileError) {
                // To avoid confusing "duplicate key" errors from PG, give a simple message
                console.error("Profile creation error:", profileError)
                throw new Error('Failed to create user profile. Please try again.')
            }

            // Since confirm email is OFF, user is signed in automatically. Go to dashboard.
            router.push('/dashboard')
        } catch (err: unknown) {
            setError(err instanceof Error ? err.message : 'Registration failed. Please check your details and try again.')
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

                <h2 className="auth-title" style={{ fontWeight: 700, letterSpacing: '-0.02em', fontSize: '1.6rem' }}>Create account.</h2>
                <p style={{ color: 'var(--text-secondary)', fontSize: 15, marginBottom: 32, fontWeight: 400 }}>
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
                    <div className="form-group" style={{ marginBottom: 16 }}>
                        <input
                            className="apple-input"
                            type="text"
                            placeholder="Full Name"
                            value={formData.name}
                            onChange={e => setFormData(f => ({ ...f, name: e.target.value }))}
                            required
                            autoFocus
                        />
                    </div>
                    <div className="form-group" style={{ marginBottom: 16 }}>
                        <input
                            className="apple-input"
                            type="text"
                            placeholder="Register Number (Ex. 23CDR060)"
                            value={formData.registerNumber}
                            onChange={e => setFormData(f => ({ ...f, registerNumber: e.target.value }))}
                        />
                    </div>
                    <div className="form-group" style={{ marginBottom: 16 }}>
                        <input
                            className="apple-input"
                            type="email"
                            placeholder="Email Address"
                            value={formData.email}
                            onChange={e => setFormData(f => ({ ...f, email: e.target.value }))}
                            required
                        />
                    </div>
                    <div className="form-group" style={{ marginBottom: 32 }}>
                        <input
                            className="apple-input"
                            type="password"
                            placeholder="Password (Min. 6 characters)"
                            value={formData.password}
                            onChange={e => setFormData(f => ({ ...f, password: e.target.value }))}
                            required
                        />
                    </div>
                    <button
                        type="submit"
                        className="apple-btn"
                        disabled={loading}
                    >
                        {loading ? <span className="spinner" style={{ width: 18, height: 18, borderWidth: 2, borderColor: 'rgba(0,0,0,0.1)', borderTopColor: '#000' }} /> : null}
                        {loading ? 'Creating account...' : 'Create Account'}
                    </button>
                </form>

                <div className="auth-switch" style={{ marginTop: 24 }}>
                    Already have an account?{' '}
                    <Link href="/login" style={{ fontWeight: 500, color: '#fff' }}>Sign in</Link>
                </div>

                <div style={{ textAlign: 'center', marginTop: 32, fontSize: 12, color: 'var(--text-muted)', lineHeight: 1.7 }}>
                    🍊 Built with orange juice &amp; poor decisions<br />
                    <span style={{ color: 'rgba(255,255,255,0.7)', fontWeight: 500 }}>Jaiyandh A S</span>
                </div>
            </div>
        </div>
    )
}
