# AHR Nexus Investor Portal

Next.js + Tailwind CSS + Supabase investor dashboard with investor login, admin panel, RLS security, monthly reports, PDF export and WhatsApp support.

## Run locally
```bash
npm install
cp .env.example .env.local
npm run dev
```

## Supabase setup
1. Create Supabase project.
2. Open SQL Editor and run `supabase/schema.sql`.
3. Go to Authentication > Users and create your admin user.
4. In SQL Editor, run this after replacing email:
```sql
insert into public.investors (user_id, full_name, email, is_admin)
select id, 'Habib Admin', email, true from auth.users where email='YOUR_ADMIN_EMAIL';
```
5. For every investor: create Auth user, copy user id, then add investor from Admin Panel.

## Env variables
```env
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
NEXT_PUBLIC_ADMIN_EMAIL=
NEXT_PUBLIC_WHATSAPP_NUMBER=
```

## Deploy on Vercel
1. Push folder to GitHub.
2. Go to Vercel > Add New Project > Import GitHub repo.
3. Add the same environment variables.
4. Deploy. Your free URL will be like `ahr-nexus-investor-portal.vercel.app`.
