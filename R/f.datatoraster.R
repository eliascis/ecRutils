#' @title f.datatoraster
#'
#' @description f.datatoraster
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.datatoraster
#'
f.datatoraster<-function(
  r,
  data,
  var,
  id
){
  # r<-mr$mr.25000
  # data<-q
  # id="id"
  resmeter<-res(r)[1]
  ##full id list
  idlist<-data.frame(1:ncell(r))
  names(idlist)<-id
  s<-merge(idlist,data,by=id,all.x=T)
  s<-s[order(s$id),]
  nrow(s)
  ##data vector
  v<-s[,var]
  length(v)
  ##imput data to raster
  values(r)<-v
  #out
  return(r)
}
