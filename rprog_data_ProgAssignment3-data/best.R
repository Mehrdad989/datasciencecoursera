## Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

##

best <- function(state, outcome){
  # read outcome file
  dat <- read.csv('outcome-of-care-measures.csv',colClasses = "character")
  dat   <- as.data.frame(cbind(dat[, 2],  # hospital
                              dat[, 7],   # state
                              dat[, 11],  # heart attack
                              dat[, 17],  # heart failure
                              dat[, 23]), # pneumonia
                        stringsAsFactors = FALSE) # make new dataframe based on columns we need
  colnames(dat) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")# give the short name to new dataframes columns
  outcome <- tolower(outcome) # in case user write the argument in uppercase
  # check validity of state 
  if(!state%in%unique(dat[["state"]])){
    stop("invalid state")
  }
  # check validity of outcome
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("invalid outcome")
  }
  ind <- which(dat[,"state"]==state) #get the index of rows based on state
  sub <- dat[ind,] # subset based on index
  o_ind <- as.numeric(sub[,outcome]) # get the numeric vector of called column (outcome)
  min_val <- min(o_ind,na.rm = TRUE) # calculate the min value
  output <- sub[,"hospital"][which(o_ind ==min_val)] #which find the index by min value and pass to the hospital vector
  output <- output[sort.list(output)][1] # sort the list index alphabetically and get index 1 value in case we have several hospital 
  return(output)
}

# Test the best function
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")

