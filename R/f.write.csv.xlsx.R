#' @title f.write.csv.xlsx
#'
#' @description f.write.csv.xlsx
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.write.csv.xlsx
#'
f.write.csv.xlsx<-function(
  ...
){
  write.table(...,na="",sep=";",row.names=FALSE,dec=",")
}