#' @title get utm zone by coordination
#'
#' @description based on
#' https://stackoverflow.com/questions/9186496/determining-utm-zone-to-convert-from-longitude-latitude#9188972
#' help from
#' https://epsg.io/?q=Indonesia%20utm&page=5
#' Lutz Fehrmann (University Göttingen)
#' additional info from:
#' https://www.nceas.ucsb.edu/scicomp/recipes/projections
#' epsg[grep("indonesia", epsg$note, ignore.case=TRUE), c("code","note")]
#' normally I used for Brazil: "+proj=aea +lat_1=10 +lat_2=-40 +lat_0=-25 +lon_0=-50 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.coord2pj.utm
#'
#'
#requires:

f.coord2pj.utm<-function(coord){
  long<-coord[1]
  lat<-coord[2]
  #utm zone
  zone<-(floor((long + 180)/6) %% 60) + 1
  #south indicator
  if (lat<0){
    south<-" +south"
  } else {
    south<-" "
  }
  #projection string
  pj.string<-paste0("+proj=utm +zone=",48,south," +datum=WGS84 +units=m +no_defs")
  print(pj.string)
}
