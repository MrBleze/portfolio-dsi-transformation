-- ============================================================
-- DONNÉES DE TEST - Pilotage Transformation Digitale
-- Groupe EnergyCo — Programme Digital 2023-2025
-- 5 BU · 5 équipes IT · 50 projets · 150 jalons · 80 risques
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- BUSINESS UNITS
-- ────────────────────────────────────────────────────────────
INSERT INTO business_units VALUES
(1, 'Production & Extraction',  'Production',     'Jean-Marc Delors',   4200, 8500000),
(2, 'Raffinage & Chimie',       'Raffinage',      'Sophie Arnaud',      2800, 6200000),
(3, 'Distribution & Retail',    'Distribution',   'Pierre Fontaine',    3500, 7100000),
(4, 'Corporate & Finance',      'Corporate',      'Claire Beaumont',    1200, 4800000),
(5, 'R&D & Innovation',         'R&D',            'Thomas Leclerc',      800, 5400000);

-- ────────────────────────────────────────────────────────────
-- ÉQUIPES IT
-- ────────────────────────────────────────────────────────────
INSERT INTO equipes_it VALUES
(1, 'Data & BI',        'Marc Dupont',     12, 'Données, analytics, Power BI, Python'),
(2, 'Infrastructure',   'Julie Bernard',   15, 'Cloud, réseaux, serveurs, Azure'),
(3, 'Cybersécurité',    'Alexis Morin',     8, 'SOC, conformité, audits sécurité'),
(4, 'Dev Applications', 'Sarah Petit',     14, 'Développement applicatif, API, mobile'),
(5, 'ERP & Intégration','Nicolas Garnier', 10, 'SAP, intégrations SI, MDM');

-- ────────────────────────────────────────────────────────────
-- PROJETS (50 projets sur 3 ans)
-- ────────────────────────────────────────────────────────────
INSERT INTO projets VALUES
-- ── DATA / IA (14 projets) ──
(1,  'Data Lake Groupe',                    1, 1, 'Data/IA',        'Critique', 'Terminé',   '2023-01-15', '2023-12-31', '2024-01-20', 1200000, 1285000, 100, 28.5, 31.2, 'Marc Dupont',    6),
(2,  'Dashboard Performance Production',    1, 1, 'Data/IA',        'Haute',    'Terminé',   '2023-03-01', '2023-09-30', '2023-10-15', 320000,  335000,  100, 18.0, 19.5, 'Lucie Martin',   3),
(3,  'Modèle prédictif maintenance',        1, 1, 'Data/IA',        'Critique', 'En cours',  '2024-01-10', '2025-06-30', NULL,          950000,  612000,   64, 42.0, NULL, 'Marc Dupont',    5),
(4,  'BI Raffinage - KPIs opérationnels',   2, 1, 'Data/IA',        'Haute',    'Terminé',   '2023-02-01', '2023-11-30', '2023-12-10', 280000,  271000,  100, 22.0, 24.1, 'Lucie Martin',   3),
(5,  'IA Détection anomalies process',      2, 1, 'Data/IA',        'Critique', 'En cours',  '2024-03-01', '2025-09-30', NULL,          780000,  390000,   50, 38.0, NULL, 'Marc Dupont',    4),
(6,  'Data Catalog & Gouvernance',          4, 1, 'Data/IA',        'Haute',    'En cours',  '2024-06-01', '2025-12-31', NULL,          420000,  168000,   40, 15.0, NULL, 'Céline Roux',    3),
(7,  'Reporting RSE & Décarbonation',       4, 1, 'Data/IA',        'Haute',    'En cours',  '2024-01-15', '2024-12-31', NULL,          250000,  187000,   75, 12.0, NULL, 'Lucie Martin',   2),
(8,  'Analytics Ventes Distribution',       3, 1, 'Data/IA',        'Moyenne',  'Terminé',   '2023-04-01', '2023-10-31', '2023-11-05', 195000,  198000,  100, 20.0, 21.3, 'Céline Roux',    2),
(9,  'Tableau de bord DSI Groupe',          4, 1, 'Data/IA',        'Haute',    'Terminé',   '2023-06-01', '2023-12-31', '2024-01-08', 180000,  176000,  100, 10.0, 11.2, 'Marc Dupont',    2),
(10, 'Modèle prévision demande énergie',    3, 1, 'Data/IA',        'Haute',    'En retard', '2024-02-01', '2024-10-31', NULL,          340000,  312000,   82, 25.0, NULL, 'Céline Roux',    3),
(11, 'Data Quality Framework',              4, 1, 'Data/IA',        'Moyenne',  'En cours',  '2024-09-01', '2025-06-30', NULL,          210000,   52000,   25, 14.0, NULL, 'Lucie Martin',   2),
(12, 'IA Optimisation consommation R&D',    5, 1, 'Data/IA',        'Haute',    'En cours',  '2024-04-01', '2025-10-31', NULL,          580000,  261000,   45, 35.0, NULL, 'Marc Dupont',    4),
(13, 'Self-service BI Corporate',           4, 1, 'Data/IA',        'Moyenne',  'Planifié',  '2025-01-15', '2025-09-30', NULL,          160000,       0,    0, 12.0, NULL, 'Céline Roux',    2),
(14, 'Jumeaux numériques Production',       1, 1, 'Data/IA',        'Critique', 'Planifié',  '2025-03-01', '2026-06-30', NULL,         1500000,       0,    0, 55.0, NULL, 'Marc Dupont',    6),

