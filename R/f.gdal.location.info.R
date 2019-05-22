#' @title f.gdal.location.info
#'
#' @description f.gdal.location.info
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.location.info
#'

f.gdal.location.info<-function(
  xml=NULL,
  lifonly=NULL,
  valonly=NULL,
  b=NULL,
  overview =NULL,
  l_srs=NULL,
  geoloc=NULL,
  wgs84=NULL,
  oo=NULL,
  srcfile=NULL,
  x=NULL,
  y=NULL
){
  # xml=NULL,
  # lifonly=NULL,
  # valonly=NULL,
  # b=NULL,
  # overview =NULL,
  # l_srs=NULL,
  # geoloc=NULL,
  # wgs84=NULL,
  # oo=NULL,
  # srcfile=NULL,
  # x=NULL,
  # y=NULL
  args<-c(
    "xml",
    "lifonly",
    "valonly",
    "b",
    "overview",
    "l_srs",
    "geoloc",
    "wgs84",
    "oo"#,
    # "srcfile",
    # "x",
    # "y"
  )
  #argument names
  names(args)<-args
  ##args list
  args<-as.list(args)
  #keep only non-null arguments
  keep<-unlist(lapply(args,function(x) is.null(get(x))))
  keep<-which(keep==0)
  args<-args[keep]
  #argument construct
  args<-lapply(args,function(x) paste0("-",x," ",get(x)))
  args
  ##command
  prgr<-paste0('"',file.path(gdalfolder,"gdallocationinfo"),'"') #win
  prgr<-paste0('"',"gdallocationinfo",'"') #mac
  options<-paste(unlist(args),collapse=" ")
  cmd<-paste(
    prgr,
    options,
    srcfile,
    x,
    y
  )
  ##out
  return(cmd)
}
