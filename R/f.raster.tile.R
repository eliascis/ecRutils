#' @title f.raster.tile
#'
#' @description f.raster.tile
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.raster.tile
#'
#'

f.raster.tile<-function(
  r,
  n.tiles
){
  # r<- raster(nrow=100, ncol=150)
  # r[]<-1:c(nrow(r)*ncol(r))
  # n.tiles<-15

  t.size<-ceiling((ncell(r)/n.tiles)^0.5)

  n.r<-seq(1,nrow(r)*2,by=t.size)
  n.r<-n.r[n.r[]<nrow(r)]


  n.c<-seq(1,ncol(r)*2,by=t.size)
  n.c<-n.c[n.c[]<ncol(r)]
  n.c

  td<-expand.grid(n.r,n.c)
  a<-lapply(
    1:nrow(td),
    function(i){
      # i<-1
      td[i,]
      n.ext<-c(
        td[i,1],
        min(td[i,1]+t.size-1,nrow(r)),
        td[i,2],
        min(td[i,2]+t.size-1,ncol(r))
      )
    }
  )
  # t<-lapply(
  #   a,
  #   function(e){
  #     # e<-a[[1]]
  #     # rn<-raster::crop(r,extent(r,e[1],e[2],e[3],e[4]),filename=file.path(datafolder,"tmp",paste0("r.tile.1.tif")))
  #     return(rn)
  #   }
  # )
  # return(t)
}
