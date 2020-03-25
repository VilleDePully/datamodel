CREATE OR REPLACE VIEW qgep_sigip.vw_export_cr_photo_min AS
  SELECT ws.obj_id,
  min(file._url) AS url,
  count(*) AS nbre_photos
  FROM qgep_od.vw_qgep_wastewater_structure ws
  LEFT JOIN qgep_od.vw_file file ON ws.obj_id = file.object
  WHERE file.file_kind = '3772'
  GROUP BY ws.obj_id;
