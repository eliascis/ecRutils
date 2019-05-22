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

  tfolder<-tempdir()
  lapply(
    as.list(o),
    function(x){
      print(x)
      saveRDS(get(x),file.path(tfolder,paste0("_",prefix,".",x,".Rds")))
    }
  )
  return(tfolder)

}


f.obj.load<-function(prefix="blup",tfolder){
  # prefix = "bfpm"
  # tfolder<-tempdir()
  o<-list.files(tfolder,paste0("_",prefix,"\\.","*.Rds"),full.names=TRUE)
  #load
  lapply(
    as.list(o),
    function(x){readRDS(x)}
  )
  return(tfolder)
}
