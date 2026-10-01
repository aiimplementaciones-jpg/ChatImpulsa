-- IMPULSA MVP — esquema inicial para Supabase/PostgreSQL
create extension if not exists pgcrypto;

create table if not exists businesses (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  legal_name text,
  tax_id text,
  city text,
  address text,
  phone text,
  email text,
  logo_url text,
  google_review_url text,
  status text not null default 'Activo' check (status in ('Activo','Suspendido')),
  created_at timestamptz not null default now()
);

create table if not exists stand_batches (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  prefix text not null default 'IMP-',
  quantity integer not null check (quantity > 0),
  created_at timestamptz not null default now()
);

create table if not exists stands (
  id uuid primary key default gen_random_uuid(),
  serial text not null unique,
  batch_id uuid references stand_batches(id) on delete set null,
  status text not null default 'Disponible' check (status in ('Disponible','Asignado','Suspendido','Dañado','Perdido')),
  created_at timestamptz not null default now()
);

create table if not exists stand_assignments (
  id uuid primary key default gen_random_uuid(),
  stand_id uuid not null references stands(id) on delete cascade,
  business_id uuid not null references businesses(id) on delete cascade,
  assigned_at timestamptz not null default now(),
  unassigned_at timestamptz
);

create unique index if not exists one_active_assignment_per_stand
on stand_assignments(stand_id) where unassigned_at is null;

create table if not exists feedback (
  id uuid primary key default gen_random_uuid(),
  stand_id uuid references stands(id) on delete set null,
  business_id uuid not null references businesses(id) on delete cascade,
  rating integer not null check (rating between 1 and 5),
  customer_name text,
  customer_phone text,
  comment text,
  privacy_consent boolean not null default false,
  privacy_policy_version text,
  google_clicked boolean not null default false,
  created_at timestamptz not null default now()
);

create index if not exists feedback_business_created_idx on feedback(business_id, created_at desc);
create index if not exists feedback_rating_idx on feedback(rating);

-- V1: agregar autenticación/roles con Supabase Auth y RLS antes de producción.
