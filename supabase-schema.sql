-- Carte de prospection Myrmeo : table de suivi
-- À jouer une seule fois dans l'éditeur SQL du projet Supabase « NEVE »
-- (le même que Neve et le coach : préfixe prosp_ pour cohabiter proprement).

create table if not exists prosp_suivi (
  user_id      uuid not null default auth.uid() references auth.users(id) on delete cascade,
  id           text not null,                    -- identifiant OpenStreetMap, ex. "node/123456"
  nom          text,
  type         text,
  adresse      text,
  tel          text,
  web          text,
  lat          double precision,
  lon          double precision,
  statut       text not null default 'a_qualifier',
  action       text,                             -- prochaine action
  date_action  date,
  source       text,
  motif        text,                             -- renseigné sur les écartés
  type_mission text,                             -- pilote gratuit / payant, sur les gagnés
  notes        text,
  hist         jsonb not null default '[]'::jsonb,
  maj          date default current_date,
  updated_at   timestamptz default now(),
  primary key (user_id, id)
);

-- Accès strictement privé : chacun ne voit et ne modifie que ses propres lignes.
alter table prosp_suivi enable row level security;

drop policy if exists "prosp select" on prosp_suivi;
drop policy if exists "prosp insert" on prosp_suivi;
drop policy if exists "prosp update" on prosp_suivi;
drop policy if exists "prosp delete" on prosp_suivi;

create policy "prosp select" on prosp_suivi for select using (auth.uid() = user_id);
create policy "prosp insert" on prosp_suivi for insert with check (auth.uid() = user_id);
create policy "prosp update" on prosp_suivi for update using (auth.uid() = user_id);
create policy "prosp delete" on prosp_suivi for delete using (auth.uid() = user_id);

-- Recherche des actions échues (l'onglet Aujourd'hui).
create index if not exists prosp_suivi_action_idx on prosp_suivi (user_id, date_action);
