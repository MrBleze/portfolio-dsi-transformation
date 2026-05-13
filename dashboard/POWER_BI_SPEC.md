# 📊 Spécification Dashboard Power BI
## Pilotage Transformation Digitale — Secteur Énergie/Industrie

---

## Architecture du rapport (3 pages)

---

### PAGE 1 — Vue CODIR : Portefeuille & Budget

**Objectif** : Donner au CODIR une lecture instantanée de l'avancement du programme.

#### Visuels à créer

| Visual | Type Power BI | Données |
|--------|--------------|---------|
| Nb projets total | Carte KPI | COUNTROWS(projets) |
| Budget consommé / alloué | Carte KPI double | SUM budget_consomme / budget_alloue |
| Taux avancement moyen | Jauge (0-100%) | AVG avancement_pct |
| Nb projets en retard | Carte KPI (alerte rouge) | COUNTROWS statut = En retard |
| Portefeuille par statut | Graphique en anneau | COUNT par statut |
| Budget par catégorie | Barres groupées | Alloué vs Consommé par catégorie |
| Avancement par BU | Barres horizontales | AVG avancement par business_unit |
| ROI estimé vs réalisé | Graphique points/ligne | Projets terminés uniquement |

#### Mesures DAX

```dax
// Budget total alloué
Budget Alloué Total =
SUM(projets[budget_alloue])

// Taux consommation
Taux Consommation =
DIVIDE(SUM(projets[budget_consomme]), SUM(projets[budget_alloue]))

// Dépassement budget
Dépassement Budget =
SUM(projets[budget_consomme]) - SUM(projets[budget_alloue])

// Projets en retard
Nb Projets En Retard =
CALCULATE(COUNTROWS(projets), projets[statut] = "En retard")

// Avancement moyen programme
Avancement Moyen =
AVERAGE(projets[avancement_pct])

// ROI moyen réalisé
ROI Moyen Réalisé =
CALCULATE(AVERAGE(projets[roi_realise]),
    projets[statut] = "Terminé",
    NOT ISBLANK(projets[roi_realise]))
```

#### Filtres (slicers)
- Année (date_debut)
- Business Unit
- Catégorie projet
- Priorité (Critique / Haute / Moyenne / Basse)

---

### PAGE 2 — Vue DSI : Jalons & Charge Équipes

**Objectif** : Permettre à la DSI de piloter l'avancement opérationnel et la charge.

#### Visuels à créer

| Visual | Type Power BI | Données |
|--------|--------------|---------|
| Timeline jalons | Gantt (visuel custom) | date_prevue par projet |
| Jalons en retard | Table avec mise en forme cond. | statut_jalon = En retard |
| Charge équipes IT | Barres empilées | Ressources mobilisées / capacité |
| Taux de charge par équipe | Jauge par équipe | ressources_mobilisees / nb_ressources |
| Projets par chef de projet | Matrice | Chef projet > projets > avancement |
| Budget mensuel prévu vs réel | Courbe double | Table suivi_budget |

#### Mesures DAX

```dax
// Taux de charge équipe
Taux Charge Equipe =
DIVIDE(
    CALCULATE(SUM(projets[nb_ressources]),
        projets[statut] IN {"En cours","En retard"}),
    MAX(equipes_it[nb_ressources])
)

// Jalons en retard
Nb Jalons En Retard =
CALCULATE(COUNTROWS(jalons), jalons[statut] = "En retard")

// Écart budget mensuel
Ecart Budget Mensuel =
SUM(suivi_budget[budget_reel]) - SUM(suivi_budget[budget_prevu])
```

#### Mise en forme conditionnelle
- Taux de charge : vert < 80%, orange 80-95%, rouge > 95%
- Jalons : vert = Atteint, orange = À venir, rouge = En retard/Bloqué

---

### PAGE 3 — Vue Risques : Matrice & Alertes

**Objectif** : Identifier et prioriser les risques du programme.

#### Visuels à créer

| Visual | Type Power BI | Données |
|--------|--------------|---------|
| Matrice criticité | Matrice couleur (heatmap) | Probabilité vs Impact |
| Nb risques critiques | Carte KPI alerte | criticite = Critique AND statut = Ouvert |
| Risques par catégorie | Barres horizontales | COUNT par categorie |
| Tableau risques ouverts | Table détaillée | Filtré statut = Ouvert |
| Évolution risques dans le temps | Courbe | DATE ouverture par criticité |
| Projets les plus risqués | Barres | Nb risques ouverts par projet |

#### Mesures DAX

```dax
// Risques critiques ouverts
Risques Critiques Ouverts =
CALCULATE(COUNTROWS(risques),
    risques[criticite] = "Critique",
    risques[statut] = "Ouvert")

// Score risque global
Score Risque Global =
SUMX(risques,
    SWITCH(risques[criticite],
        "Critique", 4,
        "Élevée",   3,
        "Modérée",  2,
        1))
```

---

## Modèle de données Power BI

```
business_units (1) ──────< projets (N)
equipes_it     (1) ──────< projets (N)
                               │
                    ┌──────────┼──────────┐
                    │          │          │
               jalons (N)  risques (N)  suivi_budget (N)
```

**Relations à créer :**
- business_units[bu_id] → projets[bu_id] (1 à N)
- equipes_it[equipe_id] → projets[equipe_id] (1 à N)
- projets[projet_id] → jalons[projet_id] (1 à N)
- projets[projet_id] → risques[projet_id] (1 à N)
- projets[projet_id] → suivi_budget[projet_id] (1 à N)

---

## Charte graphique

| Élément | Couleur | Usage |
|---------|---------|-------|
| Primaire | #1A5276 | Titres, en-têtes |
| Terminé | #27AE60 | Statut terminé |
| En cours | #2E86C1 | Statut en cours |
| En retard | #E74C3C | Statut en retard / alertes |
| Planifié | #95A5A6 | Statut planifié |
| En pause | #F39C12 | Statut en pause |
| Critique | #C0392B | Risque critique |
| Fond | #F4F6F7 | Arrière-plan pages |
