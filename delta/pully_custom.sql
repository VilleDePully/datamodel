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
