##****************************************##
## Living shoreline tool shiny app ##
##****************************************##
## Author: Alys Young
## Lead: Dr Becki Morris
##
## Project aim: Assess the suitability of nature-based approaches to coastal protection for Victoria
## Script  aim: the shiny app

# rm(list=ls())


source("1_functions.R")
source("2_set_up.R")
source("3_options_to_edit.R")
source("4_shiny_code.R")
source("5_plots.R")
source("6_text.R")

# library(rsconnect)
# rsconnect::deployApp(account = 'nccc')

##****************##
## User interface ## --------------------------------------------------------------------------------------------------------------------------
##****************##


ui <- bootstrapPage(

  useShinyjs(),

  theme = "https://d2h9b02ioca40d.cloudfront.net/v8.0.1/uom.css",
  tags$head(includeHTML("common/unset_shiny.html")),

  htmlTemplate("common/uomheader.html",
               title = "Living shoreline tool",
               apptitle = "Living shoreline tool",
               subapptitle = "Identifying opportunities for nature-based coastal defence in Victoria, Australia using a shoreline suitability analysis."
  ),



  navbarPage(theme = shinytheme("flatly"), collapsible = TRUE,
             HTML(''),
             id = "nav",
             #windowTitle = "NBCD",


             ## Page 1 - Map --------------------------------------------------------------------------------------
             tabPanel("Map", icon = icon("map"),
                      leafletOutput("leaflet_map", width="auto", height = 600),
                      p(paste("How to cite:", citation)),


                      absolutePanel(id = "controls", class = "panel panel-default",
                                    top = 500, left = 25, width = 320, fixed = FALSE,
                                    draggable = FALSE, height = "auto", style = "opacity: 0.8; padding: 20px 20px 20px 20px",


                                    h3("Shoreline suitability analysis"),
                                    #p("View the most suitable approach to coastal defence by taxa, or the most suitable taxa"),
                                    #p("Identifying opportunities for natural coastal defence using a shoreline suitability analysis for Victoria, Australia"),

                                    selectizeInput(inputId = "taxa",
                                                   label = "Select a taxa:",
                                                   choices = choose_taxa,
                                                   selected = choose_taxa[1]),
                                    selectizeInput(inputId = "approach",
                                                   label = "Suitable approach:",
                                                   choices = choose_approach,
                                                   selected = choose_approach[1:3],
                                                   multiple = TRUE),
                                    # message only shown once load button is clicked
                                    hidden(p(id = "please_wait", "Please wait while the map loads.")),

                                    helpText("This map provides a guide only. Areas should be investigated on-ground prior to deciding on a management option.")

                      )

             ),


             # Page 2 - Case studies ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
             # tabPanel("Case studies", icon = icon("search"),
             #          # tabs on the main panel
             #          tabsetPanel(id = "tab_plot",
             #
             #                      tabPanel(h4("1: Torquay"),
             #                               h3("Case study 1: Torquay"),
             #                               p("Reason and description of case study"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               p("Images of the area"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               leafletOutput("leaflet_case1", height = 300),
             #                               p(paste("How to cite:", citation))
             #                      ),
             #
             #                      tabPanel(h4("2: Corner Inlet"),
             #                               h3("Case study 2: Corner Inlet"),
             #                               p("Reason and description of case study"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               p("Images of the area"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               leafletOutput("leaflet_case2", height = 300),
             #                               p(paste("How to cite:", citation))
             #                      ),
             #
             #                      tabPanel(h4("3: Lakes Entrance"),
             #                               h3("Case study 3: Lakes Entrance"),
             #                               p("Reason and description of case study"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               p("Images of the area"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               leafletOutput("leaflet_case3", height = 300),
             #                               p(paste("How to cite:", citation))
             #                      ),
             #
             #                      tabPanel(h4("4: Mallacoota"),
             #                               h3("Case study 4: Mallacoota"),
             #                               p("Reason and description of case study"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               p("Images of the area"),
             #                               p("Paragraph descriptions"),
             #                               br(),
             #                               br(),
             #                               leafletOutput("leaflet_case4", height = 300),
             #                               p(paste("How to cite:", citation))
             #                      )
             #
             #          )),

             # Page 3 - More information ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
             navbarMenu(("More information"), icon = icon("info"), # change icon

                        # 3.1 Context --------------------------------------------------------------------------------------
                        tabPanel(("About living shorelines"),

                                 h3("Introduction"),
                                 context_1,
                                 context_2,
                                 context_3,
                                 br(),
                                 h3("This project"),
                                 aims,
                                 methods_brief,
                                 br(),

                                 h3("Key publications"),
                                 publication_list,
                                 br(),
                                 br(),
                                 fluidRow(
                                   column(6, img(src = 'Logos.png', align = "left", width = '100%', height = 'auto'))
                                 )
                        ),

                        # 3.2 Methods --------------------------------------------------------------------------------------
                        tabPanel(("Methods"),

                                 h3("Species"),
                                 methods_species,
                                 br(),
                                 fluidRow(
                                   column(3),
                                   column(6, DT::dataTableOutput("table_species")),
                                   column(3)
                                 ),


                                 #DT::dataTableOutput("table_species"),

                                 br(),

                                 h3("Species distribution models (SDMs)"),
                                 methods_SDM,
                                 br(),

                                 h3("Shoreline suitability analysis"),
                                 methods_suit1,
                                 br(),
                                 methods_suit2,
                                 br(),

                                 fluidRow(
                                   column(6, img(src = 'Logos.png', align = "left", width = '100%', height = 'auto'))
                                 )
                        ), # close tab panel

                        # 3.3 Authors --------------------------------------------------------------------------------------
                        tabPanel("Authors",

                                 h3("Authors"),

                                 fluidRow(
                                   column(4, img(src='Becki.png', align = "center", width = 'auto', height = '250px'),
                                          p("Dr Rebecca Morris, Project lead"),
                                          p("Becki is an ARC DECRA fellow, lecturer in ecology and Program leader of eco-engineering at the National Centre for Coasts and Climate at the University of Melbourne."),
                                          p("rebecca.morris@unimelb.edu.au")),

                                   column(4, img(src='Rebecca.png', align = "centre", width = 'auto', height = '250px'),
                                          p("Dr Rebecca Runting"),
                                          p("Rebecca is an ARC DECRA fellow, lecturer in spatial science and examines both the conservation and economic values of spatial planning at the University of Melbourne.")),

                                   column(4, img(src='Teresa.png', align = "centre", width = 'auto', height = '250px'),
                                          p("Dr Teresa Konlechner"),
                                          p("Teresa is coastal geomorphologist, Senior Vegetation Ecologist with Wildland Consultants and an Honorary Fellow at the University of Melbourne.") )

                                 ), # close fluid row


                                 fluidRow(
                                   column(4, img(src='Beth.png', align = "center", width = 'auto', height = '250px'),
                                          p("Dr Beth Strain"),
                                          p("Beth is a Research Fellow at the Institute for Marine and Antarctic Science at the University of Tasmania and is an Honorary Fellow at the University of Melbourne.") ),

                                   column(4, img(src='Heini.png', align = "centre", width = 'auto', height = '250px'),
                                          p("Dr Heini Kujala"),
                                          p("Heini researches systematic conservation planning at the University of Helsinki and is an Honorary Fellow at the University of Melbourne."))
                                 ), # close fluid row

                                 fluidRow(
                                   column(4, img(src='Alys.png', align = "centre", width = 'auto', height = '250px'),
                                          p("Alys Young"),
                                          p("Alys is a research assistant in biodiversity modelling at the University of Melbourne and PhD candidate at Deakin University.")),

                                   column(4, img(src='Evy.png', align = "centre", width = 'auto', height = '250px'),
                                          p("Evy Gomm"),
                                          p("Evy undertook her Masters in computational biology at the University of Melbourne with Dr Morris and Dr Runting."))
                                 ), # close fluid row
                                 br(),

                                 h3("Contact details"),
                                 p("For questions and queries, please contact Dr Becki Morris on rebecca.morris@unimelb.edu.au "),
                                 br(),


                                 h3("Sponsors and funding"),
                                 p("This work was funded through the School of BioSciences SEED19 grant at the University of Melbourne. The National Centre for Coasts and Climate is funded through the Earth Systems and Climate Change Hub by the Australian Government’s National Environmental Science Program."),
                                 fluidRow(
                                   column(6, img(src = 'Logos.png', align = "left", width = '100%', height = 'auto'))
                                 )
                        ) # # close tab panel
             ), # close nav bar


             ## Page 4 - Share  ----------------------------------------------------------------
             navbarMenu(("Share"), icon = icon("share-alt"), # consider adding a hashtag

                        ## Facebook
                        ## tabPanel(tags$a(href = 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2nccc.edu.au', icon("facebook"), "Facebook" )),

                        ## Twitter
                        tabPanel(tags$a(href = paste0("https://twitter.com/intent/tweet?url=", share_url ," &text=", share_message), icon("twitter"), "Twitter" )),

                        ## LinkedIn
                        tabPanel(tags$a(href = paste0("http://www.linkedin.com/shareArticle?mini=true&url=", share_url, " &title=", share_message), icon("linkedin"), "LinkedIn" ))
             ) # close navbar2
  ), # close navbar1

  htmlTemplate("common/uomfooter.html")
)






