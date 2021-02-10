# SDB_project

The project’s main goal is to optimize the organization of evacuation actions in the case of a major flood event in Styria. The two main results from the project are: (1) an exposure analysis of the population and key assets, and (2) finding safe and optimal evacuation routes.
For the aims of our project, we are adopting a common risk framework, where risk is represented by the hazard, exposure and vulnerability. We have decided to analyse exposure as it is the truly spatial component of disaster risk (Fig. 1). 

To achieve the first result, we will perform a simplified exposure analysis, which will identify elements at risk, located inside the flood hazard zone, and potential evacuation sites, situated outside the zone. As major floods we are considering flood hazard with a return period once in 100 years,  modelled as part of the national flood risk assessment in Austria. As elements at risk we consider population, road network and key facilities in the evacuation process, like potential evacuation sites (schools and other educational facilities), gathering locations, supply (supermarkets, pharmacies), healthcare facilities (hospitals and rescue centres of the Red Cross). 

The second major result is the identification of safe and efficient evacuation routes through application of routing algorithms (i.e. Dijkstra shortest path many-to-one, many-to-many, all-to-many). Here we are considering two types of evacuation: individual evacuation - from all nodes in the transport network to the selected evacuation sites, and group evacuation - from selected gathering locations to the selected evacuation camps. Safety will be evaluated as part of the exposure analysis (road infrastructure located within the hazard zone) and efficiency can be measured as shortest distance or shortest time.

For practical reasons, to optimize spatial querying and taking into account the level of detail of the available datasets, we have selected a study area at a local scale and namely the municipality of Leibnitz in Southern Styria.

Module 1: Exposure analysis
1. Exposed population:
- Number of population by municipalities as of 27.04.2020
- Administrative borders: level of detail municipalities 
 
2. Key facilities for disaster response: 
2.1. Selection of evacuation sites:
- Educational locations 
- Park and ride locations 
- Camping sites 
2.2. Supply for evacuation sites
- Healthcare infrastructure: hospitals, rescue stations of the Red Cross
- Pharmacies
- Further work: Supermarkets
 
3. Road network
- Total length of road network exposed to flood risk
- Types of roads exposed to flood hazard
- Further work: pickup locations
- Further work: Identification of bridges, tunnels, culverts, over- and underpasses in flood hazard zones

Module 2: Routing
- Routing to key evacuation sites (all-to-many for individual evacuation, many-to-many for group evacuation)
- Routing for supply of the evacuation camps (many-to-many)
- Routing by filtering road types
- Further work: identification of independent pathways
- Further work: Integration of the time component - traffic information about congestion, road usage per hours, etc.

Spatial component
- Topological relationships: contains (object A is inside object B), intersects, crosses, touches (adjacency), encloses (is within), are disjoint, overlap.
- Metric relationships - distance functions: proximity to key facilities (supermarkets, hospitals, rescue centres, water and food sources, etc.) 
- Algebra set operations: spatial joins, spatial selection or filtering (road types, key facilities, etc.), spatial function application
- Other set-oriented  operations: overlapping partitions, fusion (density analyses / heatmaps), computing Voronoi diagram
- Further work: Accessibility (based on DEM) 
- Further work : nD integration - time

Possible data sources

Background/literature survey/survey of existing applications/databases/projects
To shape the methodology for the exposure analysis and organization of evacuation actions, we have researched best practices and studies of the World Bank and the Global Facility for Disaster Reduction and Recovery (Bles, 2019), the Federal Emergency Management Agency (Evacuation Transportation Models: Hub and Spoke - identification of pickup points in the high risk zones; Point-to-Point), Zhang, W., & Wang, N. (2016),  Alam et al. 2021, and methodologies for risk assessment and management (Dalezios, 2017). 

Data sources
- A routable street network of Styria (with node, edge and topology), provided in the GIS-Analysis-1 course (GST master programme). Can also be queried from OSM and topology needs to be created.
- Hospitals in Styria. Data source: www.kages.at; Open Data Austria:
https://www.data.gv.at/katalog/dataset/5c987940-3966-11e2-81c1-0800200c9a66 
- Emergency stations of the Red Cross in Styria. Data source: Red Cross Styria (http://www.roteskreuz.at/stmk/organisieren/bezirksstellen) and Open Data Austria Catalogue: https://www.data.gv.at/katalog/dataset/rettungsstellensteiermark/resource/f47dcbe7-3b53-4896-873e-ac2edcac672f  
- Population data by municipalities as of 27.04.2020. Data source Open Data Austria: https://www.data.gv.at/katalog/dataset/e8017960-396f-11e2-81c1-0800200c9a66
- Other administrative data like municipality borders. Data source: Open Data Austria, OSM
- Key facilities in disaster response:  
- Education locations in Styria: https://www.data.gv.at/katalog/dataset/6ae187d0-3948-11e2-81c1-0800200c9a66
- Park and ride locations Styria (opendata.at: https://www.data.gv.at/katalog/dataset/0d10eb50-38a8-11e2-81c1-0800200c9a66)
- Camping sites in AT (queried from OSM)
- Pharmacies: https://www.data.gv.at/katalog/dataset/1a3f11f0-3964-11e2-81c1-0800200c9a66 
- Future work: pickup locations
 
- Rivers and water bodies in Styria: https://www.data.gv.at/katalog/dataset/2e477360-3570-11e2-81c1-0800200c9a66 
- Polygons of the flood hazard zones: INSPIRE SDI Austria: https://geometadatensuche.inspire.gv.at/metadatensuche/srv/ger/catalog.search#/metadata/4384b8f6-d5c8-4b76-9237-05957f51dbc0 
https://www.data.gv.at/katalog/dataset/ee4a41a5-80ba-4bc8-9166-d1f8af785036 
- Further work: DEM - accessibility (Open Data Austria)
- Further work:  traffic data 

