# Carte de prospection Myrmeo

Tous les commerces autour de toi sont déjà sur la carte. Ton travail : cliquer un commerce et lui
donner un statut. Le suivi se construit tout seul, en carte et en tableau.

## Lancer

```bash
cd projects/activite-services/prospection/carte && python3 -m http.server 8777
```

Puis **http://localhost:8777**.

> Passe par le serveur local, pas par un double-clic : en `file://`, le navigateur bloque le
> chargement des commerces.

## Comment ça marche

**Les commerces se chargent tout seuls.** Dès que tu déplaces ou zoomes la carte, le secteur est
interrogé et tous les commerces apparaissent : petits cercles blancs pour ceux que tu n'as pas
encore traités, points colorés pour ceux de ton suivi. Chaque commerce arrive avec **nom, activité,
adresse, téléphone et site web** quand l'info existe.

Un secteur chargé **reste en mémoire** : au prochain lancement il s'affiche immédiatement, même si
les serveurs OpenStreetMap sont saturés. Le compteur « X commerces en mémoire » est sous les filtres,
avec un lien pour vider si besoin (ton suivi, lui, n'est jamais effacé par ce bouton).

**Pour qualifier** : clique un point. La fiche s'ouvre avec les infos, un lien vers Google Maps, les
huit statuts, la prochaine action et sa date, la source, les notes de terrain, et l'historique daté
des changements. Tu cliques un statut, c'est enregistré. Pour sortir un commerce du pipeline,
« Retirer du pipeline » en bas de la fiche.

## Le pipeline

Chaque statut a un **critère d'entrée objectif**. Si tu hésites entre deux, c'est que le critère
n'est pas rempli : reste au précédent.

| Statut | Critère d'entrée |
|---|---|
| À qualifier | Repéré, tu ne sais pas encore si c'est une cible |
| À contacter | C'est une cible (pas une franchise, vrai décideur, besoin plausible) |
| Approché | Tu as tenté : passage, appel, message. Pas encore parlé au décideur |
| Découverte faite | L'audit 30 min a eu lieu **avec le décideur** |
| Proposition envoyée | Devis ou proposition écrite remise |
| Gagné | Signé |

Deux sorties, à ne surtout pas confondre :

| Sortie | Ce qu'elle impose |
|---|---|
| **Pas maintenant** | Intérêt réel, mauvais moment. **Mets une date de réactivation**, il remontera tout seul dans Aujourd'hui |
| **Écarté** | Hors cible ou refus définitif. **Renseigne le motif**, c'est ce qui t'apprendra si ton problème est le ciblage ou le discours |

## Les trois champs qui comptent plus que le statut

**Prochaine action + date.** La règle : *aucun prospect actif ne dort sans date*. Ceux qui n'en ont
pas remontent dans l'onglet Aujourd'hui, section « Sans prochaine action ». Donne-leur une action ou
écarte-les, mais ne les laisse pas traîner.

**Motif de sortie**, sur les écartés. Après trente prospects, la répartition des motifs te dira quoi
corriger.

**Source** (visite, téléphone, recommandation, LinkedIn, site). C'est ce qui te dira quel canal
produit vraiment, donc où remettre tes heures.

Sur un Gagné, un champ **type de mission** distingue pilote gratuit et payant : ne confonds pas
activité et revenu.

## Les trois onglets

**Aujourd'hui** : ta liste de travail. Ce qui est échu, ce qui est à réactiver, ce qui dort. Le badge
rouge sur l'onglet compte ce qui t'attend. Commence toujours par là.

**Carte** : le terrain. Tous les commerces sont là, tu cliques pour qualifier.

**Pipeline** : le tableau complet, triable, exportable en CSV.

## Lire l'entonnoir

Les chiffres absolus ne servent à rien, les **taux de passage** oui. Chaque étape compte ceux qui
l'ont atteinte au moins une fois, historique compris, donc les taux sont toujours décroissants.

- Beaucoup d'**Approchés** qui ne deviennent pas **Découvertes** → ton accroche ou tes horaires de passage
- Beaucoup de **Découvertes** sans **Proposition** → tu ne conclus pas, ou tu vises mal
- Beaucoup de **Propositions** sans **Gagné** → ton prix ou la valeur perçue

## Les filtres

- **Commerces affichés** : artisans, commerces, bureaux, santé, restauration. Filtre l'affichage
  sans rien recharger.
- **Seulement ceux sans site web** : c'est ton signal d'achat le plus fort pour le pilier web.
- **Seulement mon suivi** : masque tout le reste pour y voir clair.
- Les pastilles de statut filtrent la carte et le tableau en même temps.
- La recherche en haut du pipeline cherche dans les noms, les rues et les activités.

## Sauvegarde

Tout vit dans le `localStorage` de ton navigateur. **Vider le cache du navigateur efface tout.**
Utilise **Sauvegarder** régulièrement (fichier JSON) et **Restaurer** pour recharger.

## Limites à connaître

- **Les données viennent d'OpenStreetMap, pas de Google.** La couverture des commerces est bonne mais
  pas parfaite. Surtout : **l'absence de site web dans OSM ne prouve pas qu'il n'y en a pas**, c'est
  un indice à vérifier avant d'attaquer un commerce là-dessus.
- **Les serveurs OpenStreetMap sont publics et parfois saturés.** Si le message « Serveurs OSM
  occupés » apparaît, clique Réessayer ou reviens quelques minutes plus tard. Trois serveurs sont
  essayés l'un après l'autre, et ce qui est déjà en mémoire reste affiché.
- **Zoome un peu si rien n'apparaît** : en dessous d'un certain niveau de zoom, le chargement est
  désactivé pour ne pas ramener des milliers de points.
