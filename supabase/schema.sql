-- Run in the Supabase SQL Editor before connecting Artha360.
-- This table intentionally holds only browser-encrypted payloads.
create table if not exists public.artha_sync_records (
  user_id uuid not null references auth.users(id) on delete cascade,
  record_key text not null,
  entity text not null check (entity in ('accounts','balanceItems','transactions','events','budgets','goals')),
  payload jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, record_key)
);

alter table public.artha_sync_records enable row level security;
revoke all on table public.artha_sync_records from anon;
grant select, insert, update, delete on table public.artha_sync_records to authenticated;

create policy "Users select own encrypted Artha360 data" on public.artha_sync_records for select to authenticated using ((select auth.uid()) = user_id);
create policy "Users insert own encrypted Artha360 data" on public.artha_sync_records for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users update own encrypted Artha360 data" on public.artha_sync_records for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Users delete own encrypted Artha360 data" on public.artha_sync_records for delete to authenticated using ((select auth.uid()) = user_id);

create index if not exists artha_sync_records_user_updated_idx on public.artha_sync_records (user_id, updated_at desc);
