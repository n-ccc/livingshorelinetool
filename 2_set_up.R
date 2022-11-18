##****************************************##
## Nature Based Coastal Defence shiny app ##
##****************************************##
## Author: Alys Young
## Lead: Dr Becki Morris
##
## Project aim: Assess the suitability of nature-based approaches to coastal protection for Victoria
## Script  aim: Data


### Packages -----------------------------------------------------------------------------------------------------------------------------------------------

## Install
# if (!require(shiny)) install.packages('shiny')
# if (!require(shinythemes)) install.packages('shinythemes')
# if (!require(leaflet)) install.packages('leaflet')
# if (!require(sf)) install.packages('sf')
# if (!require(rgdal)) install.packages('rgdal')
# if (!require(dplyr)) install.packages('dplyr')
# if (!require(DT)) install.packages('DT')
## Load
library(shiny) # = load shiny
library(shinythemes) # = built in theme
library(shinyjs) # for shiny show and hide

library(leaflet) # = map
# library(stringr)
library(sf) # = simple features, to read in shp files
# library(rgdal) # = old version to read in shp files
library(dplyr) # = data manipulation and cleaning
library(ggplot2)


# Species data ------------------------------------------------------------

sp_df <- read.csv("www/data/species.csv") %>%
  mutate("Link_name" = paste0("<a href='",  ALA_link,"'>", Latin_name, "</a>")) %>%
  select(-"ALA_link")



# Taxa points  ------------------------------------------------------------
## Known occurrences of the taxa
  # I tried to do the transformation before and save it but it did not work.
point_Dune      <- st_read("www/data/taxa_points/Points_Dune.gpkg") %>%
  st_transform(st_crs('+proj=longlat +datum=WGS84'))
point_Seagrass  <- st_read("www/data/taxa_points/Points_Seagrass.gpkg") %>%
  st_transform(st_crs('+proj=longlat +datum=WGS84'))
point_Saltmarsh <- st_read("www/data/taxa_points/Points_Saltmarsh.gpkg") %>%
  st_transform(st_crs('+proj=longlat +datum=WGS84'))
point_Mangrove  <- st_read("www/data/taxa_points/Points_Mangrove.gpkg") %>%
  st_transform(st_crs('+proj=longlat +datum=WGS84'))
point_Shellfish <- st_read("www/data/taxa_points/Points_Shellfish.gpkg") %>%
  st_transform(st_crs('+proj=longlat +datum=WGS84'))

### Line Data -----------------------------------------------------------------------------------------------------------------------------------------------

line_dat <- st_read("www/data/line_full.gpkg") # here - to do - needs changing.


# Suitable overall --------------------------------------------------------


df_All <- line_dat %>%
  select("Suit_all", "Suit_dune", "Suit_mang", "Suit_salt", "Suit_seag", "Suit_shell") %>%
  rename(Suitability = Suit_all)
text_All <- paste0('<strong>', "Suitability overall: ", '</strong>', df_All$Suitability,
                   '<br/>',
                   '<br/>', '<strong>'," For dunes: ", '</strong>', df_All$Suit_dune,
                   '<br/>', '<strong>'," For mangrove: ", '</strong>', df_All$Suit_mang,
                   '<br/>', '<strong>'," For saltmarsh: ", '</strong>', df_All$Suit_salt,
                   '<br/>', '<strong>'," For seagrass: ", '</strong>', df_All$Suit_seag,
                   '<br/>', '<strong>'," For shellfish: ", '</strong>', df_All$Suit_shell
)
hover_All <-  paste0('<strong>', "Suitability overall: ", '</strong>', df_All$Suitability)


# For each taxa --------------------------------------------------------
# suitability
# Accomodation
# adaptation
# individual species


# Dune --------------------------------------------------------------------
df_Dune <- line_dat %>%
  select("Suit_dune",  # suitability
         "D_04_men",  #Accomodation
         "D_0Sl_men", # Adaptation
         "A_rnr_mx",
         "S_srcs_mx",
         "T_jncfr_mx")  %>%
  rename(Suitability = Suit_dune)

