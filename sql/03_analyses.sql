-- ============================================================
-- REQUÊTES ANALYTIQUES - Pilotage Transformation Digitale
-- Auteur : Bleze TCHALLA | Business Data Analyst Freelance
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- 1. KPIs GLOBAUX PROGRAMME - Vue CODIR
-- ────────────────────────────────────────────────────────────
SELECT
    COUNT(*)                                                    AS nb_projets_total,
    COUNT(CASE WHEN statut = 'Terminé'   THEN 1 END)           AS nb_termines,
    COUNT(CASE WHEN statut = 'En cours'  THEN 1 END)           AS nb_en_cours,
    COUNT(CASE WHEN statut = 'En retard' THEN 1 END)           AS nb_en_retard,
    COUNT(CASE WHEN statut = 'Planifié'  THEN 1 END)           AS nb_planifies,
    COUNT(CASE WHEN statut = 'En pause'  THEN 1 END)           AS nb_en_pause,
    ROUND(SUM(budget_alloue), 0)                               AS budget_total_alloue,
    ROUND(SUM(budget_consomme), 0)                             AS budget_total_consomme,
    ROUND(SUM(budget_consomme) / SUM(budget_alloue) * 100, 1) AS taux_consommation_pct,
    ROUND(AVG(avancement_pct), 1)                              AS avancement_moyen_pct,
    ROUND(AVG(CASE WHEN roi_realise IS NOT NULL
              THEN roi_realise END), 1)                        AS roi_moyen_realise_pct
FROM projets;


-- ────────────────────────────────────────────────────────────
-- 2. PORTEFEUILLE PAR CATÉGORIE
-- ────────────────────────────────────────────────────────────
SELECT
    categorie,
    COUNT(*)                                                    AS nb_projets,
    ROUND(SUM(budget_alloue) / 1000000.0, 2)                   AS budget_M_euros,
    ROUND(SUM(budget_consomme) / SUM(budget_alloue) * 100, 1)  AS taux_conso_pct,
    ROUND(AVG(avancement_pct), 1)                              AS avancement_moyen_pct,
    COUNT(CASE WHEN statut = 'En retard' THEN 1 END)           AS nb_retards,
    ROUND(AVG(CASE WHEN roi_realise IS NOT NULL
              THEN roi_realise END), 1)                        AS roi_moyen_pct
FROM projets
GROUP BY categorie
ORDER BY budget_M_euros DESC;


-- ────────────────────────────────────────────────────────────
-- 3. BUDGET ALLOUÉ vs CONSOMMÉ PAR BUSINESS UNIT
-- ────────────────────────────────────────────────────────────
SELECT
    bu.nom_bu,
    bu.domaine,
    ROUND(bu.budget_digital / 1000000.0, 2)                    AS budget_digital_M,
    COUNT(p.projet_id)                                         AS nb_projets,
    ROUND(SUM(p.budget_alloue) / 1000000.0, 2)                 AS budget_projets_M,
    ROUND(SUM(p.budget_consomme) / 1000000.0, 2)               AS consomme_M,
    ROUND(SUM(p.budget_consomme) / SUM(p.budget_alloue) * 100, 1) AS taux_conso_pct,
    ROUND(SUM(p.budget_consomme) - SUM(p.budget_alloue), 0)    AS ecart_euros,
    COUNT(CASE WHEN p.statut = 'En retard' THEN 1 END)         AS projets_retard
FROM business_units bu
LEFT JOIN projets p ON bu.bu_id = p.bu_id
GROUP BY bu.bu_id, bu.nom_bu, bu.domaine, bu.budget_digital
ORDER BY budget_projets_M DESC;


-- ────────────────────────────────────────────────────────────
-- 4. PROJETS EN RETARD - ANALYSE DÉTAILLÉE
-- ────────────────────────────────────────────────────────────
SELECT
    p.projet_id,
    p.nom_projet,
    bu.nom_bu,
    p.categorie,
    p.priorite,
    p.date_fin_prevue,
    p.avancement_pct,
    ROUND(p.budget_consomme / p.budget_alloue * 100, 1)        AS taux_conso_pct,
    ROUND(p.budget_consomme - p.budget_alloue, 0)              AS depassement_euros,
    p.chef_projet,
    COUNT(r.risque_id)                                         AS nb_risques_ouverts
