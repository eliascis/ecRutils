#' @title f.panel.transform
#'
#' @description f.panel.transform
#'
#' @param
#'
#' @return NULL
#'
#' @examples   d<-spd4testing(missingY=T,missingX=T)
#'
#'   d
#' f <- y ~ x + factor(year)
#'   e<-plm(formula=f,data=d,model="fd")
#'   summary(e)

#'   dd<-panel.transform(formula=f,data=d,model="fd",index=c("id","year"),keep.vars=c("id","year","gid","w"))
#'   dd
#'   ss<-dd
#'   ss<-ss[-(1:4)]
#'   ff<-as.formula(paste(names(ss)[1],"~",paste(names(ss)[-1],collapse="+")))
#'   ff
#'   ee<-lm(formula=ff,data=dd)
#'   summary(ee)

#' @export f.panel.transform
#'

f.panel.transform<-function(
  formula,
  data,
  model="within",
  index=c("id","year"),
  keep.vars=c("id","year")
){
  # formula<-y~x+factor(year)
  # data<-spd4testing(missingY=T,missingX=T)
  # model="fd"
  # index=c("id","year")
  # keep.vars=c("id","year","gid","w")

  ##setup
  f<-formula
  pf<-pFormula(f)
  pData<-pdata.frame(data,index)

  ##restricitons
  if ((model %in% c("fd","within"))!=T){
    stop('panel.transform transforms models of c("fd","within")')
  }

  ##transformed data
  #index

  #reduced data
  # x<-d[,c(pindex,as.character(formula[2]))]
  x<-pData[,index]
  x$rowid<-rownames(x)
  rd<-x

  #model frame
  x<-model.frame(f,pData)
  mf<-x
  #

  #model response
  x<-pmodel.response(object=pf,data=pData,model)
  x<-data.frame(x)
  names(x)<-names(mf)[1]
  mr<-x

  #model matrix - transformed data of explanatory variables
  x<-model.matrix(pf,pData,model)
  # n<-names(e$aliased[e$aliased==F])
  # i<-match(n,colnames(x))
  # i<-i[!is.na(i)] #avoid omited constant variables in new data set
  # x<-x[,i]
  # n<-colnames(x)
  # x<-data.frame(x)
  # names(x)<-n
  mx<-x

  #transformed data = model response + model matrix
  x<-cbind(mr,mx)
  # i<-match("rowid",names(x))
  # i<-c(i,match("(intercept)",names(x)))
  # i<-i[!is.na(i)]
  # if (length(i)>0){
  #   x<-x[,-i]
  # }
  # coefnames<-names(x)[-1]

  #delete intercept
  i<-match("(intercept)",colnames(x))
  x<-x[-i]
  # converts names to be usable in regression
  x<-data.frame(x)

  ##additional untransformed info
  x<-cbind(
    data[rownames(x),keep.vars],
    x
  )

  mt<-x
  mt
  return(mt)

}


# if (nowrun==T){
#   d<-spd4testing(missingY=T,missingX=T)
#   d
#   f <- y ~ x + factor(year)
#   e<-plm(formula=f,data=d,model="fd")
#   summary(e)
#
#   dd<-panel.transform(formula=f,data=d,model="fd",index=c("id","year"),keep.vars=c("id","year","gid","w"))
#   dd
#   ss<-dd
#   ss<-ss[-(1:4)]
#   ff<-as.formula(paste(names(ss)[1],"~",paste(names(ss)[-1],collapse="+")))
#   ff
#   ee<-lm(formula=ff,data=dd)
#   summary(ee)
#
# }