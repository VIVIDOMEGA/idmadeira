# 🌿 Madeira Unveiled — Complete Setup Guide

## What you have (3 files)
- `index.html`       → Your full website (tours, booking form, calendar, database)
- `supabase-setup.sql` → Run this in Supabase to create your database
- `deploy.yml`       → GitHub Actions auto-deploy workflow

---

## STEP 1 — Get your free Supabase database (5 minutes)

1. Go to https://supabase.com and sign up (free)
2. Click "New project" → name it "madeira-unveiled"
3. Go to **SQL Editor** → paste everything from `supabase-setup.sql` → click Run
4. Go to **Settings → API** and copy:
   - **Project URL** (looks like: https://xxxx.supabase.co)
   - **anon / public key** (long string starting with eyJ...)

5. Open `index.html` and find these two lines near the bottom:
   ```
   const SUPABASE_URL = 'YOUR_SUPABASE_URL';
   const SUPABASE_KEY = 'YOUR_SUPABASE_ANON_KEY';
   ```
   Replace with your real values. Save the file.

✅ Your bookings now save to a real cloud database!

---

## STEP 2 — Host your site free on Netlify (5 minutes)

### Option A: Drag & Drop (easiest, no GitHub needed)
1. Go to https://netlify.com → sign up free
2. Drag your entire project folder onto the Netlify dashboard
3. Your site is live at a URL like: https://random-name.netlify.app
4. Optional: Go to Site settings → Domains → add your own domain

### Option B: GitHub + Auto-deploy (recommended for updates)
1. Create a free GitHub account at https://github.com
2. Create a new repository called "madeira-unveiled"
3. Upload your 3 files to the repo
4. In Netlify: "Add new site" → "Import from GitHub" → select your repo
5. Netlify auto-deploys every time you push a change → done!

---

## STEP 3 — Auto-deploy setup (if using GitHub)

The `deploy.yml` file handles automatic deployment. To activate it:

1. In your GitHub repo, create folder: `.github/workflows/`
2. Put `deploy.yml` inside that folder
3. In Netlify: Site settings → API → copy **Site ID**
4. In Netlify: User settings → Personal access tokens → **New token** → copy it
5. In GitHub repo: Settings → Secrets and variables → Actions → add:
   - `NETLIFY_AUTH_TOKEN` = your Netlify personal access token
   - `NETLIFY_SITE_ID`    = your Netlify site ID

Now every push to `main` branch deploys automatically in ~30 seconds!

---

## STEP 4 — Calendar Integration

### Export all bookings → .ics file (works with everything)
- In your Reservations table, click **"Export .ics"**
- Open the downloaded file — it imports into:
  - Google Calendar (double-click .ics or File → Import)
  - Apple Calendar (double-click .ics)
  - Outlook (double-click .ics or File → Open & Export)

### Add single booking to Google Calendar
- Click **"Add Next to Google Calendar"** — opens Google Calendar pre-filled

### Real-time sync (advanced — optional)
To have bookings appear automatically in Google Calendar without manual export:
- Set up a Google Apps Script that reads from Supabase and writes to Google Calendar
- Or use Zapier (free tier): Supabase → Google Calendar automation

---

## STEP 5 — Custom Domain (optional, ~€10/year)

1. Buy a domain at Cloudflare Registrar (cheapest) or Namecheap
   - Suggestion: madeiraunveiled.pt or madeiratours.pt
2. In Netlify: Site settings → Domain management → Add custom domain
3. Follow DNS instructions (takes ~10 minutes to go live)

---

## Monthly Costs Summary

| Service      | Free Tier Includes              | Paid if you exceed |
|-------------|--------------------------------|-------------------|
| Netlify      | 100GB bandwidth, unlimited sites | $19/mo            |
| Supabase     | 500MB database, 50,000 rows     | $25/mo            |
| Domain       | —                               | ~€10/year         |
| **Total**    | **€0/month**                   | ~€44/mo if large  |

For a tour business doing under ~500 bookings/month, you stay on the free tier indefinitely.

---

## Checklist

- [ ] Supabase project created
- [ ] SQL schema run in Supabase SQL Editor  
- [ ] SUPABASE_URL and SUPABASE_KEY added to index.html
- [ ] Site uploaded to Netlify (drag & drop or GitHub)
- [ ] Custom domain added (optional)
- [ ] GitHub Actions deploy.yml set up (optional)
- [ ] Test booking submitted and visible in Reservations table
- [ ] Calendar export tested

---

## Need help?
- Supabase docs: https://supabase.com/docs
- Netlify docs: https://docs.netlify.com
- GitHub Actions: https://docs.github.com/actions
