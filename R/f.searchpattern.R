#' @title list files containing a string
#'
#' @description list files containing a string
#'
#' @param
#'
#' @return NULL
#'
#' @examples searchpattern(pathlink="H:/kairos/cloudmind/research_projects",expression="save.*_uus_characteristics.dta")
#'
#' @export f.searchpattern
#'

f.searchpattern<-function(pathlink=paste(analyfolder,sep=""),patternlink="\\.do$",expression="blabliblup"){
  #setup
#   pathlink="H:/kairos/cloudmind/research_projects/bolsa-floresta-match"
#   patternlink="\\.do$"
#   expression<-"blabliblup"
  #list files
  lfiles <- list.files(path=pathlink, patternlink ,recursive=T,full.names=T)
  # lfiles[2]
  #read files
  textfiles <- lapply(lfiles,readLines)
  # textfiles[2]
  #matches
  matches<-as.list(rep(0,length(lfiles)))
  # matches[[2]]
  for (i in 1:length(lfiles)) {
    # print(i)
    matches[i]<-lapply(FUN=grep,pattern=expression,X=textfiles[i])
  }
  #table matches
  lmatches<-lapply(FUN=length,X=matches)
  vmatches<-as.vector(lmatches)
  slfiles<-sub(paste(pathlink,"/",sep=""),"",lfiles)
  tmatches<-data.frame(cbind(slfiles,vmatches))
  tmatches[tmatches$vmatches>0,1]

}
