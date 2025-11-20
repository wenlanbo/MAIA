'use client'

import { signOut } from 'next-auth/react'
import { Session } from 'next-auth'

interface DashboardProps {
  session: Session
}

export default function Dashboard({ session }: DashboardProps) {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 dark:from-gray-900 dark:to-gray-800">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="bg-white dark:bg-gray-800 rounded-xl shadow-2xl p-8">
          <div className="flex justify-between items-center mb-8">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white">
                Welcome to MAIA
              </h1>
              <p className="mt-2 text-gray-600 dark:text-gray-400">
                Multi-Authentication Integration App
              </p>
            </div>
            <button
              onClick={() => signOut({ callbackUrl: '/login' })}
              className="px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition-colors"
            >
              Sign Out
            </button>
          </div>

          <div className="bg-gray-50 dark:bg-gray-700 rounded-lg p-6 mb-6">
            <h2 className="text-xl font-semibold text-gray-900 dark:text-white mb-4">
              Your Profile
            </h2>
            <div className="space-y-3">
              {session.user?.image && (
                <div className="flex items-center space-x-4">
                  <img
                    src={session.user.image}
                    alt="Profile"
                    className="w-16 h-16 rounded-full"
                  />
                  <div>
                    <p className="text-sm text-gray-500 dark:text-gray-400">Profile Picture</p>
                  <p className="text-sm text-gray-500 dark:text-gray-400">From OAuth provider</p>
                  </div>
                </div>
              )}
              <div>
                <p className="text-sm text-gray-500 dark:text-gray-400">Name</p>
                <p className="text-lg font-medium text-gray-900 dark:text-white">
                  {session.user?.name || 'Not provided'}
                </p>
              </div>
              <div>
                <p className="text-sm text-gray-500 dark:text-gray-400">Email</p>
                <p className="text-lg font-medium text-gray-900 dark:text-white">
                  {session.user?.email || 'Not provided'}
                </p>
              </div>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-lg p-4">
              <h3 className="font-semibold text-blue-900 dark:text-blue-300 mb-2">
                Email Authentication
              </h3>
              <p className="text-sm text-blue-700 dark:text-blue-400">
                Secure login with email and password or magic link
              </p>
            </div>
            <div className="bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 rounded-lg p-4">
              <h3 className="font-semibold text-red-900 dark:text-red-300 mb-2">
                Google SSO
              </h3>
              <p className="text-sm text-red-700 dark:text-red-400">
                One-click sign in with your Google account
              </p>
            </div>
            <div className="bg-gray-50 dark:bg-gray-700 border border-gray-200 dark:border-gray-600 rounded-lg p-4">
              <h3 className="font-semibold text-gray-900 dark:text-gray-300 mb-2">
                Microsoft & Apple
              </h3>
              <p className="text-sm text-gray-700 dark:text-gray-400">
                Enterprise and Apple ID authentication support
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

