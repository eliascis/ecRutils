#' @title area statistics of raster
#'
#' @description area statistics of raster
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.raster.area.stats
#'
#'

f.raster.area.stats<-function(l){
  area<-lapply(
    list(1,ncell(l)),
    FUN=function(n){
      # n<-1
      s<-rasterFromCells(l,n)
      a<-raster::area(s)
      amin<-a@data@min
      amax<-a@data@max
      amean<-mean(amin,amax)
      return(amean)
    }
  )
  out<-list(
    unlist(area),
    mean(unlist(area)),
    unlist(area)^0.5
  )
  return(out)
}

# raster.area.stats<-f.raster.area.stats
