#' @title save and load bulk of objects
#'
#' @description save and load bulk of objects
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.obj.save
#' @export f.obj.load
#'



f.obj.save<-function(prefix="blup"){
  # prefix = "bfpm"
  o<-ls()
  exclude<-c(
    "x"
  )
  #subset
  i<-match(exclude,o)
  o<-o[-i]

  lapply(
    as.list(o),
    function(x){
      print(x)
      saveRDS(get(x),file.path(tempfolder,paste0("_",prefix,".",x,".Rds")))
    }
  )
}


f.obj.load<-function(prefix="blup"){
  # prefix = "bfpm"
  o<-list.files(tempfolder,paste0("_",prefix,"\\.","*.Rds"),fullpath=T)
  #load
  lapply(
    as.list(o),
    function(x){readRDS(x)}
  )
}
