#' @title reprojection with compression
#'
#' @description reprojection with compression
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export
#'
#'

f.gdal.reproject.old<-function(
  path.in.r,
  path.out.r,
  r.ext=c(), #(GDAL >= 1.8.0) set georeferenced extents. The values must be expressed in georeferenced units. If not specified, the extent of the output file will be the extent of the vector layers.  source.crs="",  # crs given as proj4string
  r.res=c(),
  resampling_method="", #bilinear, average, .....
  r.nodatavalue="",
  source.crs="",
  # target.crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs",#defaults to WGS84
  target.crs = "+proj=aea +lat_1=10 +lat_2=-40 +lat_0=-25 +lon_0=-50 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs",
  datatype="UInt16", # Byte, UInt16, Int16, UInt32, Int32, Float32, Float64, CInt16, CInt32, CFloat32, CFloat64
  cachemax="70%", # define the maximum of memory to be used. should be not much more than 30% of total memory
  compression="LZW", # COMPRESS=[JPEG/LZW/PACKBITS/DEFLATE/CCITTRLE/CCITTFAX3/CCITTFAX4/LZMA/NONE]:
  overwrite=F,
  del.vrt=T,
  vrtcommandonly=F,
  invokecommand=F
) # caution, can destroy data
{
  ##vrt output string
  path.vrt<-sub(".tif",".vrt",path.out.r)

  ##remove existing vrt file
  ifelse(
    del.vrt==T,
    file.remove(path.vrt),
    paste("")
  )

  ##construct vrt
  command.vrt<-paste("")
  command.vrt<-paste(
    paste('"C:/Program Files (x86)/gdal/gdalwarp.exe"'),
    paste("--config GDAL_CACHEMAX",cachemax),
    paste("-of vrt"),
    paste("-ot",datatype),
    ifelse(
      source.crs!="",
      paste0('-s_srs ','"',source.crs,'"'),
      paste("")
    ),
    ifelse(
      target.crs!="",
      paste0('-t_srs ','"',target.crs,'"'),
      paste("")
    ),
    ifelse(
      length(r.ext)!=0,
      paste('-te', r.ext[1],r.ext[3],r.ext[2],r.ext[4]),
      paste("")
    ),
    ifelse(
      length(r.res)!=0,
      paste('-tr', r.res[1],r.res[2]),
      paste("")
    ),
    ifelse(
      resampling_method!="",
      paste('-r', resampling_method),
      paste("")
    ),
    ifelse(
      r.nodatavalue!="",
      paste("-srcnodata",r.nodatavalue),
      paste("")
    ),
    ifelse(overwrite==T,paste("-overwrite"),paste("")),
    paste(path.in.r),
    paste(path.vrt)
  )
  # in and output path for shapes

  ##construct tif from vrt
  command.tif<-paste("")
  command.tif<-paste(
    paste('"C:/Program Files (x86)/gdal/gdal_translate.exe"'),
    paste('--config GDAL_CACHEMAX',cachemax),
    paste0('-co Compress=',compression),
    paste(path.vrt),
    paste(path.out.r)
  )

  ##out command
  command<-command.vrt
  ifelse(
    vrtcommandonly==T,
    paste(""),
    command<-c(command,command.tif)
  )
  ifelse(
    invokecommand==T,
    system(command),
    paste("")
  )
  writeClipboard(command)
  return(command)
}
