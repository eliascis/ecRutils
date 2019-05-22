#' @title f.codebook
#'
#' @description f.codebook
#' codebook function (maybe like stata)
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.codebook
#'

f.codebook<-function(x){
  s<-summary(x)
  u<-length(unique(x))
  o<-c(s,u)
  names(o)<-c(names(s),"Unique")
  return(o)
}
#
# f.codebook(d.crosswalk$id_m)
