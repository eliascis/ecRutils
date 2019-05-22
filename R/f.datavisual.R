#' @title f.datavisual
#'
#' @description f.datavisual
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.datavisual
#'

f.datavisual<-function(
  r,
  data,
  variable,
  yversion,
  rastername="_datvisual"
){
  # r = mr$mr.25000
  # data = q
  # variable = "est"
  # yversion = 2012
  # rastername = "_datvisual"
  resmeter<-res(r)[1]
  print(resmeter)
  ##subset year
  s<-data[data$year==yversion,]
  s<-s[order(s$id),]
  nrow(s)
  ##data vector
  v<-s[,grep(paste0("^",variable,"$"),names(s))]
  length(v)
  ##imput data to raster
  values(r)<-v
  ##export
  writeRaster(r,file.path(datafolder,"tmp",paste0(rastername,"_",variable,resmeter,".tif")),overwrite=T)
  #out
  return(resmeter)
}
