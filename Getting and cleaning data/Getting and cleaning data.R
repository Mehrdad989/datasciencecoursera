file.exists("C:/Users/mehrd/Desktop/datasciencecoursera/Getting and cleaning data")

## download a file from web
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,"cameras.csv")
list.files()
dateDownloaded <- date()
dateDownloaded

cameras <- read.csv("cameras.csv",header = T)

## Reading excel files
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,"cameras.xlsx")
list.files()
dateDownloaded <- date()
dateDownloaded

install.packages("xlsx")
library(xlsx)

## Reading XML files (extensible markup language)

install.packages("XML")
library(XML)

fileUrl <- "Test.xml"
doc <- xmlTreeParse(fileUrl,useInternalNodes  = TRUE)


rootNode <- xmlRoot(doc)
xmlName(rootNode)
print(doc)
print(rootNode[1])
names(rootNode)
rootNode[[1]]
rootNode[[1]][[2]]
# extract xml values
val <- xmlSApply(rootNode,xmlValue)
val[1]
name <- xpathApply(rootNode,"//NAME",xmlValue)
salary <- xpathApply(rootNode,"//SALARY",xmlValue)
dat <- do.call(rbind, Map(data.frame, Name=name, Salary=salary))
test <- cbind(unlist(salary),unlist(name))
test <- matrix(salary,name)

##
fileUrl <- "http//espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal= TRUE)
scores <- xpathSApply(doc,'//li[@class="score"]',xmlValue)

###Read JSON files
install.packages("jsonlite")
library(jsonlite)

jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jasonData)
jsonData$owner$login

## Writing datframes into JSON
myjson <- toJSON(iris,pretty = TRUE)
cat(myjson)
dat <- fromJSON(myjson)

#### Quiz 1

us <- read.csv("getdata_data_ss06hid.csv",header = T)
us %>%
      select(VAL)%>%
      filter(VAL ==24,!is.na(VAL)) %>%
      count()

library(XML)
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
BalResto <- xmlTreeParse(sub("s", "", fileUrl3), useInternal=TRUE)
rootNode <- xmlRoot(BalResto)

zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zip==21231)

fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl4, destfile = "Quiz1-05.csv", method = "curl")
library(data.table)
DT <- fread("Quiz1-05.csv")
system.time(DT[,mean(pwgtp15),by=SEX])

#### reading HDF5 ####

source("http://bioconductor.org/biocLite.R")
bioLite("rhdf5")
BiocManager::install(pkgs = "rhdf5")
library(rhdf5)
# creating hdf5 file
created = rhdf5::h5createFile("example.h5")
created
# creating different group inside hdf5 file
created =h5createGroup("example.h5","foo")
created =h5createGroup("example.h5","baa")
created =h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

# writing to groups
A = matrix(1:10,5,2)
h5write(A,"example.h5","foo/A")
B = array(seq(0.1,2.0,by= 0.1),dim = c(5,2,2))
attr(B,"scale")<- "liter"
h5write(B,"example.h5","foo/foobaa/B")
h5ls("example.h5")

# write a dataset directly 
df = data.frame(1L:5L,seq(0,1,length.out = 5),
                c("mehrdad","yas","ali","reza","homaun"),
                stringsAsFactors = F)
h5write(df,"example.h5","df")
h5ls("example.h5")

# Read the data
readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","foo/foobaa/B")
readdf = h5read("example.h5","df")
readA
readB
readdf

# Writing and reading chunks
h5write(c(1,13,17),"example.h5","foo/A",
        index =list(1:3,1))
h5read("example.h5","foo/A")

#### Reading from Web ####
con = url("https://github.com/Mehrdad989/datasciencecoursera")
htmlCode = readline(con)
close(con)
htmlCode

library(XML)
url = "https://github.com/Mehrdad989/datasciencecoursera"
html<- htmlTreeParse(url,useInternalNodes = TRUE)
xpathSApply(html,"//title",xmlValue)

# use get command from httr package

library(httr);html = GET(url)
content2 <- content(html,as="text")
parsedHtml = htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)


#### Reading from API ####

library(httr)
myapp <- oauth_app("twitter",key = "yourConsumerKeyHere",
                  secret = "yourConsumerSecretHere")

