<<<<<<< HEAD
##### Vector
num_vect<-c(0.5,55,-10,6)
tf<-num_vect<1
tf
num_vect >= 6
my_char<-c("My", "name", "is")
paste(my_char,collapse = " ")
my_name<-c(my_char,"Mehrdad")
my_name
paste(my_name,collapse = " ")
paste("Hello","world",sep = " ")
paste(1:3,c("X","Y","Z"),sep="")
paste(LETTERS, 1:4, sep = "-")

##### Missing values

x<-c(44, NA, 5, NA)
x*3
y<-rnorm(1000)
z <- rep(NA, 1000)
my_data <- sample(c(y, z), 100)
my_na<-is.na(my_data)
my_data == NA
sum(my_na)

##### Vector subset
x[1:10]
x[is.na(x)]
y<- x[!is.na(x)]
y[y > 0]
x[x > 0]
x[!is.na(x) & x > 0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2, -10)]
x[-c(2, 10)] 

vect <- c(foo = 11, bar = 2,norf = NA)
names(vect)
vect2<-c(11, 2, NA)
names(vect2)<-c("foo", "bar", "norf")
identical(vect,vect2)
vect["bar"]
vect[c("foo", "bar")]

##### Matrices and dataframes

my_vector<-1:20
dim(my_vector)
length(my_vector)
dim(my_vector)<-c(4,5)
dim(my_vector)
attributes(my_vector)
class(my_vector)
my_matrix<-my_vector
my_matrix2<-matrix(1:20,4,5)
identical(my_matrix,my_matrix2)
patients<-c("Bill", "Gina", "Kelly", "Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients, my_matrix)
class(my_data)
cnames<-c("patient", "age", "weight", "bp","rating", "test")
colnames(my_data)<-cnames
=======
##### Vector
num_vect<-c(0.5,55,-10,6)
tf<-num_vect<1
tf
num_vect >= 6
my_char<-c("My", "name", "is")
paste(my_char,collapse = " ")
my_name<-c(my_char,"Mehrdad")
my_name
paste(my_name,collapse = " ")
paste("Hello","world",sep = " ")
paste(1:3,c("X","Y","Z"),sep="")
paste(LETTERS, 1:4, sep = "-")

##### Missing values

x<-c(44, NA, 5, NA)
x*3
y<-rnorm(1000)
z <- rep(NA, 1000)
my_data <- sample(c(y, z), 100)
my_na<-is.na(my_data)
my_data == NA
sum(my_na)

##### Vector subset
x[1:10]
x[is.na(x)]
y<- x[!is.na(x)]
y[y > 0]
x[x > 0]
x[!is.na(x) & x > 0]
x[c(3,5,7)]
x[0]
x[3000]
x[c(-2, -10)]
x[-c(2, 10)] 

vect <- c(foo = 11, bar = 2,norf = NA)
names(vect)
vect2<-c(11, 2, NA)
names(vect2)<-c("foo", "bar", "norf")
identical(vect,vect2)
vect["bar"]
vect[c("foo", "bar")]

##### Matrices and dataframes

my_vector<-1:20
dim(my_vector)
length(my_vector)
dim(my_vector)<-c(4,5)
dim(my_vector)
attributes(my_vector)
class(my_vector)
my_matrix<-my_vector
my_matrix2<-matrix(1:20,4,5)
identical(my_matrix,my_matrix2)
patients<-c("Bill", "Gina", "Kelly", "Sean")
cbind(patients,my_matrix)
my_data <- data.frame(patients, my_matrix)
class(my_data)
cnames<-c("patient", "age", "weight", "bp","rating", "test")
colnames(my_data)<-cnames
>>>>>>> 735f16f10bee9d3fc6cc1c01f3b6733c5cf429f4
