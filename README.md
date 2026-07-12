# Kazi

Connecting ALU students with ALU student-led startups for internship opportunities.

Students discover and apply to internships posted by verified startups, founders manage
their startup profile and review applicants, and admins verify startups, moderate the
platform, and configure the shared category lists everyone else fills their forms from.

## Features

- **Authentication & onboarding** — email/password sign-up, role selection (student or
  founder), password reset
- **Student profile** — bio, degree, skills, interests, links, CV upload
- **Founder & startup profile** — startup details, verification document submission,
  hiring status
- **Admin-managed categories** — industries, startup stages, skills, interests,
  opportunity categories, and required verification documents are all configurable from
  the admin panel, not hardcoded
- **Opportunities** — founders post, edit, and close internships; students browse,
  search, filter, and bookmark, with a skill-match score and a recommended feed
- **Applications** — cover note + CV + portfolio, with a status pipeline (Applied →
  Under Review → Interview → Accepted/Rejected)
- **Chat** — real-time messaging between a student and a founder
- **Notifications** — in-app notification center with unread badge
- **Ratings & reports** — students rate a startup after being accepted; anyone can
  report a startup for admin review
- **Admin panel** — dashboard, startup verification & suspension, user management,
  category management, report moderation

## Tech stack

Flutter (managed via [fvm](https://fvm.app)) + Riverpod + go_router, backed by Firebase
(Auth, Firestore) and Cloudinary for file uploads.

## Getting started

1. **Clone and install Flutter via fvm**

   ```bash
   git clone https://github.com/Anglebert-Dev/Kazi
   cd kazi
   fvm install
   fvm flutter pub get
   ```

2. **Connect Firebase**

   Create a Firebase project with Auth (email/password) and Firestore enabled, then run:

   ```bash
   fvm flutter pub global activate flutterfire_cli
   flutterfire configure
   ```

   Deploy the included security rules:

   ```bash
   firebase deploy --only firestore:rules
   ```

3. **Set up Cloudinary**

   Create a free [Cloudinary](https://cloudinary.com) account and an unsigned upload
   preset — used for avatars, logos, CVs, and verification documents.

4. **Configure environment variables**

   Copy `.env.example` to `.env` and fill in your Cloudinary credentials plus the name,
   email, and password for the admin account that should be created automatically the
   first time the app runs:

   ```bash
   cp .env.example .env
   ```

5. **Run the app**

   ```bash
   fvm flutter run
   ```

The admin account bootstraps itself from `.env` on first launch — no manual Firestore
setup needed. Log in with those credentials to configure categories before students and
founders start using the app.
