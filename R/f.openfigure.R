#' @title open figure files
#'
#' @description open tiff file with sumatra
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.openfigure
#'

f.openfigure<-function(file){
  shell(
    paste('D:/Programs/SumatraPDF/SumatraPDF.exe ',file,sep=''),wait=F
  )
}
