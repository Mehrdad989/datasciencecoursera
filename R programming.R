##### Loops

x<-c(LETTERS[1:5])

for (i in 1:5) {
  print(x[i])
  
}

for (i in seq_along(x)) {
  print(x[i])
  
}

for (i in x) {
  print(i)
  
}

for(i in 1:5) print(x[i])

###

x<- matrix(1:6,2,3)

for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print(x[i,j])
    
  }
  
}

count<-0
while (count<10) {
  print(count)
  count<-count+1
}

z<-5

while (z>=3 && z<=10) {
  print(z)
  coin<- rbinom(1,1,0.5)
  
  if (coin ==1){
    z<-z+1
  }else {
    z<-z-1
  }
  
}

##### functions

esme_ramz<- function(x){
  num<-numeric()
  newvector<-strsplit(tolower(x),"")
  for (i in newvector) {
    a<-match(i,letters)
    num<-append(num,a)
  }
  num<-paste(num,collapse = "")
  return(num)
}
esme_ramz("MEHRdad")

colmean<-function(x,removeNA=TRUE){
  nc<-ncol(x)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(x[,i],na.rm = removeNA)
  }
  return(means)
}

colmean(airquality)


