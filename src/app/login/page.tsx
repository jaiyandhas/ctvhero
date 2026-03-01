'use client'

import { useState, FormEvent } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase'

export default function LoginPage() {
    const router = useRouter()
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(false)

    const handleLogin = async (e: FormEvent) => {
        e.preventDefault()
        setError('')
        setLoading(true)
        try {
            const timeoutPromise = new Promise<never>((_, reject) =>
                setTimeout(() => reject(new Error('Request timed out — please check your internet connection.')), 15000)
            )
            const loginPromise = supabase.auth.signInWithPassword({ email, password })
            const { error: authError } = await Promise.race([loginPromise, timeoutPromise])

            if (authError) {
                // Supabase AuthError has .message but isn't instanceof Error
                let errorMessage = authError.message
                if (errorMessage.toLowerCase().includes('invalid login credentials')) {
                    errorMessage = 'Incorrect email or password. Please try again.'
                } else if (errorMessage.toLowerCase().includes('email not confirmed')) {
                    errorMessage = 'Please confirm your email address before signing in.'
                }
                throw new Error(errorMessage)
            }
            router.push('/dashboard')
        } catch (err: unknown) {
            const msg = err instanceof Error ? err.message : 'Login failed. Please try again later.'
            setError(msg)
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

                <h2 className="auth-title" style={{ fontWeight: 700, letterSpacing: '-0.02em', fontSize: '1.6rem' }}>Welcome back.</h2>
                <p style={{ color: 'var(--text-secondary)', fontSize: 15, marginBottom: 32, fontWeight: 400 }}>
                    Sign in to continue your practice
                </p>

                {error && (
                    <div className="alert alert-error">
                        <svg width={16} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={2}>
                            <circle cx="12" cy="12" r="10" /><path d="M12 8v4M12 16h.01" />
                        </svg>
                        {error}
                    </div>
                )}

                <form onSubmit={handleLogin}>
                    <div className="form-group" style={{ marginBottom: 16 }}>
                        <input
                            className="apple-input"
                            type="email"
                            placeholder="Email Address"
                            value={email}
                            onChange={e => setEmail(e.target.value)}
                            required
                            autoFocus
                        />
                    </div>
                    <div className="form-group" style={{ marginBottom: 32 }}>
                        <input
                            className="apple-input"
                            type="password"
                            placeholder="Password"
                            value={password}
                            onChange={e => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    <button
                        type="submit"
                        className="apple-btn"
                        disabled={loading}
                    >
                        {loading ? <span className="spinner" style={{ width: 18, height: 18, borderWidth: 2, borderColor: 'rgba(0,0,0,0.1)', borderTopColor: '#000' }} /> : null}
                        {loading ? 'Signing in...' : 'Sign In'}
                    </button>
                </form>

                <div className="auth-switch" style={{ marginTop: 24 }}>
                    Don&apos;t have an account?{' '}
                    <Link href="/register" style={{ fontWeight: 500, color: '#fff' }}>Create one</Link>
                </div>
                <div style={{ textAlign: 'center', marginTop: 32, fontSize: 12, color: 'var(--text-muted)', lineHeight: 1.7 }}>
                    🍊 Built with orange juice &amp; poor decisions<br />
                    <span style={{ color: 'rgba(255,255,255,0.7)', fontWeight: 500 }}>Jaiyandh A S</span>
                </div>
            </div>
        </div>
    )
}
