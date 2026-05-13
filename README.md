# 🏭 Pilotage de la Transformation Digitale — Secteur Énergie/Industrie

> **Portfolio Project** | Business Data Analyst Freelance  
> Stack : SQL · Power BI · Excel  
> Secteur : Énergie / Industrie

---

## 🎯 Contexte métier

Ce projet simule le pilotage du programme de transformation digitale d'un groupe industriel énergétique (type TotalEnergies, Engie) sur 3 ans.

La DSI pilote un portefeuille de **50 projets** répartis sur **5 Business Units**, avec un budget global de **32 M€** et **5 équipes IT** mobilisées.

L'objectif est de répondre aux 3 questions clés du CODIR :

1. **Où en est le programme ?** (avancement, budget, retards)
2. **Les équipes IT sont-elles surchargées ?** (charge, jalons, risques)
3. **Quels projets menacent le programme ?** (retards, dépassements, risques critiques)

---

## 📁 Structure du projet

```
portfolio-dsi-transformation/
│
├── sql/
│   ├── 01_schema.sql          # 6 tables (projets, BU, équipes, jalons, risques, budget)
│   ├── 02_seed_data.sql       # 50 projets, 30 jalons, 20 risques, suivi mensuel
│   └── 03_analyses.sql        # 8 requêtes analytiques
│
├── dashboard/
│   └── POWER_BI_SPEC.md       # Spécification complète 3 pages Power BI
│
├── screenshots/
│   └── dashboard-preview.png  # Aperçu du dashboard
│
└── README.md
```

---

## 🗃️ Modèle de données

```
business_units ──────< projets >────── equipes_it
                           │
              ┌────────────┼────────────┐
              │            │            │
         jalons (N)   risques (N)   suivi_budget (N)
```

| Table | Lignes | Description |
|-------|--------|-------------|
| business_units | 5 | Production, Raffinage, Distribution, Corporate, R&D |
| equipes_it | 5 | Data&BI, Infrastructure, Cybersécurité, Dev Apps, ERP |
| projets | 50 | Portefeuille complet sur 3 ans |
| jalons | 30 | Jalons clés des projets prioritaires |
| risques | 20 | Risques ouverts et mitigés |
| suivi_budget | 28 | Suivi mensuel 2024 des projets majeurs |

---

## 📊 Analyses SQL réalisées

| # | Requête | Indicateur clé |
|---|---------|---------------|
| 1 | KPIs Globaux Programme | Budget, avancement, ROI moyen |
| 2 | Portefeuille par catégorie | Data/IA, Infra, Cyber, ERP, Automatisation |
| 3 | Budget BU vs alloué | Taux consommation, écart, retards |
| 4 | Projets en retard | Dépassement budget, risques associés |
| 5 | ROI réalisé projets terminés | ROI estimé vs réalisé |
| 6 | Charge équipes IT | Ressources mobilisées / capacité |
| 7 | Matrice des risques | Criticité × catégorie |
| 8 | Jalons en retard | Jalons bloqués par priorité projet |

---

## 📈 Dashboard Power BI (3 pages)

### Page 1 — Vue CODIR
- KPIs programme : budget, avancement, nb retards, ROI
- Portefeuille par statut et catégorie
- Budget alloué vs consommé par BU

### Page 2 — Vue DSI
- Timeline jalons et alertes retards
- Taux de charge par équipe IT
- Suivi budget mensuel prévu vs réel

### Page 3 — Vue Risques
- Matrice criticité (heatmap probabilité × impact)
- Top projets à risque
- Tableau risques critiques ouverts

---

## 🔑 Concepts métier DSI couverts

| Terme | Définition |
|-------|-----------|
| **PMO** | Project Management Office — pilotage du portefeuille projets |
| **ROI** | Retour sur investissement du projet digital |
| **Taux de charge** | Ressources mobilisées / capacité totale équipe IT |
| **Jalon** | Étape clé d'un projet avec date d'engagement |
| **Criticité risque** | Probabilité × Impact — priorisation des risques |
| **NIS2** | Directive européenne cybersécurité (2024) |
| **OT/SCADA** | Systèmes de contrôle industriels (Operational Technology) |
| **MDM** | Master Data Management — gouvernance des données de référence |

---

## 🚀 Lancer le projet

```bash
# 1. Créer la base
sqlite3 transformation_digitale.db < sql/01_schema.sql

# 2. Injecter les données
sqlite3 transformation_digitale.db < sql/02_seed_data.sql

# 3. Lancer les analyses
sqlite3 transformation_digitale.db < sql/03_analyses.sql
```

---

## 👤 Auteur

**Bleze TCHALLA**  
Business Data Analyst Freelance  
Spécialité : Pilotage de performance · KPIs · Power BI · SQL 

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profil-blue)](https://linkedin.com/in/bleze-tchalla)

---

*Données entièrement fictives, générées pour illustrer des cas d'usage réels en DSI secteur énergie/industrie.*