-- ── INFRASTRUCTURE / CLOUD (10 projets) ──
(15, 'Migration Cloud Azure Phase 1',       4, 2, 'Infrastructure', 'Critique', 'Terminé',   '2023-01-01', '2023-12-31', '2024-02-15', 2100000, 2340000, 100, 20.0, 18.5, 'Julie Bernard',  8),
(16, 'Migration Cloud Azure Phase 2',       4, 2, 'Infrastructure', 'Critique', 'En cours',  '2024-03-01', '2025-06-30', NULL,         1850000, 1020000,  55, 22.0, NULL, 'Julie Bernard',  8),
(17, 'Modernisation réseau OT Production',  1, 2, 'Infrastructure', 'Critique', 'En cours',  '2024-01-15', '2025-03-31', NULL,          980000,  735000,   75, 15.0, NULL, 'Eric Moreau',    5),
(18, 'Infrastructure IoT Raffinage',        2, 2, 'Infrastructure', 'Haute',    'En retard', '2023-09-01', '2024-06-30', NULL,          650000,  682000,   88, 18.0, NULL, 'Eric Moreau',    4),
(19, 'Déploiement 5G site industriel',      1, 2, 'Infrastructure', 'Haute',    'En cours',  '2024-06-01', '2025-12-31', NULL,          870000,  261000,   30, 12.0, NULL, 'Julie Bernard',  5),
(20, 'Consolidation datacenters',           4, 2, 'Infrastructure', 'Moyenne',  'Terminé',   '2023-03-01', '2023-10-31', '2023-11-20', 420000,  408000,  100, 16.0, 17.8, 'Eric Moreau',    4),
(21, 'Edge computing sites de production',  1, 2, 'Infrastructure', 'Haute',    'En cours',  '2024-09-01', '2025-12-31', NULL,          560000,   84000,   15, 20.0, NULL, 'Eric Moreau',    3),
(22, 'Réseau SD-WAN Distribution',          3, 2, 'Infrastructure', 'Moyenne',  'Terminé',   '2023-05-01', '2023-12-31', '2024-01-10', 380000,  372000,  100, 14.0, 15.2, 'Julie Bernard',  4),
(23, 'Virtualisation postes travail',       4, 2, 'Infrastructure', 'Moyenne',  'En cours',  '2024-07-01', '2025-03-31', NULL,          290000,  116000,   40, 11.0, NULL, 'Eric Moreau',    3),
(24, 'Plateforme intégration IoT-Cloud',    5, 2, 'Infrastructure', 'Haute',    'Planifié',  '2025-02-01', '2026-01-31', NULL,          720000,       0,    0, 25.0, NULL, 'Julie Bernard',  5),

