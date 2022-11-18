##****************************************##
## Nature Based Coastal Defence shiny app ##
##****************************************##
## Author: Alys Young
## Lead: Dr Becki Morris
##
## Project aim: Assess the suitability of nature-based approaches to coastal protection for Victoria
## Script  aim: Pieces of code that can be edited


### Text -----------------------------------------------------------------------------------------------------------------------------------------------

share_message_clean <- "Check out the natural coastal defence opportunities for Victoria"
share_url_clean  <- "https://nccc.shinyapps.io/livingshorelinetool/"

citation <- "National Centre for Coasts and Climate. In prep. Identifying opportunities for nature-based coastal defence using a shoreline suitability analysis." # to do - change this

### Publications -----------------------------------------------------------------------------------------------------------------------------------------------

publication_list <- fluidRow(
  # To add more publications, use the format below
  # p(tags$a(href = url, "Authors., Year."), "Title. Journal, volume(issue), pp.page-page"),
  column(12,
  p(tags$a(href = "https://nespclimate.com.au/wp-content/uploads/2021/05/Nature-Based-Methods_Final_05052021.pdf", "Morris, R.L., Bishop, M.J., Boon, P., Browne, N.K., Carley, J.T., Fest, B.J., Fraser, M.W., Ghisalberti, M., Kendrick, G.A., Konlechner, T.M. and Lovelock, C.E., 2021."), "The Australian guide to nature-based methods for reducing risk from coastal hazards."),
  p(tags$a(href = "https://esajournals.onlinelibrary.wiley.com/doi/full/10.1002/eap.2382?casa_token=o0y7wta43LYAAAAA%3At_mfO7LIg2yZOsWoFOXkH4TBy_FL1l0KLuzXYpo59iXVAy47fP4Y_HGHuoJiejzcPtWypEdULPnMXfdW", "Morris, R.L., La Peyre, M.K., Webb, B.M., Marshall, D.A., Bilkovic, D.M., Cebrian, J., McClenachan, G., Kibler, K.M., Walters, L.J., Bushek, D. and Sparks, E.L., 2021. "), "Large‐scale variation in wave attenuation of oyster reef living shorelines and the influence of inundation duration. Ecological Applications, p.e2382."),
  p(tags$a(href = "https://www.nature.com/articles/s41558-020-0798-9", "Morris, R.L., Boxshall, A. and Swearer, S.E., 2020."), "Climate-resilient coasts require diverse defence solutions. Nature Climate Change, 10(6), pp.485-487."),
  p(tags$a(href = "https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1002/fee.1809", "Morris, R.L., Porter, A.G., Figueira, W.F., Coleman, R.A., Fobert, E.K. and Ferrari, R., 2018. "), "Fish‐smart seawalls: a decision tool for adaptive management of marine infrastructure. Frontiers in Ecology and the Environment, 16(5), pp.278-287.")
  )
)

