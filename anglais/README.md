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

## Mécanique

- **XP** : 10 par leçon, +5 sans erreur ; objectif quotidien réglable (10 à 50 XP)
- **Série** : nombre de jours consécutifs avec au moins une leçon
- **Cœurs** : 5, un de perdu par erreur, un regagné toutes les 30 minutes (désactivable)
- **Révision** : chaque erreur revient après 1, 3 puis 7 jours jusqu'à être maîtrisée
- Clavier : chiffres pour choisir, Entrée pour valider, Retour arrière pour retirer un mot

La progression est enregistrée dans le `localStorage` du navigateur. Ouverte comme Artifact
claude.ai, l'app enregistre aussi la progression sur le compte Claude et active l'onglet **Coach**
(correction de textes libres par Claude).
