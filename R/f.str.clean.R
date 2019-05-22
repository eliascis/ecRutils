#' @title f.str.clean
#'
#' @description f.str.clean
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.str.clean
#'
#'

f.str.clean<-function(
  x
) {
  o<-x
  o<-gsub("á","a",o)
  o<-gsub("é","e",o)
  o<-gsub("í","i",o)
  o<-gsub("ó","o",o)
  o<-gsub("ú","u",o)

  o<-gsub("à","a",o)
  o<-gsub("è","e",o)
  o<-gsub("ì","i",o)
  o<-gsub("ò","o",o)
  o<-gsub("ù","u",o)

  o<-gsub("â","a",o)
  o<-gsub("ê","e",o)
  o<-gsub("î","i",o)
  o<-gsub("ô","o",o)
  o<-gsub("û","u",o)

  o<-gsub("ä","a",o)
  o<-gsub("ë","e",o)
  o<-gsub("ï","i",o)
  o<-gsub("ö","o",o)
  o<-gsub("ü","u",o)

  o<-gsub("ã","a",o)
  o<-gsub("õ","o",o)

  o<-gsub("ç","c",o)
  o<-gsub("^ ","",o)
  o<-gsub(" $","",o)

  return(o)
}