text_Dune <- paste0('<strong>', "Suitability for dunes: ", '</strong>', df_Dune$Suitability,
                    '<br/>',
                    '<br/>', '<strong>', '<em>', "Ammophila arenaria",'</em>', ": ", '</strong>', round(df_Dune$A_rnr_mx, 2),
                    '<br/>', '<strong>', '<em>', "Spinifex sericeus",'</em>', ": ", '</strong>', round(df_Dune$S_srcs_mx, 2),
                    '<br/>', '<strong>', '<em>', "Thinopyrum junceiforme",'</em>', ": ", '</strong>', round(df_Dune$T_jncfr_mx, 2),
                    '<br/>',
                    '<br/>', '<strong>'," Accommodation space: ", '</strong>', round(df_Dune$D_04_men, 2),
                    '<br/>', '<strong>'," Adaptation space: ", '</strong>', round(df_Dune$D_0Sl_men, 2)
)
hover_Dune <- paste0('<strong>', "Suitability for dunes: ", '</strong>', df_Dune$Suitability,
                     '<br/>',
                     '<br/>', '<strong>', '<em>', "Ammophila arenaria",'</em>', ": ", '</strong>', round(df_Dune$A_rnr_mx, 2),
                     '<br/>', '<strong>', '<em>', "Spinifex sericeus",'</em>', ": ", '</strong>', round(df_Dune$S_srcs_mx, 2),
                     '<br/>', '<strong>', '<em>', "Thinopyrum junceiforme",'</em>', ": ", '</strong>', round(df_Dune$T_jncfr_mx, 2)
)

# Mangrove ----------------------------------------------------------------
df_Mangrove <- line_dat %>%
  select("Suit_mang",  # suitability
         "D_01_men",  #Accomodation
         "D_0Ur_men", # Adaptation
         "A_mrn_mx")  %>%
  rename(Suitability = Suit_mang)

text_Mangrove <- paste0('<strong>', "Suitability for mangroves: ", '</strong>', df_Mangrove$Suitability,
                        '<br/>',
                        '<br/>', '<strong>', '<em>', "Avicennia marina",'</em>', ": ", '</strong>', round(df_Mangrove$A_mrn_mx, 2),
                        '<br/>',
                        '<br/>', '<strong>'," Accommodation space: ", '</strong>', round(df_Mangrove$D_01_men, 2),
                        '<br/>', '<strong>'," Adaptation space: ", '</strong>', round(df_Mangrove$D_0Ur_men, 2)
)

hover_Mangrove <- paste0('<strong>', "Suitability for mangroves: ", '</strong>', df_Mangrove$Suitability,
                         '<br/>',
                         '<br/>', '<strong>', '<em>', "Avicennia marina",'</em>', ": ", '</strong>', round(df_Mangrove$A_mrn_mx, 2))

# Saltmarsh ---------------------------------------------------------------
df_Saltmarsh <- line_dat %>%
  select("Suit_salt",  # suitability
         "D_01_men",  #Accomodation
         "D_0Ur_men", # Adaptation
         "A_stpds_mx",
         "G_flm_mx",
         "T_rbscl_mx")  %>%
  rename(Suitability = Suit_salt)

text_Saltmarsh <- paste0('<strong>', "Suitability for Saltmarsh: ", '</strong>', df_Saltmarsh$Suitability,
                         '<br/>',
                         '<br/>', '<strong>', '<em>', "Austrostipa stipoides",'</em>', ": ", '</strong>', round(df_Saltmarsh$A_stpds_mx, 2),
                         '<br/>', '<strong>', '<em>', "Gahnia filum",'</em>', ": ", '</strong>', round(df_Saltmarsh$G_flm_mx, 2),
                         '<br/>', '<strong>', '<em>', "Tecticornia arbuscula",'</em>', ": ", '</strong>', round(df_Saltmarsh$T_rbscl_mx, 2),
                         '<br/>',
                         '<br/>', '<strong>'," Accommodation space: ", '</strong>', round(df_Saltmarsh$D_01_men, 2),
                         '<br/>', '<strong>'," Adaptation space: ", '</strong>', round(df_Saltmarsh$D_0Ur_men,  2)
)

hover_Saltmarsh <- paste0('<strong>', "Suitability for Saltmarsh: ", '</strong>', df_Saltmarsh$Suitability,
                          '<br/>',
                          '<br/>', '<strong>', '<em>', "Austrostipa stipoides",'</em>', ": ", '</strong>', round(df_Saltmarsh$A_stpds_mx, 2),
                          '<br/>', '<strong>', '<em>', "Gahnia filum",'</em>', ": ", '</strong>', round(df_Saltmarsh$G_flm_mx, 2),
                          '<br/>', '<strong>', '<em>', "Tecticornia arbuscula",'</em>', ": ", '</strong>', round(df_Saltmarsh$T_rbscl_mx, 2)
)


