-- ============================================================
-- PORTFOLIO DSI - Pilotage Transformation Digitale
-- Secteur : Énergie / Industrie
-- Auteur  : Bleze TCHALLA | Business Data Analyst Freelance
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- TABLE 1 : BUSINESS UNITS
-- ────────────────────────────────────────────────────────────
CREATE TABLE business_units (
    bu_id           INTEGER PRIMARY KEY,
    nom_bu          TEXT NOT NULL,
    domaine         TEXT NOT NULL,   -- 'Production', 'Raffinage', 'Distribution', 'Corporate', 'R&D'
    directeur       TEXT NOT NULL,
    effectif        INTEGER NOT NULL,
    budget_digital  DECIMAL(12,2)    -- Budget transformation digitale alloué (€)
);

-- ────────────────────────────────────────────────────────────
-- TABLE 2 : ÉQUIPES IT
-- ────────────────────────────────────────────────────────────
CREATE TABLE equipes_it (
    equipe_id       INTEGER PRIMARY KEY,
    nom_equipe      TEXT NOT NULL,   -- 'Data & BI', 'Infrastructure', 'Cybersécurité', 'Dev Apps', 'ERP'
    responsable     TEXT NOT NULL,
    nb_ressources   INTEGER NOT NULL,
    specialite      TEXT NOT NULL
);

-- ────────────────────────────────────────────────────────────
-- TABLE 3 : PROJETS DE TRANSFORMATION
-- ────────────────────────────────────────────────────────────
CREATE TABLE projets (
    projet_id       INTEGER PRIMARY KEY,
    nom_projet      TEXT NOT NULL,
    bu_id           INTEGER REFERENCES business_units(bu_id),
    equipe_id       INTEGER REFERENCES equipes_it(equipe_id),
    categorie       TEXT NOT NULL,   -- 'Data/IA', 'Infrastructure', 'Cybersécurité', 'ERP', 'Automatisation'
    priorite        TEXT NOT NULL,   -- 'Critique', 'Haute', 'Moyenne', 'Basse'
    statut          TEXT NOT NULL,   -- 'En cours', 'Terminé', 'En retard', 'En pause', 'Planifié'
    date_debut      DATE NOT NULL,
    date_fin_prevue DATE NOT NULL,
    date_fin_reelle DATE,            -- NULL si pas encore terminé
    budget_alloue   DECIMAL(12,2) NOT NULL,
    budget_consomme DECIMAL(12,2) NOT NULL,
    avancement_pct  INTEGER NOT NULL, -- 0 à 100
    roi_estime      DECIMAL(5,2),    -- ROI estimé en %
    roi_realise     DECIMAL(5,2),    -- NULL si pas encore terminé
    chef_projet     TEXT NOT NULL,
    nb_ressources   INTEGER NOT NULL
);

-- ────────────────────────────────────────────────────────────
-- TABLE 4 : JALONS PROJETS
-- ────────────────────────────────────────────────────────────
CREATE TABLE jalons (
    jalon_id        INTEGER PRIMARY KEY,
    projet_id       INTEGER REFERENCES projets(projet_id),
    nom_jalon       TEXT NOT NULL,
    date_prevue     DATE NOT NULL,
    date_reelle     DATE,            -- NULL si pas encore atteint
    statut          TEXT NOT NULL,   -- 'Atteint', 'En retard', 'À venir', 'Bloqué'
    commentaire     TEXT
);

-- ────────────────────────────────────────────────────────────
-- TABLE 5 : RISQUES PROJETS
-- ────────────────────────────────────────────────────────────
CREATE TABLE risques (
    risque_id       INTEGER PRIMARY KEY,
    projet_id       INTEGER REFERENCES projets(projet_id),
    description     TEXT NOT NULL,
    categorie       TEXT NOT NULL,   -- 'Budget', 'Planning', 'Technique', 'RH', 'Organisationnel'
    probabilite     TEXT NOT NULL,   -- 'Faible', 'Moyenne', 'Élevée'
    impact          TEXT NOT NULL,   -- 'Faible', 'Moyen', 'Élevé'
    criticite       TEXT NOT NULL,   -- 'Faible', 'Modérée', 'Élevée', 'Critique'
    statut          TEXT NOT NULL,   -- 'Ouvert', 'Mitigé', 'Clôturé'
    action          TEXT,
    responsable     TEXT NOT NULL
);

-- ────────────────────────────────────────────────────────────
-- TABLE 6 : SUIVI BUDGÉTAIRE MENSUEL
-- ────────────────────────────────────────────────────────────
CREATE TABLE suivi_budget (
    suivi_id        INTEGER PRIMARY KEY,
    projet_id       INTEGER REFERENCES projets(projet_id),
    annee           INTEGER NOT NULL,
    mois            INTEGER NOT NULL,
    budget_prevu    DECIMAL(12,2) NOT NULL,
    budget_reel     DECIMAL(12,2) NOT NULL,
    ecart           DECIMAL(12,2) GENERATED ALWAYS AS (budget_reel - budget_prevu) VIRTUAL
);
