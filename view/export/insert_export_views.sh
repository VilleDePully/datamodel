#!/bin/bash

# Exit on error
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

psql -c "DROP SCHEMA IF EXISTS qgep_export CASCADE;"
psql -c "CREATE SCHEMA qgep_export;"
psql -c "GRANT ALL ON SCHEMA qgep_export TO postgres;"
psql -c "GRANT USAGE ON SCHEMA qgep_export TO qgep_viewer;"
psql -c "GRANT ALL ON SCHEMA qgep_export TO qgep_user;"
psql -c "COMMENT ON SCHEMA qgep_export IS 'QGEP export views';"
psql -c "ALTER DEFAULT PRIVILEGES IN SCHEMA qgep_export GRANT SELECT, REFERENCES, TRIGGER ON TABLES TO qgep_viewer;"
psql -c "ALTER DEFAULT PRIVILEGES IN SCHEMA qgep_export GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES TO qgep_user;"
psql -c "ALTER DEFAULT PRIVILEGES IN SCHEMA qgep_export GRANT SELECT, UPDATE, USAGE ON SEQUENCES TO qgep_user;"

pirogue simple_joins ${DIR}/vw_export_reach.yaml --pg_service ${PGSERVICE}
pirogue simple_joins ${DIR}/vw_export_wastewater_structure.yaml --pg_service ${PGSERVICE}
