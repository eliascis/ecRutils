#' @title f.gdal.calc
#'
#' @description f.gdal.calc
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.calc
#'

f.gdal.calc<-function(
  h=NULL,
  calc=NULL,
  A=NULL,
  A_band=NULL,
  B=NULL,
  B_band=NULL,
  C=NULL,
  C_band=NULL,
  outfile=NULL,
  NoDataValue=NULL,
  type=NULL,
  format=NULL,
  creation.option=NULL,
  allBands=NULL,
  overwrite=NULL,
  debug=NULL,
  quiet=NULL
){
  # h="blup"
  # calc="blup"
  # A="blup"
  # A_band="blup"
  # B="blup"
  # B_band="blup"
  # C="blup"
  # C_band="blup"
  # outfile=f="blup"
  # NoDataValue="blup"
  # type="blup"
  # format="blup"
  # creation.option="blup"
  # allBands="blup"
  # overwrite="blup"
  # debug="blup"
  # quiet="blup"

  #arguments
  args<-c("h","calc","A","A_band","B","B_band","C","C_band","outfile","NoDataValue","type","format","creation.option","allBands", "overwrite","debug","quiet")
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
  prgr<-"gdal_calc.py" #mac
  # prgr<-"/Library/Frameworks/GDAL.framework/Versions/2.2/gdalwarp"
  options<-paste(unlist(args),collapse=" ")
  #double --
  dd<-c("calc","A_band","B_band","C_band","outfile","NoDataValue","type","format","creation","allBands","overwrite","debug","quite")
  for (o in dd){
    options<-sub(paste0("-",o),paste0(" --",o),options)
  }
  #dashlines in options
  options<-sub("--creation.option","--creation-option",options)
  #command
  cmd<-paste(prgr,options)
  ##out
  return(cmd)

}