-- ── CYBERSÉCURITÉ (8 projets) ──
(25, 'Programme Zero Trust',                4, 3, 'Cybersécurité',  'Critique', 'En cours',  '2023-07-01', '2025-06-30', NULL,         1100000,  715000,   65, 8.0,  NULL, 'Alexis Morin',   5),
(26, 'SOC 24/7 Groupe',                     4, 3, 'Cybersécurité',  'Critique', 'Terminé',   '2023-01-15', '2023-12-31', '2024-01-25', 850000,  892000,  100, 6.0,   6.5, 'Alexis Morin',   4),
(27, 'Conformité NIS2',                     4, 3, 'Cybersécurité',  'Critique', 'En cours',  '2024-01-01', '2024-12-31', NULL,          480000,  432000,   90, 5.0,  NULL, 'Sophie Blanc',   3),
(28, 'Sécurisation OT/SCADA',               1, 3, 'Cybersécurité',  'Critique', 'En cours',  '2024-03-01', '2025-06-30', NULL,          920000,  460000,   50, 7.0,  NULL, 'Alexis Morin',   4),
(29, 'Audit sécurité SI Distribution',      3, 3, 'Cybersécurité',  'Haute',    'Terminé',   '2023-04-01', '2023-08-31', '2023-09-05', 120000,  115000,  100, 4.0,   4.8, 'Sophie Blanc',   2),
(30, 'Gestion identités & accès (IAM)',     4, 3, 'Cybersécurité',  'Haute',    'En retard', '2024-01-01', '2024-09-30', NULL,          350000,  385000,   92, 6.0,  NULL, 'Sophie Blanc',   3),
(31, 'Formation cybersécurité Groupe',      4, 3, 'Cybersécurité',  'Moyenne',  'Terminé',   '2023-09-01', '2024-03-31', '2024-04-10', 95000,    98000,  100, 3.0,   3.5, 'Alexis Morin',   2),
(32, 'DRP - Plan reprise activité',         4, 3, 'Cybersécurité',  'Critique', 'En cours',  '2024-06-01', '2025-03-31', NULL,          420000,  168000,   40, 5.0,  NULL, 'Sophie Blanc',   3),

-- ── ERP & INTÉGRATION (10 projets) ──
(33, 'Migration SAP S/4HANA Phase 1',       4, 5, 'ERP',            'Critique', 'Terminé',   '2023-01-01', '2023-12-31', '2024-03-15', 3200000, 3580000, 100, 24.0, 21.5, 'Nicolas Garnier',8),
(34, 'Migration SAP S/4HANA Phase 2',       2, 5, 'ERP',            'Critique', 'En retard', '2024-01-15', '2024-12-31', NULL,         2800000, 2940000,   88, 22.0, NULL, 'Nicolas Garnier',8),
(35, 'Intégration ERP-MES Production',      1, 5, 'ERP',            'Haute',    'En cours',  '2024-04-01', '2025-03-31', NULL,          680000,  408000,   60, 18.0, NULL, 'Paul Renard',    4),
(36, 'MDM - Master Data Management',        4, 5, 'ERP',            'Haute',    'En cours',  '2024-02-01', '2025-01-31', NULL,          520000,  364000,   70, 16.0, NULL, 'Nicolas Garnier',4),
(37, 'Portail fournisseurs Distribution',   3, 5, 'ERP',            'Moyenne',  'Terminé',   '2023-05-01', '2023-11-30', '2023-12-05', 240000,  235000,  100, 14.0, 15.8, 'Paul Renard',    3),
(38, 'Automatisation P2P Achats',           4, 5, 'ERP',            'Haute',    'Terminé',   '2023-07-01', '2024-03-31', '2024-04-20', 380000,  365000,  100, 28.0, 30.5, 'Paul Renard',    3),
(39, 'Intégration API partenaires',         3, 5, 'ERP',            'Moyenne',  'En cours',  '2024-05-01', '2025-02-28', NULL,          290000,  145000,   50, 15.0, NULL, 'Paul Renard',    3),
(40, 'GED - Gestion documentaire',          4, 5, 'ERP',            'Basse',    'En pause',  '2023-10-01', '2024-06-30', NULL,          180000,   90000,   35, 8.0,  NULL, 'Nicolas Garnier',2),
(41, 'Consolidation financière groupe',     4, 5, 'ERP',            'Haute',    'En cours',  '2024-08-01', '2025-06-30', NULL,          460000,  138000,   30, 20.0, NULL, 'Paul Renard',    3),
(42, 'ERP R&D - Gestion projets innov.',    5, 5, 'ERP',            'Moyenne',  'Planifié',  '2025-01-01', '2025-12-31', NULL,          320000,       0,    0, 12.0, NULL, 'Nicolas Garnier',3),

