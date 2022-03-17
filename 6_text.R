context_1 <- p("The large and growing populations on coastlines globally are at an increased risk of erosion and flooding driven by the effects of climate change that include sea level rise and more frequent and/or intense storm events. 
Traditional methods to reduce this risk have resulted in shorelines being armoured with hard defences, such as seawalls and revetments.
 In some areas, more than 50% of natural shorelines have been replaced with hard armouring. 
The disadvantages of static armouring of shorelines are great. 
They cannot adapt to future climate change, are expensive to rebuild or upgrade and negatively impact ecological and social values.
")

context_2 <- p("Natural ecosystems contribute to coastal hazard risk reduction. 
Coastal vegetation, biogenic reefs, dunes and beaches provide protection from erosion and flooding through wave attenuation, sediment stabilisation and are dynamic for adaptation to sea level rise and self-repair following storm events. 
Shorelines protected with restored ecosystems are commonly named “living shorelines” or “nature-based coastal defence”. 
Nature-based defences can restore the habitat alone (“soft” approach), or in combination with hard structures that support habitat establishment (“hybrid” approaches). 
Nature-based defences are a promising solution to two pervasive problems: an increased need for coastal defence, and the restoration of habitats that have been degraded or reduced in size globally. 
Using nature-based systems can also yield a number of co-benefits such as supporting productive fisheries, water filtration and carbon sequestration.
 The key factors determining whether a soft or hybrid approach can be used is the environmental context and risk level.
 ")

context_3 <- p("In particular, the habitat suitability and hazard exposure need to be appropriate for their use. 
Nature-based methods require space in the intertidal area to be established, and a terrestrial buffer increases resilience by providing future adaptation space in response to sea level rise. 
There are a number of habitat-specific ecological requirements and engineering parameters that need be accounted for to achieve effective hazard risk reduction and habitat restoration. 
Providing information to landowners and coastal managers on where a soft, hybrid, or hard (i.e., not suitable for nature-based methods) approach can be effectively used is regarded as a key step to the wider use of more diverse risk reduction interventions. 
A living shoreline suitability model identifies the suitable approach (soft or hybrid) for erosion control across different coastal areas that have varying environmental contexts and risk levels. 
Suitability modelling has been applied to areas of the US coastline, but has yet to be done in Australia. 
")

aims <- p("Using the state of Victoria, Australia as a case study, in this project we aimed to determine which areas of the coastline are: 
1) most suitable for a soft solution, 
2) most suitable for a hybrid solution or 
3) not suitable for nature-based coastal defence.
")

methods_brief <- p("We combined information on the environmental context using species distribution models (SDMs) with the risk level using a rules-based living shoreline suitability model. 
The results will better guide the coastal defence decisions made by coastal managers and the approach is globally applicable. 
For more information on the methods, please see the methods page above in the navigation bar.
")

methods_species <- p("The primary coastal ecosystems that provide natural coastal defence in Victoria are: dunes and beaches; saltmarshes; mangroves; seagrasses; and shellfish reefs. 
                     We identified 14 species that are the main habitat-formers within these ecosystems for the species distribution models. 
                     These included three dune species (Ammophila arenaria, Spinifex sericeus, and Thinopyrum junceiforme),
                     four seagrasses (Amphibolis antarctica, Halophila australis, Heterozostera nigricaluis and Zostera muelleri), 
                     three shellfish (Mytilus galloprovincialis, Ostra angasi and Saccostra glomerata), 
                     one mangrove (Avicennia marina),
                     and three saltmarsh species (Tecticornia arbuscula, Gahnia filum and Austrostipa stipoides).")

methods_SDM <- p("Using open-source occurrence data and environmental layers, we used a presence-only MaxEnt model to predict the habitat suitability for the 14 species across the coastal areas (8km either side of the coastline) in New South Wales, Victoria and South Australia.
The 14 environmental variables described the topography/bathymetry and slope, primary substrate (% of terrestrial sand, aquatic sand, and aquatic mud) and fetch as a proxy for wave action along the coastal area. 
In the absence of available sea water temperature, we used 8 bioclimatic layers (annual average temperature and precipitation, maximum temperature of warmest week and quarter, minimum temperature of coldest week and quarter, and temperature and precipitation seasonality) acknowledging that these may represent more proximal predictors for the aquatic species. 
We selected the best model of the predicted suitability from expert opinion or, when that was unclear, using the MaxEnt calculated test-AUC, regularized training gain and variable importance.
")

methods_suit1 <- p("The Victorian coastline was separated into 250 m segments and thiessen polygons (also known as Voronoi polygons) were created around each segment to create an area over which the variables would be summarised. 
For each segment, the accommodation space (distance in the intertidal zone where the species could establish), adaptation space (to allow for sea level rise) and the species’ specific habitat suitability from the SDMs were compiled. 
The accommodation space was calculated as the distance between the 0 m contour line to the 1m contour for seagrass, mangrove, saltmarsh, and shellfish species and 0m to 4m contour for the dune species. 
Adaptation space was calculated as the distance from 0m contour to the nearest impervious surface was calculated for seagrass, mangrove, saltmarsh, and shellfish species, and to the nearest 20% incline of slope for the dune species. 
Both accommodation and adaptation space were calculated at 25 m intervals and averaged for each line segment. Distances of less than 1 m were assumed insufficient area for all species.
")

methods_suit2  <- p("Each of the suitability criteria (mean accommodation space, mean adaptation space, and maximum habitat suitability for each taxa) were combined to determine the NBCD suitability for each taxa, along with a combined suitability for all species. 
Each attribute was scored on a (continuous) scale from zero to five, with zero indicating no suitability and five indicating the highest suitability. 
Once scaled, the variables were then summed, and the resulting value is quantile into three categories. The category with the highest scores was deemed suitable for soft NBCD strategies, the mid-range category was deemed suitable for hybrid NBCD, and the lowest category was deemed unsuitable. 
Separate suitability analyses were conducted for all species combined and each taxa separately (seagrass, mangrove, saltmarsh, shellfish, and dunes). 
The taxa-specific suitability categorisations further indicate which type (seagrass, mangrove, saltmarsh, shellfish, and/or dunes) of NBCD is suitable within the soft and hybrid categorisations.
")