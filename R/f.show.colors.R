#' @title f.show.colors
#'
#' @description f.show.colors
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.show.colors
#'
f.show.colors<-function(
  use.colors=colorRampPalette(colors=c("grey20","grey80"))(6)
)
{
  n<-length(use.colors)
  r<-raster(ncol=n,nrow=1)
  r[]<-1:n
  plot(r,col=use.colors)
}

# f.show.colors()

