#' @title f.data.transform
#'
#' @description f.data.transform
#'
#' @param
#'
#' @return NULL
#'
#' @examples
#'
#' @export f.data.transform
#'
# library(spd4testing)
# library(plm)

f.data.transform<-function(
  data,
  formula=NULL,
  vars=NULL,
  index,
  model="fd"
){
  data<-spd4testing()
  formula= y~ x + factor(year)
  vars<- NULL
  index<-c("id","year")
  model="fd"

  # data<-spd4testing()
  # formula=NULL
  # vars<-c("y","x")
  # index<-c("id","year")

  ##restrictions
  if(!(model %in% c("fd"))){
    stop("unsepcified model")
  }

  ##convert to panel data frame
  # if (class(data)[1]=="data.frame"){
  #   d<-pdata.frame(data,index)
  # }
  # if (class(data)[1]=="pdata.frame"){
  #   d<-data
  # }
  # d
  ##convert formula to pFormula
  if (class(formula)[1]=="formula"){
    f<-pFormula(formula)
  }
  if (class(formula)[1]=="pFormula"){
    f<-formula
  }

  ##response
  mf<-model.frame(f,d)
  model.matrix(f,mf,model="fd",effect="individual")


  ##formula to variable list
  if (class(formula) %in% c("formula","pFormula") & is.null(vars)==T){
    f<-formula
    # f<-y~x + z| id + year | 0 | id
    fs<-Reduce(paste, deparse(f))
    fs<-unlist(strsplit(fs,"~|\\|"))
    fs<-fs[1:2]
    fs<-unlist(strsplit(fs,"\\+"))
    fs<-gsub(" ","",fs)
    #exclude covariates which were excluded by pdata.frame
    i<-match(fs,names(d))
    i<-i[!is.na(i)]
    vars<-names(d)[i]
  }

  ##first differences of variables
  if (model=="fd"){
    print("First Difference transformation")
    a<-lapply(
      as.list(vars),
      function(v){
        v<-d[,v]
        v-plm::lag(v,lag=1)
      }
    )
    vt<-do.call("cbind",a)
    vt<-data.frame(vt)
    names(vt)<-vars
  }

  if (model=="within"){
    print("Fixed Effects transformation")

  }

  #replace variables
  dt<-data
  dt[vars]<-vt[vars]
  # data
  # dt
  #out
  return(dt)
}

# if (nowrun==T){
#
#   d<-spd4testing()
#   d
#   f<-y~x + z| id + year | 0 | id
#   data.transform(data=d,vars=f,index=c("id","year"))
#
#
# }


# if (nowrun==T){
#
#   #my clustering
#   f<-y~x + factor(year)
#   e<-plm(f,d,model="within")
#   e$vcov<-vcovTamal(estimate=e,data=d,groupvar="gid",byhand=F)
#   summary(e)
#
#   #lfe
#   f<-y~x| id + year | 0 | id
#   f<-y~x| id + year | 0 | 0
#   e<-felm(f,d)
#   summary(e)
#
#
#   #FD
#   f<-y~x+factor(year)
#   e<-plm(f,d,model="fd")
#   summary(e)
#   ##transform and lfe for FD
#   dt<-fd.data(d,c("y","x"),index=c("id","year"))
#   f<-y~x | year | 0 | 0
#   e<-felm(f,dt)
#   summary(e)
#
# }