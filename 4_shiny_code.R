##****************************************##
## Nature Based Coastal Defence shiny app ## 
##****************************************##
## Author: Alys Young
## Lead: Dr Becki Morris
##
## Project aim: Assess the suitability of nature-based approaches to coastal protection for Victoria
## Script  aim: Pieces of shiny code to make app simpler


### Choices -----------------------------------------------------------------------------------------------------------------------------------------------

choose_taxa <- c("All", "Dune", "Mangrove", "Saltmarsh", "Seagrass", "Shellfish")
choose_approach <- c("Soft", "Hybrid", "Not suitable")

### Text -----------------------------------------------------------------------------------------------------------------------------------------------
share_message <- text_to_code(share_message_clean)
share_url <- text_to_code(share_url_clean)

### Colour palette -----------------------------------------------------------------------------------------------------------------------------------------------
col_suit <- list(
  `most_suit`   = c(
    `All`       = "#32a852", #green
    `Dune`      = "#ffba19", # yellow/orange
    `Shellfish` = "#ff196d", # pink/red
    `Saltmarsh` = "#443bff", # royal blue
    `Seagrass`  = "#42d9ff", # teal blue green
    `Mangrove`  = "#ad42ff"), # purple
  
  `most_suit_raw`  = c(
    `Suit_all_s`   = "#32a852", #green
    `Suit_dune_s`  = "#ffba19", # yellow/orange
    `Suit_shell_s` = "#ff196d", # royal blue
    `Suit_salt_s`  = "#443bff", # pink/red
    `Suit_seag_s`  = "#42d9ff", # teal blue green
    `Suit_mang_s`  = "#ad42ff"), # purple
  
  `suit` = c(
    `1`  = "#ffaa00", # light orange - not suitable
    `2`  = "#fff700", # bright yellow - hyrbid
    `3`  = "#00c90d", # green - soft
    `4`  = "#000000" # black 
  )
)

# suitable_taxa <- c("Suit_all_s", "Suit_dune_s", "Suit_shell_s", "Suit_salt_s", "Suit_seag_s", "Suit_mang_s")
# suitable_taxa2 <- c("All", "Dune", "Shellfish",  "Saltmarsh", "Seagrass", "Mangrove")
#pal_suit_categorical <- leaflet::colorFactor(col_suit$most_suit,  suitable_taxa2)

pal_suit_num <- leaflet::colorNumeric(col_suit$suit,  1:4)
pal_suit <- leaflet::colorFactor(col_suit$suit,  1:4)

