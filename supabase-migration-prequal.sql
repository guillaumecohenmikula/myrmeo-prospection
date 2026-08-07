-- Pré-qualification automatique des commerces (ajout du 2026-08-07).
-- À jouer une seule fois dans l'éditeur SQL du projet Supabase « cockpit »
-- (glimlqyclhfzpdvsnulb), après supabase-schema.sql.
--
-- Contexte : OpenStreetMap ne renseigne le site que d'un commerce sur quatre, donc
-- « pas de site dans OSM » ne prouvait rien, alors que l'absence de site est le signal
-- d'achat n°1 du pilier web. Ces colonnes portent le résultat d'une vérification réelle
-- (recherche web + requête HTTP) faite par l'agent d'enrichissement, et la note qui en
-- découle. Le champ site_ok existant reste la réponse courte oui/non ; ces colonnes
-- disent pourquoi.

alter table prosp_suivi add column if not exists site_etat     text;  -- vivant | mort | parque | reseau_social | annuaire | amateur | aucun
alter table prosp_suivi add column if not exists site_mobile   text;  -- oui | non | vide
alter table prosp_suivi add column if not exists enseigne      text;  -- franchise ou réseau détecté
alter table prosp_suivi add column if not exists prequal_note  text;  -- A | B | C | ecarte
alter table prosp_suivi add column if not exists prequal_motif text;  -- une phrase, lisible en tournée
alter table prosp_suivi add column if not exists prequal_date  date;  -- pour re-vérifier ce qui date

-- L'onglet de tournée trie sur la note : index dédié.
create index if not exists prosp_suivi_prequal_idx on prosp_suivi (user_id, prequal_note);
