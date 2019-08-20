--Ajout du matériau pour le radier

ALTER TABLE qgep_od.wastewater_node
ADD COLUMN pully_bottom_material integer;

CREATE TABLE qgep_vl.pully_node_bottom_material () INHERITS (qgep_sys.value_list_base);
ALTER TABLE qgep_vl.pully_node_bottom_material ADD CONSTRAINT pkey_qgep_vl_pully_node_bottom_material_code PRIMARY KEY (code);
 INSERT INTO qgep_vl.pully_node_bottom_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (4540,4540,'other','andere','autre', 'altro', 'altul', '', '', '', '', '', 'true');
 INSERT INTO qgep_vl.pully_node_bottom_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (4541,4541,'concrete','Beton','beton', 'zzz_Beton', 'beton', '', '', '', '', '', 'true');
 INSERT INTO qgep_vl.pully_node_bottom_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (4542,4542,'plastic','Kunststoff','matiere_plastique', 'zzz_Kunststoff', 'materie_plastica', '', '', '', '', '', 'true');
 INSERT INTO qgep_vl.pully_node_bottom_material (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (4543,4543,'unknown','unbekannt','inconnu', 'sconosciuto', 'necunoscut', '', '', '', '', '', 'true');
 ALTER TABLE qgep_od.wastewater_node ADD CONSTRAINT fkey_vl_pully_node_bottom_material FOREIGN KEY (pully_bottom_material)
 REFERENCES qgep_vl.pully_node_bottom_material (code) MATCH SIMPLE 
ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE qgep_od.wastewater_structure
ADD COLUMN pully_id_topobase character varying(40);

ALTER TABLE qgep_od.wastewater_structure
ADD COLUMN pully_table_topobase character varying(40);

ALTER TABLE qgep_od.wastewater_structure
ADD COLUMN pully_db_topobase character varying(40);

/*
ALTER TABLE qgep_od.wastewater_structure
ADD COLUMN fk_district integer;

ALTER TABLE qgep_od.wastewater_structure
ADD CONSTRAINT ws_fk_district FOREIGN KEY (fk_district)
        REFERENCES qgep_od.district (id) MATCH FULL
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

CREATE TABLE qgep_od.district
(
    id integer NOT NULL DEFAULT nextval('qgep_od.district_id_seq'::regclass),
    name character varying(40) NOT NULL,
    shortname character varying(12),
    zip character varying(12),
    land_registry character varying(12),
    prefix character varying(12),
    geometry geometry(MultiPolygon,21781),
    CONSTRAINT district_pkey PRIMARY KEY (id),
    CONSTRAINT district_name UNIQUE (name)
);

CREATE INDEX district_geoidx
    ON qgep_od.district USING gist
    (geometry)
    TABLESPACE pg_default;

*/

-- UPDATE structure_condition values

UPDATE qgep_vl.wastewater_structure_structure_condition
SET value_fr = 'Z0_ne_fonctionne_plus'
WHERE code = 3363;

UPDATE qgep_vl.wastewater_structure_structure_condition
SET value_fr = 'Z1_defauts_graves'
WHERE code = 3359;

UPDATE qgep_vl.wastewater_structure_structure_condition
SET value_fr = 'Z2_defauts_moyens'
WHERE code = 3360;

UPDATE qgep_vl.wastewater_structure_structure_condition
SET value_fr = 'Z3_defauts_legers'
WHERE code = 3361;

UPDATE qgep_vl.wastewater_structure_structure_condition
SET value_fr = 'Z4_aucun_defaut'
WHERE code = 3362;

-- Activation_desactivation des valeurs inutilisées
UPDATE qgep_vl.manhole_function
SET active = FALSE
WHERE code IN (4532,4536,4537,4798,5344,5346,5347);

UPDATE qgep_vl.special_structure_function
SET active = FALSE
WHERE code IN (2998,386,5371,5373,5091,5575,5576,3673,3675,3676,3677,383,2745,3234,3348);