##********##
## Server ## --------------------------------------------------------------------------------------------------------------------------
##********##


server <- function(input,output, session){

  observeEvent(RV(), {
    shinyjs::show("please_wait")
    shinyjs::delay(10, hide("please_wait"))
    })


  RV <- reactive({
    list(input$taxa, input$approach)
  })

  output$leaflet_map <- renderLeaflet({
    l
  })

  observeEvent(RV(), {

    ## Data overall
    taxa_data <- get(paste0("df_", input$taxa))

    ## Text for pop up
    popup_text <- get(paste0("text_", input$taxa))

    hover_text <- get(paste0("hover_", input$taxa))


    if(length(input$approach) == 3){
      selected_data <- taxa_data
    } else if (length(input$approach) == 2){

      if ("Soft" %!in% input$approach) {
        selected_data <- taxa_data %>% filter(Suitability != 3)
      } else if ("Hybrid" %!in% input$approach) {
        selected_data <- taxa_data %>% filter(Suitability != 2)
      } else if ("Not suitable" %!in% input$approach) {
        selected_data <- taxa_data %>% filter(Suitability != 1)
      }

    } else if (length(input$approach) == 1){

      if (input$approach == "Soft") {
        selected_data <- taxa_data %>% filter(Suitability == 3)
      } else if (input$approach == "Hybrid") {
        selected_data <- taxa_data %>% filter(Suitability == 2)
      } else if (input$approach == "Not suitable") {
        selected_data <- taxa_data %>% filter(Suitability == 1)
      }

    } else {
      selected_data <- taxa_data
    }

    if(input$taxa == "All"){

      ## Map without any ALA points
      leafletProxy("leaflet_map") %>%
        clearShapes() %>%
        clearMarkers() %>%
        # l %>%
        addPolylines(data = selected_data,
                     color = ~pal_suit(Suitability),
                     popup = popup_text,
                     highlightOptions = highlightOptions(weight = 20),
                     label = lapply(hover_text, htmltools::HTML))

    } else {

      ## Select the points to use
      occ_points <- get(paste0("point_", input$taxa))

      ## Map
      leafletProxy("leaflet_map") %>%
        clearShapes() %>%
        clearMarkers() %>%
        addCircleMarkers(data = occ_points,
                   popup = occ_points$Species,
                   label = occ_points$Species,
                   radius = 3,
                   stroke = FALSE,
                   fillOpacity = 0.8,
                   fillColor = "black",
                   color = "black") %>%
        addPolylines(data = selected_data,
                     color = ~pal_suit(Suitability),
                     popup = popup_text,
                     highlightOptions = highlightOptions(weight = 20),
                     label = lapply(hover_text, htmltools::HTML))
    }

  })





# Methods -----------------------------------------------------------------

  output$table_species <- DT::renderDataTable({

    Species_DT

  })

}


##*****##
## App ## --------------------------------------------------------------------------------------------------------------------------
##*****##
shinyApp(ui = ui, server = server)
