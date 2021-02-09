--Transform the SRID (example with flooding area dataset)
ALTER TABLE risikogeb_hq100
ALTER COLUMN geom TYPE geometry(MULTIPOLYGON, 4326) USING ST_Transform(ST_SetSRID(geom,3035),4326)

--School within a flooding area
Select bildungsstandorte.name,bildungsstandorte.gid as school_id
from bildungsstandorte, risikogeb_hq100
where ST_within(bildungsstandorte.geom,risikogeb_hq100.geom)

--Closer node to the school “Marianne Gras Volksschule Fernitz”
Select verkehrsnetz_hochrangig_vertices_pgr.id as node_id
from bildungsstandorte, verkehrsnetz_hochrangig_vertices_pgr
where bildungsstandorte.gid=91
ORDER BY ST_Distance(verkehrsnetz_hochrangig_vertices_pgr.the_geom, bildungsstandorte.geom) ASC
LIMIT 1;

--Closer hospital from the school “Marianne Gras Volksschule Fernitz”
Select hospital.id, hospital.name
from bildungsstandorte, hospital
where bildungsstandorte.gid=91
ORDER BY ST_Distance(hospital.geom, bildungsstandorte.geom) ASC
LIMIT 1;

--Closer node from the hospital “LKH Graz II Standort Süd”
Select verkehrsnetz_hochrangig_vertices_pgr.id as node_id
from hospital, verkehrsnetz_hochrangig_vertices_pgr
where hospital.id=20
ORDER BY ST_Distance(verkehrsnetz_hochrangig_vertices_pgr.the_geom, hospital.geom) ASC
LIMIT 1;

--Import CSV file (example with municipality dataset)

CREATE TABLE municipality (
  id INTEGER,
  geom geometry,
  object_id INTEGER,
  gemnr6 INTEGER,
  gemnam VARCHAR(255),
  fläche NUMERIC,
  pop_prokm2 NUMERIC,
  stmk_pop_2 NUMERIC,
  avg_agg_co NUMERIC,
  PRIMARY KEY (id)
)

COPY municipality(id,geom, object_id,gemnr6,gemnam,fläche,pop_prokm2,stmk_pop_2,avg_agg_co)
FROM 'C:\Users\Aline\datasets\datasets\municipality_borders_and_number_of_population.csv'
DELIMITER ','
CSV HEADER;

ALTER TABLE municipality
  ALTER COLUMN geom TYPE geometry(MultiPolygon, 4326)
    USING ST_SetSRID(geom,4326);

--Find the municipality containing a flood risk area :

SELECT distinct(gemnam)
from municipality, risikogeb_hq100
where ST_Overlaps(municipality.geom,risikogeb_hq100.geom)

--Return 109 municipalities


