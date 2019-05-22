#' @title f.footballfieldconverter
#'
#' @description f.footballfieldconverter
#' # meter [100-110]*[64-75] for international matches
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.footballfieldconverter
#'

f.footballfieldconverter<-function(
  a,
  unit="sqkm",
  footballfieldarea=105*68 # meter [100-110]*[64-75] for international matches
){
  if (unit=="sqm"){
    am<-a
  }
  if (unit=="sqkm"){
    am<-a*1000^2
  }
  if (unit=="ha"){
    am<-a*100^2
  }
  f<- am / footballfieldarea

  return(f)

}
