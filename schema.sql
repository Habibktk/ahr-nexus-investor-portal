-- AHR Nexus Investor Portal SQL Schema
create extension if not exists "pgcrypto";

create table public.investors (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade not null unique,
  full_name text not null,
  email text not null,
  phone text,
  joined_at date default current_date,
  dollar_rate numeric default 290,
  is_admin boolean default false,
  last_updated_by text,
  created_at timestamptz default now()
);

create table public.investment_entries (
  id uuid primary key default gen_random_uuid(),
  investor_id uuid references public.investors(id) on delete cascade not null,
  entry_date date not null default current_date,
  entry_time time not null default current_time,
  amount_usdt numeric not null default 0,
  amount_pkr numeric not null default 0,
  dollar_rate numeric not null default 290,
  type text not null check (type in ('Deposit','Reinvestment','Withdrawal','Profit')),
  note text,
  created_at timestamptz default now()
);

create table public.reports (
  id uuid primary key default gen_random_uuid(),
  investor_id uuid references public.investors(id) on delete cascade not null,
  month text not null,
  starting_capital numeric default 0,
  added_investment numeric default 0,
  profit_percent numeric default 0,
  profit_amount numeric default 0,
  withdrawn_amount numeric default 0,
  remaining_balance numeric default 0,
  created_at timestamptz default now()
);

create table public.admin_notes (
  id uuid primary key default gen_random_uuid(),
  investor_id uuid references public.investors(id) on delete cascade not null,
  note text not null,
  created_at timestamptz default now()
);

alter table public.investors enable row level security;
alter table public.investment_entries enable row level security;
alter table public.reports enable row level security;
alter table public.admin_notes enable row level security;

create or replace function public.is_admin()
returns boolean language sql security definer as $$
  select exists(select 1 from public.investors where user_id = auth.uid() and is_admin = true);
$$;

create policy "investor can read own profile or admin all" on public.investors for select using (user_id = auth.uid() or public.is_admin());
create policy "admin can insert investors" on public.investors for insert with check (public.is_admin());
create policy "admin can update investors" on public.investors for update using (public.is_admin());
create policy "admin can delete investors" on public.investors for delete using (public.is_admin());

create policy "investor reads own entries or admin all" on public.investment_entries for select using (investor_id in (select id from public.investors where user_id = auth.uid()) or public.is_admin());
create policy "admin inserts entries" on public.investment_entries for insert with check (public.is_admin());
create policy "admin updates entries" on public.investment_entries for update using (public.is_admin());
create policy "admin deletes entries" on public.investment_entries for delete using (public.is_admin());

create policy "investor reads own reports or admin all" on public.reports for select using (investor_id in (select id from public.investors where user_id = auth.uid()) or public.is_admin());
create policy "admin inserts reports" on public.reports for insert with check (public.is_admin());
create policy "admin updates reports" on public.reports for update using (public.is_admin());
create policy "admin deletes reports" on public.reports for delete using (public.is_admin());

create policy "investor reads own notes or admin all" on public.admin_notes for select using (investor_id in (select id from public.investors where user_id = auth.uid()) or public.is_admin());
create policy "admin manages notes" on public.admin_notes for all using (public.is_admin()) with check (public.is_admin());
