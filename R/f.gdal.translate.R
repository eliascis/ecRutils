#' @title f.gdal.translate
#'
#' @description f.gdal.translate
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.reproject
#'
#'
f.gdal.translate<-function(
  config=NULL,
  ot=NULL,
  strict=NULL,
  of=NULL,
  b=NULL,
  mask=NULL,
  expand=NULL,
  outsize=NULL,
  tr=NULL,
  r=NULL,
  scale=NULL,
  exponent=NULL,
  unscale=NULL,
  srcwin=NULL,
  projwin=NULL,
  projwin_srs=NULL,
  epo=NULL,
  eco=NULL,
  a_srs=NULL,
  a_scale=NULL,
  a_offset=NULL,
  a_ullr=NULL,
  a_nodata=NULL,
  colorinterp_X=NULL,
  colorinterp=NULL,
  mo=NULL,
  co=NULL,
  gcp=NULL,
  q=NULL,
  sds=NULL,
  stats=NULL,
  norat=NULL,
  oo=NULL,
  src_dataset=NULL,
  dst_dataset=NULL
)
{
  #arguments
  args<-c(  "config", "ot",  "strict",  "of",  "b",  "mask",  "expand",  "outsize",  "tr",  "r",  "scale",  "exponent",  "unscale",  "srcwin",  "projwin",  "projwin_srs",  "epo",  "eco",  "a_srs",  "a_scale",  "a_offset",  "a_ullr",  "a_nodata",  "colorinterp_X",  "colorinterp",  "mo",  "co",  "gcp",  "q",  "sds",  "stats",  "norat",  "oo")
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
  #config argument
  if (is.na(match("config",names(args)))!=T) {
    args[["config"]]<-sub("-config","--config",args[["config"]])
  }
  ##command
  prgr<-paste0('"',"gdal_translate",'"')
  options<-paste(unlist(args),collapse=" ")
  cmd<-paste(prgr,options,src_dataset,dst_dataset)
  ##out
  return(cmd)
}