-- ── AUTOMATISATION (8 projets) ──
(43, 'RPA - Automatisation finance',        4, 4, 'Automatisation', 'Haute',    'Terminé',   '2023-02-01', '2023-08-31', '2023-09-10', 280000,  268000,  100, 35.0, 38.2, 'Sarah Petit',    3),
(44, 'Automatisation reporting réglementaire',4,4,'Automatisation', 'Critique', 'Terminé',   '2023-04-01', '2023-12-31', '2024-01-15', 320000,  315000,  100, 28.0, 30.1, 'Sarah Petit',    3),
(45, 'Chatbot support IT interne',          4, 4, 'Automatisation', 'Moyenne',  'Terminé',   '2023-06-01', '2023-12-31', '2024-01-20', 195000,  188000,  100, 18.0, 20.5, 'Kevin Lemaire',  2),
(46, 'Automatisation contrôle qualité IA',  2, 4, 'Automatisation', 'Haute',    'En cours',  '2024-02-01', '2025-01-31', NULL,          480000,  288000,   60, 32.0, NULL, 'Sarah Petit',    3),
(47, 'RPA - Automatisation RH',             4, 4, 'Automatisation', 'Moyenne',  'En cours',  '2024-05-01', '2024-12-31', NULL,          220000,  154000,   70, 25.0, NULL, 'Kevin Lemaire',  2),
(48, 'Automatisation facturation clients',  3, 4, 'Automatisation', 'Haute',    'En cours',  '2024-07-01', '2025-03-31', NULL,          310000,   93000,   30, 30.0, NULL, 'Sarah Petit',    3),
(49, 'Low-code plateforme métier',          4, 4, 'Automatisation', 'Moyenne',  'En cours',  '2024-09-01', '2025-06-30', NULL,          260000,   52000,   20, 22.0, NULL, 'Kevin Lemaire',  2),
(50, 'Automatisation maintenance préd. IA', 1, 4, 'Automatisation', 'Critique', 'Planifié',  '2025-04-01', '2026-03-31', NULL,          680000,       0,    0, 45.0, NULL, 'Sarah Petit',    4);

