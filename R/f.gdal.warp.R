#' @title gdalwarp
#'
#' @description f.gdal.warp
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.warp
#'
#'
f.gdal.warp<-function(
  config=NULL,
  s_srs=NULL,
  t_srs=NULL,
  to=NULL,
  novshiftgrid=NULL,
  order=NULL,
  tps=NULL,
  rpc=NULL,
  geoloc=NULL,
  et=NULL,
  refine_gcps=NULL,
  te=NULL,
  te_srs=NULL,
  tr=NULL,
  tap=NULL,
  ts=NULL,
  ovr=NULL,
  wo=NULL,
  ot=NULL,
  wt=NULL,
  r=NULL,
  srcnodata=NULL,
  dstnodata=NULL,
  srcalpha=NULL,
  nosrcalpha=NULL,
  dstalpha=NULL,
  wm=NULL,
  multi=NULL,
  q=NULL,
  of=NULL,
  co=NULL,
  cutline=NULL,
  cl=NULL,
  cwhere=NULL,
  csql=NULL,
  cblend=NULL,
  crop_to_cutline=NULL,
  overwrite=NULL,
  nomd=NULL,
  cvmd=NULL,
  setci=NULL,
  oo=NULL,
  doo=NULL,
  srcfile=NULL,
  dstfile=NULL
)
{
  # config=NULL
  # s_srs="blap"
  # t_srs=NULL
  # to=NULL
  # novshiftgrid=NULL
  # order=NULL
  # tps=NULL
  # rpc=NULL
  # geoloc=NULL
  # et=NULL
  # refine_gcps=NULL
  # te=NULL
  # te_srs=NULL
  # tr=NULL
  # tap=NULL
  # ts=NULL
  # ovr=NULL
  # wo=NULL
  # ot=NULL
  # wt=NULL
  # r=NULL
  # srcnodata=NULL
  # dstnodata=NULL
  # srcalpha=NULL
  # nosrcalpha=NULL
  # dstalpha=NULL
  # wm=NULL
  # multi=NULL
  # q=NULL
  # of=NULL
  # co=NULL
  # cutline=NULL
  # cl=NULL
  # cwhere=NULL
  # csql=NULL
  # cblend=NULL
  # crop_to_cutline=NULL
  # overwrite=NULL
  # nomd=NULL
  # cvmd=NULL
  # setci=NULL
  # oo=NULL
  # doo=NULL
  # srcfile=NULL
  # dstfile=NULL

  #arguments
  args<-c("config","s_srs","t_srs","to","novshiftgrid","order","tps","rpc","geoloc","et","refine_gcps","te","te_srs","tr","tap","ts","ovr","wo","ot","wt","r","srcnodata","dstnodata","srcalpha","nosrcalpha","dstalpha","wm","multi","q","of","co","cutline","cl","cwhere","csql","cblend","crop_to_cutline","overwrite","nomd","cvmd","setci","oo","doo")
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
  # prgr<-paste0('"',file.path(gdalfolder,"gdalwarp.exe"),'"') #win
  prgr<-"gdalwarp" #mac
  # prgr<-"/Library/Frameworks/GDAL.framework/Versions/2.2/gdalwarp"
  options<-paste(unlist(args),collapse=" ")
  cmd<-paste(prgr,options,srcfile,dstfile)
  ##out
  return(cmd)
}
