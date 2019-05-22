#' @title f.gdal.rasterize
#'
#' @description f.gdal.rasterize
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.rasterize
#'
#'
#'
f.gdal.rasterize<-function(
  b=NULL,
  i=NULL,
  at=NULL,
  burn=NULL,
  a=NULL,
  three_d=NULL,
  add=NULL,
  l=NULL,
  where=NULL,
  sql=NULL,
  dialect=NULL,
  of=NULL,
  a_nodata=NULL,
  init=NULL,
  a_srs=NULL,
  to=NULL,
  co=NULL,
  te=NULL,
  tr=NULL,
  tap=NULL,
  ts=NULL,
  ot=NULL,
  q=NULL,
  src_datasource=NULL,
  dst_filename=NULL
)
{
  # b="blup"
  # i=NULL
  # at=NULL
  # burn=NULL
  # a=NULL
  # three_d=NULL
  # add=NULL
  # l=NULL
  # where=NULL
  # sql=NULL
  # dialect=NULL
  # of=NULL
  # a_nodata="-Inf"
  # init=NULL
  # a_srs=NULL
  # to=NULL
  # co=NULL
  # te=NULL
  # tr=NULL
  # tap=NULL
  # ts=NULL
  # ot=NULL
  # q=NULL
  # src_datasource=NULL
  # dst_filename=NULL
  #arguments
  args<-c("b","i","at","burn","a","three_d","add","l","where","sql","dialect","of","a_nodata","init","a_srs","to","co","te","tr","tap","ts","ot","q")
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
  prgr<-paste0('"',file.path(gdalfolder,"gdal_rasterize.exe"),'"') #win
  prgr<-paste0('"',"gdal_rasterize",'"') #mac
  options<-paste(unlist(args),collapse=" ")
  cmd<-paste(prgr,options,src_datasource,dst_filename)
  ##out
  return(cmd)
}
f.gdal.shp2raster<-f.gdal.rasterize