# "Suit_seag", "Suit_shell"
# Seagrass ----------------------------------------------------------------

df_Seagrass <- line_dat %>%
  select("Suit_seag",  # suitability
         "D_01_men",  #Accomodation
         "D_0Ur_men", # Adaptation
         "A_ntrct_mx",
         "H_strls_mx",
         "H_ngrcl_mx",
         "Z_mllr_mx")  %>%
  rename(Suitability = Suit_seag)

text_Seagrass <- paste0('<strong>', "Suitability for Seagrass: ", '</strong>', df_Seagrass$Suitability,
                        '<br/>',
                        '<br/>', '<strong>', '<em>', "Amphibolis antarctica",'</em>', ": ", '</strong>', round(df_Seagrass$A_ntrct_mx, 2),
                        '<br/>', '<strong>', '<em>', "Halophila australis",'</em>', ": ", '</strong>', round(df_Seagrass$H_strls_mx, 2),
                        '<br/>', '<strong>', '<em>', "Heterozostera nigricaluis",'</em>', ": ", '</strong>', round(df_Seagrass$H_ngrcl_mx, 2),
                        '<br/>', '<strong>', '<em>', "Zostera muelleri",'</em>', ": ", '</strong>', round(df_Seagrass$Z_mllr_mx, 2),
                        '<br/>',
                        '<br/>', '<strong>'," Accommodation space: ", '</strong>', round(df_Seagrass$D_01_men, 2),
                        '<br/>', '<strong>'," Adaptation space: ", '</strong>', round(df_Seagrass$D_0Ur_men, 2)
)

hover_Seagrass <- paste0('<strong>', "Suitability for Seagrass: ", '</strong>', df_Seagrass$Suitability,
                         '<br/>',
                         '<br/>', '<strong>', '<em>', "Amphibolis antarctica",'</em>', ": ", '</strong>', round(df_Seagrass$A_ntrct_mx, 2),
                         '<br/>', '<strong>', '<em>', "Halophila australis",'</em>', ": ", '</strong>', round(df_Seagrass$H_strls_mx, 2),
                         '<br/>', '<strong>', '<em>', "Heterozostera nigricaluis",'</em>', ": ", '</strong>', round(df_Seagrass$H_ngrcl_mx, 2),
                         '<br/>', '<strong>', '<em>', "Zostera muelleri",'</em>', ": ", '</strong>', round(df_Seagrass$Z_mllr_mx, 2)
)

# Shellfish ---------------------------------------------------------------

df_Shellfish <- line_dat %>%
  select("Suit_shell",  # suitability
         "D_01_men",  #Accommodation
         "D_0Ur_men", # Adaptation
         "M_gllpr_mx",
         "O_ngs_mx",
         "S_ccllt_mx")  %>%
  rename(Suitability = Suit_shell)

text_Shellfish <- paste0('<strong>', "Suitability for Shellfish: ", '</strong>', df_Shellfish$Suitability,
                         '<br/>',
                         '<br/>', '<strong>', '<em>', "Mytilus galloprovincialis",'</em>', ": ", '</strong>', round(df_Shellfish$M_gllpr_mx, 2),
                         '<br/>', '<strong>', '<em>', "Ostra angasi",'</em>', ": ", '</strong>', round(df_Shellfish$O_ngs_mx, 2),
                         '<br/>', '<strong>', '<em>', "Saccostra cucullata glomerata",'</em>', ": ", '</strong>', round(df_Shellfish$S_ccllt_mx, 2),
                         '<br/>',
                         '<br/>', '<strong>'," Accommodation space: ", '</strong>', round(df_Shellfish$D_01_men, 2),
                         '<br/>', '<strong>'," Adaptation space: ", '</strong>', round(df_Shellfish$D_0Ur_men, 2)
)

hover_Shellfish <- paste0('<strong>', "Suitability for Shellfish: ", '</strong>', df_Shellfish$Suitability,
                         '<br/>',
                         '<br/>', '<strong>', '<em>', "Mytilus galloprovincialis",'</em>', ": ", '</strong>', round(df_Shellfish$M_gllpr_mx, 2),
                         '<br/>', '<strong>', '<em>', "Ostra angasi",'</em>', ": ", '</strong>', round(df_Shellfish$O_ngs_mx, 2),
                         '<br/>', '<strong>', '<em>', "Saccostra cucullata glomerata",'</em>', ": ", '</strong>', round(df_Shellfish$S_ccllt_mx, 2)
)