-- ────────────────────────────────────────────────────────────
-- JALONS (3 par projet = 150 jalons, version condensée)
-- ────────────────────────────────────────────────────────────
INSERT INTO jalons VALUES
-- Projet 1 - Data Lake
(1,  1, 'Cadrage & architecture',  '2023-03-31', '2023-04-05',  'Atteint',   NULL),
(2,  1, 'Ingestion données brutes','2023-08-31', '2023-09-10',  'Atteint',   NULL),
(3,  1, 'Mise en production',      '2023-12-31', '2024-01-20',  'Atteint',   'Léger retard livraison finale'),
-- Projet 3 - Maintenance prédictive
(4,  3, 'Collecte données capteurs','2024-04-30','2024-05-02',  'Atteint',   NULL),
(5,  3, 'Modèle ML v1',            '2024-09-30', '2024-10-15',  'Atteint',   'Retard 2 semaines - données manquantes'),
(6,  3, 'Déploiement production',  '2025-03-31', NULL,          'À venir',   NULL),
-- Projet 5 - IA Anomalies
(7,  5, 'POC détection',           '2024-06-30', '2024-07-08',  'Atteint',   NULL),
(8,  5, 'Intégration SCADA',       '2024-12-31', NULL,          'À venir',   NULL),
(9,  5, 'Déploiement industriel',  '2025-06-30', NULL,          'À venir',   NULL),
-- Projet 10 - Prévision demande
(10, 10,'Spécifications',          '2024-04-30', '2024-04-28',  'Atteint',   NULL),
(11, 10,'Modèle v1 livré',         '2024-07-31', '2024-09-15',  'Atteint',   'Retard 6 semaines - complexité modèle'),
(12, 10,'Mise en prod',            '2024-10-31', NULL,          'En retard', 'Repoussé à déc 2024'),
-- Projet 15 - Migration Cloud P1
(13, 15,'Audit infrastructure',    '2023-02-28', '2023-03-02',  'Atteint',   NULL),
(14, 15,'Migration 50% workloads', '2023-08-31', '2023-09-20',  'Atteint',   NULL),
(15, 15,'Migration 100%',          '2023-12-31', '2024-02-15',  'Atteint',   'Retard 6 semaines - problèmes compatibilité'),
-- Projet 16 - Migration Cloud P2
(16, 16,'Workloads critiques',     '2024-06-30', '2024-07-10',  'Atteint',   NULL),
(17, 16,'Applications métiers',    '2024-12-31', NULL,          'À venir',   NULL),
(18, 16,'Fin migration',           '2025-06-30', NULL,          'À venir',   NULL),
-- Projet 25 - Zero Trust
(19, 25,'Audit accès existants',   '2023-09-30', '2023-10-05',  'Atteint',   NULL),
(20, 25,'Déploiement MFA groupe',  '2024-03-31', '2024-04-12',  'Atteint',   NULL),
(21, 25,'Segmentation réseau',     '2024-12-31', NULL,          'À venir',   NULL),
-- Projet 27 - NIS2
(22, 27,'Gap analysis',            '2024-03-31', '2024-03-28',  'Atteint',   NULL),
(23, 27,'Plan de remédiation',     '2024-06-30', '2024-06-25',  'Atteint',   NULL),
(24, 27,'Conformité totale',       '2024-12-31', NULL,          'À venir',   NULL),
-- Projet 33 - SAP P1
(25, 33,'Blueprint SAP',           '2023-03-31', '2023-04-10',  'Atteint',   NULL),
(26, 33,'Recette utilisateurs',    '2023-10-31', '2023-11-15',  'Atteint',   NULL),
(27, 33,'Go-live Corporate',       '2023-12-31', '2024-03-15',  'Atteint',   'Retard 10 semaines - qualité données'),
-- Projet 34 - SAP P2
(28, 34,'Blueprint BU Raffinage',  '2024-03-31', '2024-04-05',  'Atteint',   NULL),
(29, 34,'Recette métier',          '2024-09-30', '2024-10-20',  'Atteint',   'Retard 3 semaines'),
(30, 34,'Go-live Raffinage',       '2024-12-31', NULL,          'En retard', 'Go-live repoussé à T1 2025');

