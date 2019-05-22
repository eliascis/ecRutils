#' @title f.gdal.polygonize
#'
#' @description f.gdal.polygonize
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.polygonize
#'
#'


f.gdal.polygonize<-function(
  eight=NULL,
  nomask=NULL,
  mask=NULL,
  raster_file=NULL,
  b=NULL,
  f=NULL,
  out_file=NULL,
  layer=NULL,
  fieldname=NULL,
  q=NULL
)
{
  # eight
  # nomask
  # mask
  # raster_file
  # b
  # f
  # out_file
  # layer
  # fieldname
  # q
  #arguments
  args<-c(
    "eight",
    "nomask",
    "mask",
    # "raster_file",
    "b",
    "f",
    # "out_file",
    # "layer",
    # "fieldname",
    "q"
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
  prgr<-paste0('"',file.path(gdalfolder,"gdal_polygonize.py"),'"') #win
  prgr<-paste0('"',"gdal_polygonize.py",'"') #mac
  options1<-paste(unlist(args[1:3]),collapse=" ")
  options2<-paste(unlist(args[4:5]),collapse=" ")
  options3<-paste(unlist(args[6]),collapse=" ")
  cmd<-paste(prgr,options1,raster_file,options2,out_file,layer,fieldname,options3)
  ##out
  return(cmd)
}
