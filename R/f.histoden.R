#' @title f.histoden
#'
#' @description f.histoden
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.histoden
#'



f.histoden<-function(x,scale=10^0,logplot=T,asinh=T){
  print(summary(x))
  # x<-d$credit_total
  x<-x[is.na(x)!=T]
  #normal
  if (logplot==F & asinh==F){
    hist((x/scale),freq=F)
    lines(density((x/scale)),col="orange")
  }
  #logarithmiert
  if (logplot==T){
    hist(log(x/scale+1),freq=F)
    lines(density(log(x/scale)+1),col="orange")
  }
  #asinh
  if (asinh==T){
    hist(asinh(x/scale),freq=F)
    lines(density(asinh(x/scale)),col="orange")
  }
}