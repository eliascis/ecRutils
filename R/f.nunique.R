#' @title f.nuniques
#'
#' @description f.nunique
#'
#' @param
#'
#' @return NULL
#'
#' @examples f.nunique(c(1,1,1,1,2,2,2,3,3,3,4,5,6))
#'
#' @export f.test
#'

f.nunique<-function(...){
  u<-length(unique(...))
  n<-length(...)
  k<-n/u
  v<-c(u,n,k)
  names(v)<-c("unique","length","groups")
  print(v)

}


