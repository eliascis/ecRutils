#' @title gdal_proximity.py
#'
#' @description gdal_proximity.py
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export gdal_proximity
#'
#'


f.gdal.proximity<-function(
  srcfile=NULL,
  dstfile=NULL,
  srcband=NULL,
  dstband=NULL,
  of=NULL,
  co=NULL,
  ot=NULL,
  values=NULL,
  distunits=NULL,
  maxdist=NULL,
  nodata=NULL,
  use_input_nodata=NULL,
  fixed.buf.val=NULL
)
{
  # srcfile=NULL
  # dstfile=NULL
  # srcband=NULL
  # dstband=NULL
  # of=NULL
  # co=NULL
  # ot=NULL
  # values=NULL
  # distunits=NULL
  # maxdist=NULL
  # nodata=NULL
  # use_input_nodata=NULL
  # fixed.buf.val=NULL
  #arguments
  args<-c("srcband","dstband","of","co","ot","values","distunits","maxdist","nodata","use_input_nodata","fixed.buf.val")
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
  prgr<-paste0('"',file.path(gdalfolder,"gdal_proximity.py"),'"')
  options<-paste(unlist(args),collapse=" ")
  cmd<-paste(prgr,srcfile,dstfile,options)
  ##out
  return(cmd)
}