FROM projets p
JOIN business_units bu ON p.bu_id = bu.bu_id
LEFT JOIN risques r ON p.projet_id = r.projet_id AND r.statut = 'Ouvert'
WHERE p.statut = 'En retard'
GROUP BY p.projet_id, p.nom_projet, bu.nom_bu, p.categorie,
         p.priorite, p.date_fin_prevue, p.avancement_pct,
         p.budget_consomme, p.budget_alloue, p.chef_projet
ORDER BY depassement_euros DESC;


-- ────────────────────────────────────────────────────────────
-- 5. ROI RÉALISÉ - PROJETS TERMINÉS
-- ────────────────────────────────────────────────────────────
SELECT
    p.nom_projet,
    bu.nom_bu,
    p.categorie,
    ROUND(p.budget_alloue / 1000.0, 0)                         AS budget_k_euros,
    ROUND(p.budget_consomme / 1000.0, 0)                       AS consomme_k_euros,
    p.roi_estime                                               AS roi_estime_pct,
    p.roi_realise                                              AS roi_realise_pct,
    ROUND(p.roi_realise - p.roi_estime, 1)                     AS ecart_roi_pts,
    DATEDIFF(p.date_fin_reelle, p.date_fin_prevue)             AS retard_jours
FROM projets p
JOIN business_units bu ON p.bu_id = bu.bu_id
WHERE p.statut = 'Terminé'
  AND p.roi_realise IS NOT NULL
ORDER BY roi_realise_pct DESC;


-- ────────────────────────────────────────────────────────────
-- 6. CHARGE ÉQUIPES IT
-- ────────────────────────────────────────────────────────────
SELECT
    e.nom_equipe,
    e.responsable,
    e.nb_ressources                                            AS capacite_ressources,
    COUNT(p.projet_id)                                         AS nb_projets_actifs,
    SUM(CASE WHEN p.statut IN ('En cours','En retard')
             THEN p.nb_ressources ELSE 0 END)                  AS ressources_mobilisees,
    ROUND(SUM(CASE WHEN p.statut IN ('En cours','En retard')
             THEN p.nb_ressources ELSE 0 END) * 100.0
          / e.nb_ressources, 1)                               AS taux_charge_pct,
    ROUND(SUM(CASE WHEN p.statut IN ('En cours','En retard')
             THEN p.budget_alloue ELSE 0 END) / 1000000.0, 2) AS budget_actif_M
FROM equipes_it e
LEFT JOIN projets p ON e.equipe_id = p.equipe_id
GROUP BY e.equipe_id, e.nom_equipe, e.responsable, e.nb_ressources
ORDER BY taux_charge_pct DESC;


-- ────────────────────────────────────────────────────────────
-- 7. MATRICE DES RISQUES
-- ────────────────────────────────────────────────────────────
SELECT
    r.criticite,
    r.categorie,
    COUNT(*)                                                   AS nb_risques,
    COUNT(CASE WHEN r.statut = 'Ouvert'  THEN 1 END)          AS ouverts,
    COUNT(CASE WHEN r.statut = 'Mitigé'  THEN 1 END)          AS mitiges,
    COUNT(CASE WHEN r.statut = 'Clôturé' THEN 1 END)          AS clotures,
    GROUP_CONCAT(p.nom_projet, ' | ')                         AS projets_concernes
FROM risques r
JOIN projets p ON r.projet_id = p.projet_id
GROUP BY r.criticite, r.categorie
ORDER BY
    CASE r.criticite
        WHEN 'Critique' THEN 1
        WHEN 'Élevée'   THEN 2
        WHEN 'Modérée'  THEN 3
        ELSE 4
    END,
    nb_risques DESC;


-- ────────────────────────────────────────────────────────────
-- 8. JALONS EN RETARD OU BLOQUÉS
-- ────────────────────────────────────────────────────────────
SELECT
    p.nom_projet,
    p.priorite,
    bu.nom_bu,
    j.nom_jalon,
    j.date_prevue,
    j.statut                                                   AS statut_jalon,
    j.commentaire,
    p.chef_projet
FROM jalons j
JOIN projets p ON j.projet_id = p.projet_id
JOIN business_units bu ON p.bu_id = bu.bu_id
WHERE j.statut IN ('En retard', 'Bloqué')
ORDER BY
    CASE p.priorite
        WHEN 'Critique' THEN 1
        WHEN 'Haute'    THEN 2
        WHEN 'Moyenne'  THEN 3
        ELSE 4
    END,
    j.date_prevue;
