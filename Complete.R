##### Complete #####

complete<-function(directory,id=1:332){
  #create a list of the files from your target directory
  file_list<-list.files(path = directory,full.names = T)[id]
  #initiating an empty List to store complete cases 
  nobs_vector<-c()
  #for loop to read the files from list
  for (i in 1:length(file_list)) {
    temp_dat<-read.csv(file_list[i])
    nobs_vector[i]<-nrow(temp_dat[complete.cases(temp_dat),])
    
  }
  dataset<-data.frame("id"=id,"nobs"=nobs_vector)
  print(dataset)
 }
complete(directory = "specdata",id = 1:2)
complete("specdata", c(2, 4, 8, 10, 12))

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
