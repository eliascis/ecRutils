#' @title f.gdal.merge
#'
#' @description f.gdal.merge
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.gdal.merge
#'
#'
f.gdal.merge<-function(
  o="",
  # -o out_filename:
  # The name of the output file, which will be created if it does not already exist (defaults to "out.tif").
  of="",
  # -of format:
  # Select the output format. Starting with GDAL 2.3, if not specified, the format is guessed from the extension (previously was GTiff). Use the short format name.
  co="",
  # -co NAME=VALUE:
  # Creation option for output file. Multiple options can be specified. See format specific documentation for legal creation options for each format
  ot="",
  # -ot datatype:
  # Force the output image bands to have a specific type. Use type names (i.e. Byte, Int16,...)
  ps="",
  # -ps pixelsize_x pixelsize_y:
  # Pixel size to be used for the output file. If not specified the resolution of the first input file will be used.
  #
  tap="",
  # -tap:
  # (GDAL >= 1.8.0) (target aligned pixels) align the coordinates of the extent of the output file to the values of the -tr, such that the aligned extent includes the minimum extent.
  #
  ul_lr="",
  # -ul_lr ulx uly lrx lry:
  # The extents of the output file. If not specified the aggregate extents of all input files will be used.
  v="",
  # -v:
  # Generate verbose output of mosaicing operations as they are done.
  separate="",
  # -separate:
  # Place each input file into a separate band.
  pct="",
  # -pct:
  # Grab a pseudo-color table from the first input image, and use it for the output. Merging pseudo-colored images this way assumes that all input files use the same color table.
  n="",
  # -n nodata_value:
  # Ignore pixels from files being merged in with this pixel value.
  a_nodata="",
  # -a_nodata output_nodata_value:
  # (GDAL >= 1.9.0) Assign a specified nodata value to output bands.
  init="",
  # -init "value(s)":
  # Pre-initialize the output image bands with these values. However, it is not marked as the nodata value in the output file. If only one value is given, the same value is used in all the bands.
  createonly="",
  # -createonly:
  # The output file is created (and potentially pre-initialized) but no input image data is copied into it.
  input_files,
  add.something.at.the.end=""

){

  cmd<-paste("")
  cmd<-paste(
    paste('"gdal_merge.py"'),
    # paste("--config GDAL_CACHEMAX",cachemax),
    paste("-o",o),
    ifelse(
      of!="",
      paste("-of",of),
      paste("")
    ),
    ifelse(
      co!="",
      paste('-co',co),
      paste("")
    ),
    ifelse(
      ot!="",
      paste("-ot",ot),
      paste("")
    ),
    ifelse(
      ps!="",
      paste("-ps",ps),
      paste("")
    ),
    ifelse(
      tap!="",
      paste("-tap",tap),
      paste("")
    ),
    ifelse(
      ul_lr!="",
      paste("-ul_lr",ul_lr),
      paste("")
    ),
    ifelse(
      v!="",
      paste("-v",v),
      paste("")
    ),
    ifelse(
      separate!="",
      paste("-separate",separate),
      paste("")
    ),
    ifelse(
      pct!="",
      paste("-pct",pct),
      paste("")
    ),
    ifelse(
      n!="",
      paste("-n",n),
      paste("")
    ),
    ifelse(
      a_nodata!="",
      paste("-a_nodata",a_nodata),
      paste("")
    ),
    ifelse(
      init!="",
      paste("-init",init),
      paste("")
    ),
    ifelse(
      createonly!="",
      paste("-createonly",createonly),
      paste("")
    ),
    paste(input_files),
    ifelse(
      add.something.at.the.end!="",
      paste("",add.something.at.the.end),
      paste("")
    )

  )
  return(cmd)

}

# cmd<-f.gdal.merge()
# writeClipboard(cmd)
# write_clip(cmd)


