# MAIA - Multi-Authentication Integration App

A modern Next.js application with multiple authentication methods including Email/Password, Email Magic Link, Google SSO, Apple ID, and Microsoft login.

## Features

- ✅ Email/Password authentication
- ✅ Email Magic Link authentication
- ✅ Google SSO login
- ✅ Apple ID login
- ✅ Microsoft (Azure AD) login
- ✅ Beautiful, modern UI with dark mode support
- ✅ Secure session management
- ✅ User registration and login

## Getting Started

### Prerequisites

- Node.js 18+ and npm/yarn/pnpm
- A database (SQLite is configured by default, but you can use PostgreSQL/MySQL)

### Installation

1. Clone the repository and install dependencies:

```bash
npm install
```

2. Set up environment variables:

Copy `.env.example` to `.env` and fill in your credentials:

```bash
cp .env.example .env
```

3. Generate a NextAuth secret:

```bash
openssl rand -base64 32
```

Add this to your `.env` file as `NEXTAUTH_SECRET`.

4. Set up the database:

```bash
npx prisma generate
npx prisma db push
```

5. Run the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## OAuth Provider Setup

### Google OAuth

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable Google+ API
4. Go to "Credentials" → "Create Credentials" → "OAuth 2.0 Client ID"
5. Add authorized redirect URI: `http://localhost:3000/api/auth/callback/google`
6. Copy Client ID and Client Secret to `.env`

### Microsoft (Azure AD)

1. Go to [Azure Portal](https://portal.azure.com/)
2. Navigate to "Azure Active Directory" → "App registrations"
3. Create a new registration
4. Add redirect URI: `http://localhost:3000/api/auth/callback/azure-ad`
5. Go to "Certificates & secrets" to create a client secret
6. Copy Application (client) ID, Directory (tenant) ID, and Client secret to `.env`

### Apple ID

1. Go to [Apple Developer Portal](https://developer.apple.com/)
2. Create a Services ID
3. Configure Sign in with Apple
4. Create a private key for Sign in with Apple
5. Add redirect URI: `http://localhost:3000/api/auth/callback/apple`
6. Copy Service ID, Team ID, Key ID, and Private Key to `.env`

### Email Configuration

For email magic link authentication, configure SMTP settings in `.env`:

- Gmail: Use an [App Password](https://support.google.com/accounts/answer/185833)
- Other providers: Use your SMTP server details

## Project Structure

```
├── app/
│   ├── api/
│   │   └── auth/
│   │       ├── [...nextauth]/route.ts  # NextAuth configuration
│   │       └── signup/route.ts         # User registration API
│   ├── components/
│   │   ├── Dashboard.tsx               # Protected dashboard page
│   │   └── LoginForm.tsx              # Login/signup form
│   ├── login/
│   │   └── page.tsx                   # Login page
│   ├── verify-email/
│   │   └── page.tsx                   # Email verification page
│   ├── layout.tsx                     # Root layout
│   ├── page.tsx                       # Home page (redirects to login/dashboard)
│   └── providers.tsx                  # Session provider
├── prisma/
│   └── schema.prisma                  # Database schema
└── package.json
```

## Technologies Used

- **Next.js 14** - React framework with App Router
- **NextAuth.js** - Authentication library
- **Prisma** - Database ORM
- **TypeScript** - Type safety
- **Tailwind CSS** - Styling
- **bcryptjs** - Password hashing

## Security Notes

- Passwords are hashed using bcrypt
- Sessions are managed securely with JWT
- OAuth flows follow best practices
- Environment variables are used for sensitive data

## License

MIT

