#' @title f.browse
#'
#' @description f.browse
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.browse
#'

f.browse<-function(
  data,
  i,
  columns=names(data),
  r=10
){
  data[max(i-r,0):min(i+r,nrow(data)),columns]
}

# f.browse(data=d,i=20,columns=c("id","year","impact.pa"))
