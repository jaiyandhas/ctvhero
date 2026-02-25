import type { Metadata } from 'next'
import { AuthProvider } from '@/contexts/AuthContext'
import '@/styles/globals.css'

export const metadata: Metadata = {
    title: 'Padichiya — CTV Practice Arena',
    description: 'GATE-style Comprehensive Test Viva preparation platform for Computer Science students.',
    keywords: ['GATE', 'MCQ', 'Computer Organization', 'Digital Logic', 'Data Structures', 'viva', 'practice'],
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
    return (
        <html lang="en">
            <body>
                <AuthProvider>
                    {children}
                </AuthProvider>
            </body>
        </html>
    )
}
