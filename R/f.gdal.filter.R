#' @title filter values of raster
#'
#' @description filter values of raster
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.filter
#'

f.gdal.filter<-function(
  path.in.r,
  path.out.r="",
  r.calc,
  nodatavalue="", #better leave it empty, to aggregate later means of {0,1} values
  overwrite=F,
  invokecommand=F
) # caution, can destroy data
{
  ##interim file string
  path.interim<-sub(".tif","_interim.tif",path.out.r)

  ##interim calculated interim file
  command.calc<-""
  command.calc<-paste(
    paste('"C:/Program Files (x86)/gdal/gdal_calc.py"'),
    paste("-A ",path.in.r),
    paste('--outfile=',path.interim, sep=""),
    paste0('--calc ','"',r.calc,'"'),
    ifelse(
      overwrite==T,
      paste("--overwrite"),
      paste("")
    ),
    ifelse(
      nodatavalue!="",
      paste0("--NoDataValue=",nodatavalue),
      paste("")
    )
  )

  ##out command
  command<-command.calc
  ifelse(
    invokecommand==T,
    system(command),
    paste("")
  )
  return(command)
}
