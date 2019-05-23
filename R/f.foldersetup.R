#' @title f.foldersetup
#'
#' @description f.foldersetup
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.foldersetup
#'
# writeClipboard<-function(...){
#   clipr::write_clip(...)
# }

f.foldersetup<-function(){
  #supplements
# figallfolder  <-file.path("/Users/eliascis/dropbox/kairos","research_supplements","figures")
  databasefolder  <-file.path("/Users/eliascis/dropbox/kairos/research_supplements/database")
  #software
  # browser<-file.path(suppfolder,"software/FirefoxPortable/FirefoxPortable.exe")
  # browser<-"C:/programs/Firefox/firefox.exe"
  # gdalfolder<-'C:/Program Files (x86)/GDAL'
  gdalfolder<-''
  o<-list(databasefolder,gdalfolder)
  names(o)<-c("databasefolder","gdalfolder")
  return(o)
}