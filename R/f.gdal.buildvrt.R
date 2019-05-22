#' @title f.gdal.buildvrt
#'
#' @description f.gdal.buildvrt
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.buildvrt
#'

f.gdal.buildvrt<-function(
  tileindex=NULL,
  resolution=NULL,
  te=NULL,
  tr=NULL,
  tap=NULL,
  separate=NULL,
  b=NULL,
  sd=NULL,
  allow_projection_difference=NULL,
  q=NULL,
  optim=NULL,
  addalpha=NULL,
  hidenodata=NULL,
  srcnodata=NULL,
  vrtnodata=NULL,
  a_srs=NULL,
  r=NULL,
  oo=NULL,
  input_file_list=NULL,
  overwrite=NULL,
  output.vrt=NULL,
  gdalfile=NULL
)
{
  #arguments
  args<-c("tileindex","resolution","te","tr","tap","separate","b","sd","allow_projection_difference","q","optim","addalpha","hidenodata","srcnodata","vrtnodata","a_srs","r","oo","input_file_list","overwrite")
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
  # prgr<-paste0('"',file.path(gdalfolder,"gdalwarp.exe"),'"') #win
  prgr<-"gdalbuildvrt" #mac
  # prgr<-"/Library/Frameworks/GDAL.framework/Versions/2.2/gdalwarp"
  options<-paste(unlist(args),collapse=" ")
  #double dash
  # dd<-c("calc","A_band","B_band","C_band","outfile","NoDataValue","type","format","creation","allBands","overwrite","debug","quite")
  # for (o in dd){
  #   options<-sub(paste0("-",o),paste0(" --",o),options)
  # }
  #dashlines in options
  # options<-sub("--creation.option","--creation-option",options)
  #command
  cmd<-paste(prgr,options,output.vrt,gdalfile)
  ##out
  # print(cmd)
  return(cmd)

}
