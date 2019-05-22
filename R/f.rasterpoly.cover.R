#' @title f.rasterpoly.cover
#'
#' @description f.rasterpoly.cover
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.rasterpoly.cover
#'
#'

###rasterize
f.rasterpoly.cover<-function(r.base,layer,new.varname,scalefactor=500){
  # r.base <- mr$mr.25000
  # layer <- l
  # new.varname<-"biome"
  #setup
  resmeter<-res(r.base)[1]
  print(resmeter)
  ##rasterize
  if (nrow(l)!=0){
    r.new<-rasterize(l,r.base,getCover=T)
    #extract values
    x<-getValues(r.new)
    x<-x/100
    #table
    t<-data.frame(x)
    #edit varnames
    names(t)<-new.varname
    ##new id
    t<-cbind(id=c(1:nrow(t)),t)
  } else {
    #table
    t<-data.frame(id=c(1:ncell(r.low)))
    #zero values
    t[,varname]<-0
  }
  ##order
  t<-t[order(t$id),]
  ##check
  ##export
  x<-new.varname
  x<-sub("_parea","",x)
  x<-paste0("_",x,resmeter,".Rds")
  exportname<-x
  saveRDS(t,file.path(datafolder,"tmp",exportname))
  return(t)
}
