# Anglais Pro

Application d'entraînement à l'anglais professionnel, façon Duolingo : 5 minutes par jour, des
leçons courtes, une série de jours à tenir.

**En ligne (après fusion sur `main`) : https://guillaumecohenmikula.github.io/myrmeo-prospection/anglais/**

Un seul fichier, `index.html`, sans dépendance ni serveur. En local :
`python3 -m http.server 8777` à la racine du dépôt, puis http://localhost:8777/anglais/.

## Contenu

8 unités, 22 leçons, niveaux B1 à B2 : emails, téléphone et visio, réunions, prospection et vente,
négociation, chiffres et présentations, faux amis et pièges de grammaire, small talk et réseau.
Les explications sont en français.

## Exercices

- QCM et phrases à trou, avec l'explication de la règle après chaque réponse
- Phrase à reconstruire à partir du français (banque de mots)
- Dictée : la phrase est lue par la synthèse vocale du navigateur, accent britannique ou américain
- Paires de vocabulaire
- **À l'oral, dans chaque leçon** : une phrase à lire à voix haute et une phrase à traduire à l'oral

## Onglet Oral

- **Dialogues guidés** (6) : prospection, visio client, report de rendez-vous, négociation, small talk,
  présentation de chiffres. L'interlocuteur parle, on t'indique en français quoi exprimer, tu réponds
  à voix haute. Option « écoute pure » pour masquer le texte.
- **Prononciation** (5 séries) : le son TH, les mots piégeux (schedule, Wednesday, receipt…),
  l'accent tonique, le H et les terminaisons -ED, chiffres et dates. Les mots mal prononcés
  apparaissent en rouge.
- **Discussions avec Claude** : 9 situations (prospection, découverte, négociation, client mécontent,
  small talk, parler de ton activité, entretien, tendances, discussion libre) ou un sujet de ton
  choix. Claude répond à voix haute, corrige tes répliques (en direct ou seulement dans le bilan)
  et termine par un bilan. Boutons « Répéter » et « Plus lentement ». Avec le micro du navigateur,
  le mode **mains libres** rouvre le micro dès que Claude a fini de parler : on discute comme au
  téléphone.

Les discussions et le coach fonctionnent :
- dans l'Artifact claude.ai, avec ton compte Claude ;
- sur la version en ligne, si tu ajoutes une clé API Anthropic dans Profil (facultatif, facturée à
  l'usage sur ton compte Anthropic, quelques centimes par discussion). La clé reste dans le
  `localStorage` du navigateur et sert seulement aux appels vers l'API, via le SDK officiel
  `@anthropic-ai/sdk` chargé depuis jsDelivr.

La reconnaissance vocale utilise le micro du navigateur (Chrome, Edge, Safari) quand l'app est
ouverte directement, par exemple sur GitHub Pages. Dans un Artifact claude.ai, le micro du navigateur
est bloqué : on répond avec la dictée du clavier du téléphone.

## Mécanique

- **Usage illimité** : pas de cœurs ni de vies, toutes les leçons sont ouvertes dès le départ
- **XP** : 10 par leçon, +5 sans erreur ; objectif quotidien réglable (10 à 50 XP)
- **Série** : nombre de jours consécutifs avec au moins une leçon
- **Révision** : chaque erreur revient après 1, 3 puis 7 jours jusqu'à être maîtrisée
- Clavier : chiffres pour choisir, Entrée pour valider, Retour arrière pour retirer un mot

La progression est enregistrée dans le `localStorage` du navigateur. Ouverte comme Artifact
claude.ai, l'app enregistre aussi la progression sur le compte Claude et active l'onglet **Coach**
(correction de textes libres par Claude).
