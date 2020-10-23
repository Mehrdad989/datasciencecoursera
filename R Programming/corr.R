##### corr #####

corr<-function(directory,threshold=0){
  #create a list of the files from your target directory
  file_list<-list.files(path = directory,full.names = T)
  #initiating an empty numeric List to store correlation results 
  result<-vector(mode = "numeric", length = 0) 
  #for loop to read the files from list
  for (i in 1:length(file_list)) {
    # add na.omit before reading files to delete rows containing NA's in dataframe
    temp_dat<-na.omit(read.csv(file_list[i]))
    # add condition to calculate correlation if it is bigger than threshold
    if(nrow(temp_dat)>threshold){
      correlation<-cor(temp_dat$sulfate,temp_dat$nitrate)
      # append the result to the empty vector
      result<-append(result,correlation)
    }
    
  }
  return(result)
}

cr<-corr("specdata", 5000)
head(cr)
cr <- corr("specdata", 400)
head(cr)

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
