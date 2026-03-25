-- ============================================
-- MADEIRA UNVEILED — Supabase Database Setup
-- Run this in your Supabase SQL Editor
-- ============================================

-- 1. BOOKINGS TABLE
create table if not exists bookings (
  id          text primary key,
  fname       text not null,
  lname       text not null,
  email       text not null,
  phone       text,
  tour        text not null check (tour in ('Morning Tour', 'Afternoon Tour', 'Full Day Tour')),
  date        date not null,
  guests      integer not null default 1 check (guests between 1 and 8),
  notes       text default '',
  status      text not null default 'confirmed' check (status in ('confirmed', 'pending', 'cancelled')),
  total_price integer generated always as (
    case when tour = 'Full Day Tour' then guests * 120 else guests * 65 end
  ) stored,
  created_at  timestamptz default now()
);

-- 2. Enable Row Level Security (keeps data safe)
alter table bookings enable row level security;

-- 3. Policy: allow all operations from your app (uses anon key)
create policy "Allow all for anon" on bookings
  for all using (true) with check (true);

-- 4. Index on date for fast calendar queries
create index if not exists bookings_date_idx on bookings (date);

-- 5. Index on email for search
create index if not exists bookings_email_idx on bookings (email);

-- 6. Optional: view of upcoming bookings
create or replace view upcoming_bookings as
  select * from bookings
  where date >= current_date
    and status != 'cancelled'
  order by date asc;

-- ============================================
-- DONE! Your database is ready.
-- Next: copy your Supabase URL and anon key
-- into the config section of index.html
-- ============================================
