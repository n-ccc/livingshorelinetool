##****************************************##
## Nature Based Coastal Defence shiny app ##
##****************************************##
## Author: Alys Young
## Lead: Dr Becki Morris
##
## Project aim: Assess the suitability of nature-based approaches to coastal protection for Victoria
## Script  aim: functions



#' Change plain text/url for the social media share message
#'
#' @description Takes normal text and the url that will be linked to the social media share buttons, and turns it into the correct syntax.
#' @param message Character string with a message or url.
#'
#' @return A character string with the correct syntax to feed into href.
#'
#' @examples
#' text_to_code("Hello, here is your message")
#' text_to_code("www.google.com")
text_to_code <- function(message){

  replaced <- message %>%
    stringr::str_replace_all( ":", "%3A") %>%
    stringr::str_replace_all( "/", "%2F") %>%
    stringr::str_replace_all( " ", "%20")
  return(replaced)
}

'%!in%' <- function(x,y)!('%in%'(x,y))
`%notin%` <- Negate(`%in%`)
