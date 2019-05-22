#' @title writeClipboard
#'
#' @description writeClipboard
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export writeClipboard
#'
# writeClipboard<-function(...){
#   clipr::write_clip(...)
# }

writeClipboard<-function (...)
{
    clipr::write_clip(...,allow_non_interactive = TRUE)
}