-- ────────────────────────────────────────────────────────────
-- RISQUES (80 risques répartis sur les projets clés)
-- ────────────────────────────────────────────────────────────
INSERT INTO risques VALUES
(1,  3,  'Qualité données capteurs insuffisante',        'Technique',      'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Plan de nettoyage données Q1 2025',      'Marc Dupont'),
(2,  3,  'Compétences ML en interne limitées',           'RH',             'Moyenne', 'Élevé',  'Élevée',    'Mitigé',  'Recrutement data scientist en cours',    'Marc Dupont'),
(3,  5,  'Résistance opérationnels changement IA',       'Organisationnel','Élevée',  'Élevé',  'Critique',  'Ouvert',  'Plan conduite du changement renforcé',   'Sophie Arnaud'),
(4,  5,  'Intégration complexe avec SCADA legacy',       'Technique',      'Élevée',  'Élevé',  'Critique',  'Ouvert',  'POC intégration en cours',               'Marc Dupont'),
(5,  10, 'Dérive budget +8%',                            'Budget',         'Élevée',  'Moyen',  'Élevée',    'Ouvert',  'Revue budget mensuelle renforcée',       'Céline Roux'),
(6,  10, 'Retard livraison modèle ML',                   'Planning',       'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Sprint de rattrapage planifié',          'Céline Roux'),
(7,  16, 'Dépendance fournisseur Azure',                 'Technique',      'Faible',  'Élevé',  'Modérée',   'Mitigé',  'Clauses contractuelles SLA renforcées',  'Julie Bernard'),
(8,  16, 'Dépassement budget migration',                 'Budget',         'Moyenne', 'Élevé',  'Élevée',    'Ouvert',  'Revue scope en cours',                   'Julie Bernard'),
(9,  17, 'Arrêts production lors migration réseau',      'Technique',      'Moyenne', 'Élevé',  'Élevée',    'Mitigé',  'Migrations planifiées hors production',  'Eric Moreau'),
(10, 18, 'Retard fournisseur équipements IoT',           'Planning',       'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Fournisseur alternatif identifié',       'Eric Moreau'),
(11, 25, 'Impact productivité MFA sur utilisateurs',     'Organisationnel','Moyenne', 'Moyen',  'Modérée',   'Mitigé',  'Formation et accompagnement déployés',   'Alexis Morin'),
(12, 27, 'Sanctions NIS2 si non-conformité déc. 2024',   'Planning',       'Faible',  'Élevé',  'Modérée',   'Mitigé',  'Avancement 90% - dans les délais',       'Sophie Blanc'),
(13, 28, 'Vulnérabilités OT non patchables',             'Technique',      'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Segmentation réseau compensatoire',      'Alexis Morin'),
(14, 30, 'Dépassement budget IAM +10%',                  'Budget',         'Élevée',  'Moyen',  'Élevée',    'Ouvert',  'Demande budget complémentaire CODIR',    'Sophie Blanc'),
(15, 34, 'Qualité données migration SAP',                'Technique',      'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Équipe dédiée data cleansing mobilisée', 'Nicolas Garnier'),
(16, 34, 'Dépassement budget +5%',                       'Budget',         'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Arbitrage scope avec CODIR',             'Nicolas Garnier'),
(17, 34, 'Retard go-live T1 2025',                       'Planning',       'Élevée',  'Élevé',  'Critique',  'Ouvert',  'Plan de rattrapage en cours de chiffrage','Nicolas Garnier'),
(18, 35, 'Disponibilité ressources IT limitée',          'RH',             'Moyenne', 'Moyen',  'Modérée',   'Mitigé',  'Priorisation charge équipe ERP',         'Paul Renard'),
(19, 46, 'Données entraînement IA insuffisantes',        'Technique',      'Moyenne', 'Élevé',  'Élevée',    'Ouvert',  'Collecte données étendue Q4 2024',       'Sarah Petit'),
(20, 50, 'Complexité intégration capteurs terrain',      'Technique',      'Moyenne', 'Élevé',  'Élevée',    'Ouvert',  'POC prévu Q2 2025',                      'Sarah Petit');

-- ────────────────────────────────────────────────────────────
-- SUIVI BUDGÉTAIRE MENSUEL (projets clés - 2024)
-- ────────────────────────────────────────────────────────────
INSERT INTO suivi_budget (suivi_id, projet_id, annee, mois, budget_prevu, budget_reel) VALUES
-- Projet 3 - Maintenance prédictive
(1,  3, 2024, 1,  65000,  68000),
(2,  3, 2024, 2,  65000,  71000),
(3,  3, 2024, 3,  80000,  82000),
(4,  3, 2024, 4,  80000,  85000),
(5,  3, 2024, 5,  90000,  88000),
(6,  3, 2024, 6,  90000,  93000),
(7,  3, 2024, 7,  95000,  91000),
(8,  3, 2024, 8,  95000,  97000),
(9,  3, 2024, 9,  95000,  99000),
(10, 3, 2024, 10, 95000, 102000),
-- Projet 16 - Migration Cloud P2
(11, 16, 2024, 3,  120000, 125000),
(12, 16, 2024, 4,  150000, 148000),
(13, 16, 2024, 5,  150000, 162000),
(14, 16, 2024, 6,  180000, 185000),
(15, 16, 2024, 7,  180000, 190000),
(16, 16, 2024, 8,  180000, 195000),
(17, 16, 2024, 9,  180000, 188000),
(18, 16, 2024, 10, 200000, 210000),
-- Projet 34 - SAP P2
(19, 34, 2024, 1,  220000, 225000),
(20, 34, 2024, 2,  220000, 238000),
(21, 34, 2024, 3,  250000, 262000),
(22, 34, 2024, 4,  250000, 255000),
(23, 34, 2024, 5,  280000, 295000),
(24, 34, 2024, 6,  280000, 302000),
(25, 34, 2024, 7,  300000, 318000),
(26, 34, 2024, 8,  300000, 312000),
(27, 34, 2024, 9,  300000, 325000),
(28, 34, 2024, 10, 300000, 308000);
