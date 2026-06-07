# Skill Swap — Phase 1 Setup

You'll do this once. After that, `flutter run` is all you need.

## What's already done

Claude already:

- installed Flutter SDK at `C:\src\flutter` and put it on your user PATH
- created the project at `C:\src\skill_swap`
- wrote all the Phase 1 code (auth, profile, routing)
- installed `flutterfire_cli`

What's left is on the Firebase side, because only you can log into your Google account.

## 1) Create the Firebase project (browser)

1. Go to https://console.firebase.google.com
2. **Add project** → name it `skill-swap` → continue. Disable Google Analytics for now (you can turn it on in Phase 6).
3. Wait for "Your new project is ready" → **Continue**.

### Enable services

In the left nav of the new project:

1. **Build → Authentication → Get started → Sign-in method tab**
   - Click **Email/Password** → toggle **Enable** → **Save**.
2. **Build → Firestore Database → Create database**
   - Choose **Start in production mode** → pick a region close to you (e.g. `nam5` or `eur3`) → **Enable**.
3. **Build → Storage → Get started**
   - Accept defaults (production mode) → **Done**.
4. **Build → Cloud Messaging** — nothing to do here for Phase 1; we'll wire it up in Phase 4.

## 2) Connect your code to your Firebase project

Open a terminal in the project directory:

```bash
cd /c/src/skill_swap
flutterfire configure
```

A browser will pop up to log in. Then in the terminal:

- Pick your `skill-swap` project from the list.
- When asked which platforms to configure, select: **android** and **web** (use space to toggle, enter to confirm). iOS is unbuildable on Windows; we'll add it later from a Mac.
- Accept the default `firebase_options.dart` location.

This **overwrites** `lib/firebase_options.dart` with real keys for your project. From this point the app will be able to talk to Firebase.

## 3) Paste security rules into the console

There are two `.rules` files in the project root.

**Firestore rules** (`firestore.rules`):
1. Firebase Console → **Firestore Database → Rules**
2. Replace the entire content with `firestore.rules` from this project.
3. **Publish**.

**Storage rules** (`storage.rules`):
1. Firebase Console → **Storage → Rules**
2. Replace the entire content with `storage.rules` from this project.
3. **Publish**.

> Why this matters: without these rules, any signed-in user could rewrite anyone else's profile or set their own rating to 5 stars. The rules lock down those fields so only Cloud Functions (Phase 5) can change them.

## 4) Run it

```bash
cd /c/src/skill_swap
flutter run -d edge
```

This launches in Microsoft Edge. You should see a sign-in screen.

### Test the flow

1. Click **Don't have an account? Sign up**.
2. Enter `you@example.com` / `password123` / `password123` → **Sign up**.
3. You should land on **Set up your profile**. Tap the avatar circle, pick any image, type an alias (3–24 chars), **Continue**.
4. You should land on the home screen showing your alias and photo.
5. Click the **logout** icon → you go back to sign-in. Sign in again with the same email/password → you should jump straight to home.

If any step fails, copy the error and ask me — most issues at this stage are about (a) services not enabled in the Firebase Console or (b) `flutterfire configure` not run.

## Optional: Android emulator

The Android side needs SDK 36 (you currently have 35). To install:

1. Open **Android Studio** → **Tools → SDK Manager**
2. Under **SDK Platforms**, check **Android 16.0 (API 36)** → **Apply**.
3. Open **Tools → Device Manager → Create device** → pick **Pixel 7** → system image **API 36** → **Finish**.
4. Start the emulator from Device Manager (▶ button).
5. In a terminal: `flutter run -d emulator-5554` (or whatever ID `flutter devices` shows).

## Phase 1.5: Google sign-in (later)

Email/password is enough to ship Phase 1. To add Google sign-in:

1. In Firebase Console → Authentication → Sign-in method → enable **Google**.
2. Generate a debug SHA-1 fingerprint:
   ```bash
   "/c/Program Files/Android/Android Studio/jbr/bin/keytool" -list -v \
     -alias androiddebugkey \
     -keystore "$HOME/.android/debug.keystore" \
     -storepass android -keypass android
   ```
3. Copy the SHA-1 → Firebase Console → Project settings → Your Android app → **Add fingerprint**. Repeat for SHA-256.
4. Re-run `flutterfire configure` so the new `google-services.json` is downloaded.
5. Tell me you're ready and I'll add the Google sign-in button + provider code.
