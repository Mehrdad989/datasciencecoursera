##### Air pollution 

# Function to calculate pollutant mean 

pollutantmean<-function(directory,pollutant,id=1:332){
  #create a list of the files from your target directory
  file_list<-list.files(path = directory,full.names = T)[id]
  #initiating an empty dataframe to read files and add to it
  dataset <- data.frame()
  #for loop to read the files from list
  for (i in 1:length(file_list)) {
    temp_dat<-read.csv(file_list[i])
    dataset<-rbind(dataset,temp_dat)
  }
  #get the mean of pollutant column in complete dataset and remove NA value
  mean(dataset[,pollutant], na.rm = TRUE)
}

pollutantmean(directory = "specdata",pollutant = "sulfate",id = 1:300)
round(pollutantmean("specdata", "nitrate"),3)
