'use client'

import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { useAuth } from '@/contexts/AuthContext'

interface NavItem {
    href: string
    label: string
    icon: React.ReactNode
    adminOnly?: boolean
}

const navItems: NavItem[] = [
    {
        href: '/dashboard',
        label: 'Dashboard',
        icon: (
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8}>
                <rect x="3" y="3" width="7" height="7" rx="1.5" />
                <rect x="14" y="3" width="7" height="7" rx="1.5" />
                <rect x="3" y="14" width="7" height="7" rx="1.5" />
                <rect x="14" y="14" width="7" height="7" rx="1.5" />
            </svg>
        ),
    },
    {
        href: '/practice',
        label: 'Practice Mode',
        icon: (
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8}>
                <circle cx="12" cy="12" r="9" />
                <path d="M9 12h6M12 9v6" />
            </svg>
        ),
    },
    {
        href: '/bookmarks',
        label: 'Retry Later',
        icon: (
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8}>
                <path d="M19 21l-7-5-7 5V5a2 2 0 012-2h10a2 2 0 012 2z" />
            </svg>
        ),
    },
    {
        href: '/history',
        label: 'History',
        icon: (
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8}>
                <circle cx="12" cy="12" r="9" />
                <path d="M12 7v5l3 3" />
            </svg>
        ),
    },
    {
        href: '/admin',
        label: 'Admin Panel',
        adminOnly: true,
        icon: (
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8}>
                <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
            </svg>
        ),
    },
]

export default function Sidebar() {
    const pathname = usePathname()
    const router = useRouter()
    const { profile, signOut } = useAuth()

    const handleSignOut = async () => {
        await signOut()
        router.push('/login')
    }

    const visibleItems = navItems.filter(item => !item.adminOnly || profile?.role === 'admin')

    return (
        <aside className="sidebar">
            <div className="sidebar-logo">
                <div className="sidebar-logo-text">Padichiya</div>
                <div className="sidebar-logo-sub">CTV PRACTICE ARENA</div>
            </div>

            <nav className="sidebar-nav">
                <div className="sidebar-section-label">Navigation</div>
                {visibleItems.map(item => (
                    <Link
                        key={item.href}
                        href={item.href}
                        className={`nav-item ${pathname === item.href || pathname.startsWith(item.href + '/') ? 'active' : ''}`}
                    >
                        {item.icon}
                        {item.label}
                    </Link>
                ))}
            </nav>

            <div className="sidebar-bottom">
                {profile && (
                    <div style={{ marginBottom: 12, padding: '10px 12px', background: 'var(--bg-card)', borderRadius: 'var(--radius-sm)', border: '1px solid var(--border)' }}>
                        <div style={{ fontSize: 13, fontWeight: 600, color: 'var(--text-primary)', marginBottom: 2 }}>
                            {profile.name}
                        </div>
                        <div style={{ fontSize: 11, color: 'var(--text-muted)' }}>
                            {profile.register_number || profile.role}
                        </div>
                    </div>
                )}
                <button onClick={handleSignOut} className="btn btn-ghost btn-sm" style={{ width: '100%' }}>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth={1.8} width={16}>
                        <path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4M16 17l5-5-5-5M21 12H9" />
                    </svg>
                    Sign Out
                </button>
                <div style={{ marginTop: 12, textAlign: 'center', fontSize: 11, color: 'var(--text-muted)', lineHeight: 1.6 }}>
                    <span>🍊 Built with orange juice & poor decisions</span>
                    <br />
                    <span style={{ color: 'var(--accent-light)', fontWeight: 600 }}>Jaiyandh A S</span>
                    <span style={{ color: 'var(--text-muted)' }}> · 23CDR060</span>
                </div>
            </div>
        </aside>
    )
}