sig <- sign_oauth1.0(myapp,token = "yourTokenHere",
                     token_secret = "yourTokenSecretHere" )
homeTL <- GET("http://api.twitter.com/1.1/statuses/home_timeline.json",
              sig)
json1=content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

library(jsonlite)
library(httpuv)
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on your appname, key, and secret 
myapp <- oauth_app(appname = "Youtube_Michael_Galarnyk",
                   key = "8758a6bf9a146e1da0c1",
                   secret = "b9504edde46b794414495bd9c33ea28cbfd87824")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 

#### reshaping data ####

library(reshape2)
head(mtcars)

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id.vars = c("carname","gear",
                                   "cyl"),measure.vars = 
                      c("hp","mpg"))
head(carMelt)
tail(carMelt,n=3)

# casting datafram

dcast(carMelt,cyl~variable)

# averaging
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

A <- split(InsectSprays$count,InsectSprays$spray)
unlist(lapply(A, sum))

#######

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,"housing.csv")
list.files()
dateDownloaded <- date()
dateDownloaded

housing <- read.csv("housing.csv")
head(housing,n=2)
colnames(housing)

agricultureLogical <- housing$ACR== 3 & housing$AGS == 6
head(which(agricultureLogical),3)

#
library(jpeg)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url,"pic.jpg")
picture <- jpeg::readJPEG('pic.jpg'
                          , native=TRUE)
quantile(picture,probs = c(0.3,0.8))

library(dplyr)
library(data.table)

Url_gdp <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
Url_edu <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(Url_gdp,"gdp.csv")
download.file(Url_edu,"edu.csv")
list.files()
gdp <- read.csv("gdp.csv",header = T)
edu <- read.csv("edu.csv",header = T)
# use fast read function from data.table package
gdp <- fread("gdp.csv",skip = 10,nrows = 190,
             select = c(1,2,4,5),
             col.names = c("CountryCode", "Rank", "Economy", "Total"))

edu <- fread("edu.csv")
merge<-merge(gdp,edu,by = 'CountryCode')
merge<- merge %>% arrange(desc(Rank))
paste(nrow(merge)," matches, 13th country is ", merge$Economy[13])


unique(merge$`Income Group`)

T<-merge%>%group_by(`Income Group`)%>%
      filter("High income: OECD"%in% `Income Group`|"High income: nonOECD" %in% `Income Group`)%>%
      summarize(Average =mean(Rank,na.rm = TRUE))

merge$RankGroups <- cut(merge$Rank,breaks = 5)

A <- table(merge$RankGroups,merge$`Income Group`)
A[1,"Lower middle income"]

#### Editing text variables ####

if(!file.exists("./Getting and cleaning data")){
      dir.create("./Getting and cleaning data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,"./Getting and cleaning data/camera.csv",method = "curl")
cameraData <- read.csv("./Getting and cleaning data/camera.csv")

names(cameraData)
names(cameraData)<-tolower(names(cameraData))

splitNames <- strsplit(names(cameraData),"\\.")
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

sub("\\.","_",colnames(cameraData))

tesName <- "this_is_a_test"
sub("_","",tesName) # just remove first underscore it finds 
gsub("_","",tesName) # remove all instances in string 

# finding values 
grep("Alameda",cameraData$intersection)
cameraData[c(65,69,79),"intersection"]
table(grepl("Alameda",cameraData$intersection)) # return true or false if string appears

T1<-cameraData[-c(65,69,79),]
T2<-cameraData[!grepl("Alameda",cameraData$intersection),]

install.packages("stringr")
library(stringr)

nchar("Mehrdad arab")
substr("Mehrdad Arab",1,4)
paste("Mehrdad","Arab","yas",sep = "-")
paste0("Mehrdad","1368")
str_trim("Mehrdad    ")

#### Regular Expressions ####

# ^ represent the begining of the line 
# $ represent the end of the line
# ^[0-9][a-zA-Z] 
# [^.?]$ not end with dot or ?

grep("^[E]",cameraData$intersection,value = TRUE)

#######
strsplit(names(housing),"wgtp")[123]
gdp$Total
mean(as.numeric(gsub(",","",gdp$Total),na.rm = TRUE))
grep("^United",gdp$Economy,value = TRUE)
merge[grepl(pattern = "Fiscal year end: June 30;", merge[, `Special Notes`]), .N]
