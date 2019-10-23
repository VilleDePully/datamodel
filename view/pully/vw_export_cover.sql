CREATE OR REPLACE VIEW qgep_sigip.vw_export_cover AS
  SELECT cover.obj_id,
    cover.identifier AS identification,
    material.value_fr AS materiau,
    cover.level AS altitude,
    cover.situation_geometry AS the_geom
  FROM qgep_od.vw_cover cover
    LEFT JOIN qgep_vl.cover_material material ON material.code = cover.material
;
