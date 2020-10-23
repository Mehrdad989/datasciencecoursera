<<<<<<< HEAD
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

# show loaded packages
search()
library(lme4)

##### Lexical scoping

make.power<-function(x){
  pow<-function(n){
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)
cube(3)
square(2)
# exploring function closure
ls(environment(cube))
get("x",environment(cube))
ls(environment(square))
get("x",environment(square))

##### Coding standard
# Always use text editor/text file (ASCII format)
# indent your code
# limit the lenght of function
# limit the width of code

##### Dates and Times in R ####

x<-as.Date("2020-10-18")
unclass(x)
x<-Sys.time()
p<-as.POSIXlt(x)

y<-strptime("9 jan 2011 11:34:21","%d %b %Y %H:%M:%S")
y-p

##### Looping functions #####

## Lapply
# lapply always return a list
x<-list(a=1:5,b=rnorm(10))
resut<-lapply(x, mean)

x<-1:4
lapply(x, runif)

x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
lapply(x, function(elt) elt[,1])

## Sapply simlify result of lapply and return vector or matrix instead of list
x<-list(a=1:5,b=rnorm(10))
resut<-sapply(x, mean)

## apply best for matrix

x<-matrix(rnorm(200),20,10)
# margin(2) value preserve all columns and collapse all rows which means it calculate 
# the mean for all columns by collapsing all rows
apply(x,2, mean)
apply(x,1,mean)
apply(x,1,sum)
apply(x,2,sum)

## faster alternatives

rowSums(x)
rowMeans(x)
colSums(x)
colMeans(x)

apply(x,1,quantile, probs=c(0.25,0.75))

a<- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)

rowMeans(a,dims = 2)

## mapply apply argument of function on more than one list elements

mapply(rep, 1:4,4:1)

## tapply a function over subset of a vector

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
# gl function Generate factors by specifying the pattern of their levels
tapply(x, f, mean,simplify = TRUE)
tapply(x, f, range)

## Split
split(x,f)
lapply(split(x,f),mean)
# split dataframs
library(datasets)
head(airquality)

s<-split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE))

s<-split(iris,iris$Species)
sapply(s,function(x) colMeans(x[,c('Sepal.Length','Sepal.Width','Petal.Width')]))
# spliting on more than one level 
x<-rnorm(10)
f<-gl(3,4)
g<-gl(4,3)
interaction(f,g,drop = TRUE)
str(split(x,list(f,g),drop = TRUE))

newdat<-subset(mtcars,mtcars$cyl==4 | mtcars$cyl==8)
sapply(split(newdat$hp,newdat$cyl),mean)
sapply(split(newdat$hp,newdat$cyl),mean)

mean(mtcars[mtcars$cyl == "8",]$hp) - mean(mtcars[mtcars$cyl == "4",]$hp)

## Generating random numbers

# rnorm, dnorm, pnorm, rpois

set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<- 0.5+2*x+e
summary(y)
plot(x,y)

set.seed(10)
x<-rbinom(100,1,0.5)
e<-rnorm(100,0,2)
y<- 0.5+2*x+e
summary(y)
plot(x,y)

set.seed(1)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<- rpois(100,exp(log.mu))
summary(y)
plot(x,y)

# random sampling

set.seed(1)
sample(1:10,4)
sample(letters,4)
=======
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

# show loaded packages
search()
library(lme4)

##### Lexical scoping

make.power<-function(x){
  pow<-function(n){
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)
cube(3)
square(2)
# exploring function closure
ls(environment(cube))
get("x",environment(cube))
ls(environment(square))
get("x",environment(square))

##### Coding standard
# Always use text editor/text file (ASCII format)
# indent your code
# limit the lenght of function
# limit the width of code

##### Dates and Times in R ####

x<-as.Date("2020-10-18")
unclass(x)
x<-Sys.time()
p<-as.POSIXlt(x)

y<-strptime("9 jan 2011 11:34:21","%d %b %Y %H:%M:%S")
y-p

##### Looping functions #####

## Lapply
# lapply always return a list
x<-list(a=1:5,b=rnorm(10))
resut<-lapply(x, mean)

x<-1:4
lapply(x, runif)

x<-list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
lapply(x, function(elt) elt[,1])

## Sapply simlify result of lapply and return vector or matrix instead of list
x<-list(a=1:5,b=rnorm(10))
resut<-sapply(x, mean)

## apply best for matrix

x<-matrix(rnorm(200),20,10)
# margin(2) value preserve all columns and collapse all rows which means it calculate 
# the mean for all columns by collapsing all rows
apply(x,2, mean)
apply(x,1,mean)
apply(x,1,sum)
apply(x,2,sum)

## faster alternatives

rowSums(x)
rowMeans(x)
colSums(x)
colMeans(x)

apply(x,1,quantile, probs=c(0.25,0.75))

a<- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)

rowMeans(a,dims = 2)

## mapply apply argument of function on more than one list elements

mapply(rep, 1:4,4:1)

## tapply a function over subset of a vector

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
# gl function Generate factors by specifying the pattern of their levels
tapply(x, f, mean,simplify = TRUE)
tapply(x, f, range)

## Split
split(x,f)
lapply(split(x,f),mean)
# split dataframs
library(datasets)
head(airquality)

s<-split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm = TRUE))

s<-split(iris,iris$Species)
sapply(s,function(x) colMeans(x[,c('Sepal.Length','Sepal.Width','Petal.Width')]))
# spliting on more than one level 
x<-rnorm(10)
f<-gl(3,4)
g<-gl(4,3)
interaction(f,g,drop = TRUE)
str(split(x,list(f,g),drop = TRUE))

newdat<-subset(mtcars,mtcars$cyl==4 | mtcars$cyl==8)
sapply(split(newdat$hp,newdat$cyl),mean)
sapply(split(newdat$hp,newdat$cyl),mean)

mean(mtcars[mtcars$cyl == "8",]$hp) - mean(mtcars[mtcars$cyl == "4",]$hp)

## Generating random numbers

# rnorm, dnorm, pnorm, rpois

set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<- 0.5+2*x+e
summary(y)
plot(x,y)

set.seed(10)
x<-rbinom(100,1,0.5)
e<-rnorm(100,0,2)
y<- 0.5+2*x+e
summary(y)
plot(x,y)

set.seed(1)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<- rpois(100,exp(log.mu))
summary(y)
plot(x,y)

# random sampling

set.seed(1)
sample(1:10,4)
sample(letters,4)
>>>>>>> 735f16f10bee9d3fc6cc1c01f3b6733c5cf429f4
