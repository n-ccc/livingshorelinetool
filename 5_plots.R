##****************************************##
## Nature Based Coastal Defence shiny app ## 
##****************************************##
## Author: Alys Young
## Lead: Dr Becki Morris
##
## Project aim: Assess the suitability of nature-based approaches to coastal protection for Victoria
## Script  aim: Premade plots

# library(leaflet)
# library(ggplot2)


### Leaflet map -----------------------------------------------------------------------------------------------------------------------------------------------
labels <- c("1 - Not suitable", "2 - Hybrid approach", "3 - Soft approach", "Species occurrence points")
# for the pop up: bolding '<strong>', '</strong>', new line '<br/>', 
l <- leaflet() %>% 
  setView(lng = 144,  lat = -37.8136, zoom = 7) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addLegend("bottomright", 
            pal = pal_suit, 
            values = 1:4,
            title = "Suitability for nature-based coastal defence",
            opacity = 1,
            labFormat = function(type, cuts, p) { 
              paste0(labels)
            }
            )



# DT::Datatable -----------------------------------------------------------
sp_dt <- sp_df %>% 
  select(Taxa, Link_name, Common_name) %>%
  arrange(Taxa) %>%
  rename('Latin name' = Link_name,
         'Common name' = Common_name)

Species_DT <-  DT::datatable(data = sp_dt, class = 'compact stripe hover', 
                      options = list(dom = 't',
                                       pageLength = 14), escape = FALSE) %>%
  DT::formatStyle("Latin name", `font-style` = 'italic')


### ggplot -----------------------------------------------------------------------------------------------------------------------------------------------
# 
# col_s <- grepl('_s$', colnames(line_dat))
# 
# suit_df <- line_dat[col_s]
# 
# suit_df2 <- suit_df %>%
#   tidyr::pivot_longer(cols =  colnames(line_dat)[col_s],
#                       names_to = "suitability_s") %>%
#   as.data.frame() %>%
#   dplyr::select(c("suitability_s", "value"))
# 
# suit_df2$suitability_s[suit_df2$suitability_s == "Suit_all_s"]   <- "All"  
# suit_df2$suitability_s[suit_df2$suitability_s == "Suit_dune_s"]  <- "Dune"  
# suit_df2$suitability_s[suit_df2$suitability_s == "Suit_shell_s"] <- "Shellfish"  
# suit_df2$suitability_s[suit_df2$suitability_s == "Suit_salt_s"]  <- "Saltmarsh"  
# suit_df2$suitability_s[suit_df2$suitability_s == "Suit_seag_s"]  <- "Seagrass"  
# suit_df2$suitability_s[suit_df2$suitability_s == "Suit_mang_s"]  <- "Mangrove" 
# 
# 
# 
# g <- ggplot(suit_df2, aes(x = suitability_s, y = value, fill = suitability_s)) +
#   geom_boxplot() +
#   scale_fill_manual(values = col_suit$most_suit) +
#   labs(x = "Taxa", y = "Suitability", fill = "Taxa") +
#   theme_bw() +  
#   theme(legend.position = "bottom")
# 
# 
# ### table ---------------------------------------------------------------------------------------------------------------------------------------------------
# sum_df <- as.data.frame(table(line_dat$most_suit))
# colnames(sum_df) <- c("Taxa", "Frequency of most suitable")
# 
# sum_dt <-  DT::datatable(data = sum_df , 
#                          class = 'cell-border hover compact',
#                          options = list(dom = 't'),
#                          rownames= FALSE)
# 
# 
# ## The data table
# sp_dt <-  DT::datatable(data = sp_df, class = 'compact stripe', escape = FALSE, rownames= FALSE,
#                         options = list(dom = 't',
#                                        pageLength = nrow(sp_df))) %>%
#   DT::formatStyle("Latin_name", `font-style` = 'italic')
