if (!dir.exists("./Exploratory Data Analysis")){
      dir.create("./Exploratory Data Analysis")
}
#### Exploratory Analysis ####

library(datasets)
data("cars")
par(bg ="white",mar=c(5,5,5,5),oma=c(0,5,1,1))
with(cars,plot(speed,dist,col="turquoise",pch=19,mtext(text = "HI",side = 1,col = "BLUE",outer = TRUE)))

library(ggplot2)
data(mpg)
qplot(displ,hwy,data = mpg)

colors()

####
pdf(file = "myplot.pdf")
with(airquality,plot(Wind,Ozone,main = "Ozone and Wind in Newyork city",type = "n"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="turquoise",pch=19))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="tomato",pch=19))
legend("topright",pch=19,col = c("turquoise","tomato"),legend = c("May","Other Months"))
dev.off()
####
####
par(mfrow=c(1,2))
with(airquality,{
      plot(Wind,Ozone,main = "Ozone and Wind")
      plot(Solar.R,Ozone,main = "Ozone and solar radiation")
})
####
example("points")

####
with(airquality,plot(Wind,Ozone,main = "Ozone and Wind in Newyork city",type = "n"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="turquoise",pch=19))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="tomato",pch=19))
legend("topright",pch=19,col = c("turquoise","tomato"),legend = c("May","Other Months"))
dev.copy(png,"myplot.png")
dev.off()

#### lattice plotting ####

library(lattice)
library(datasets)

##
xyplot(Ozone ~ Wind,data = airquality)
##
airquality <- transform(airquality,Month=factor(Month))
p <- xyplot(Ozone ~ Wind | Month,data = airquality, layout = c(5,1))
print(p)

##
set.seed(10)
x <- rnorm(100)
f <- rep(0:1,each=50)
y <- x + f - f * x + rnorm(100,sd = 0.5)
f <- factor(f,labels = c("Group 1","Group 2"))
xyplot(y ~ x | f, layout = c(2,1))
# calling custom panel function 
xyplot(y ~ x | f , panel = function(x, y, ...){
      panel.xyplot(x, y, ...) # first call the default panel function for xyplot
      panel.abline(h = median(y),lty = 2)
})

xyplot(y ~ x | f , panel = function(x, y, ...){
      panel.xyplot(x, y, ...) # first call the default panel function for xyplot
      panel.lmline(x, y,lty = 2,col=2)
})

#### ggplot2 ####

library(ggplot2)
data(mpg)

qplot(displ, hwy, data = mpg, color = drv)
#
qplot(displ, hwy, data = mpg, geom = c("point","smooth"))
#
qplot(hwy,data = mpg,fill = drv)
#
qplot(displ, hwy, data = mpg, facets = .~ drv)
#
qplot(hwy,data = mpg,facets = drv~.,binwidth = 2)
#
qplot(displ, hwy, data = mpg, shape = drv)
#
ggplot(airquality,aes ( Wind, Ozone))+
      geom_point(color = "red")+
      geom_smooth(size=1,method = "lm",linetype =2,se=TRUE)+
      facet_grid(.~ Month)+
      theme_bw(base_family = "Avenir",base_size = 15)+
      labs(title = "Effect of wind on ozone")+
      labs(x="Wind Power",y = "Ozone ppm")

#### K means clustering ####

set.seed(1234)
par(mar=c(2,2,0,0))
x <- rnorm(12, mean = rep(1:3,each=4),sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1),eaach =4),sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dat <- data.frame(x,y)
kmeansobject <- kmeans(dat,centers = 3)
names(kmeansobject)
kmeansobject$cluster

par(mar=rep(0.2,4))

plot(x,y,col=kmeansobject$cluster,pch=19,cex=2)
points(kmeansobject$cluster,pch =3,col=1:3,cex=3,lwd=3)

#### dimensionality reduction ####

set.seed(12345)
par(mar = rep(0.2,4))
dataMatrix <- matrix(rnorm(400),nrow = 40)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
heatmap(dataMatrix)

########
library(grDevices)
pal <- colorRamp(c("red","blue"))
pal(0)
pal(seq(0,1,len=10))

#
pal <- colorRampPalette(c("red","yellow"))

pal(2)

#
library(RColorBrewer)
library(RColorBrewer)

col <- brewer.pal(3,"BuGn")
pal <- colorRampPalette(col)
image(volcano,col=pal(5))
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x,y)

#### Air Quality ##########################################################

pm0 <- read.table("RD_501_88101_1999-0.txt", 
                  sep = "|",
                  comment.char  = "#", 
                  header = FALSE, 
                  na.strings = "")

dim(pm0)
head(pm0)
cnames <- readLines("RD_501_88101_1999-0.txt", 1)
print(cnames)
cnames <- strsplit(cnames, "|", fixed = TRUE)
print(cnames)
names(pm0) <- make.names(cnames[[1]])
head(pm0)
x0 <- pm0$Sample.Value
class(x0)
str(x0)
summary(x0)
mean(is.na(x0))  ## Are missing values important here?

## Read in data from 2012

pm1 <- read.table("RD_501_88101_2012-0.txt", comment.char = "#",
                  header = FALSE, sep = "|", na.strings = "", nrow = 1304290)
names(pm1) <- make.names(cnames[[1]])
head(pm1)
dim(pm1)
x1 <- pm1$Sample.Value
class(x1)

## Five number summaries for both periods
summary(x1)
summary(x0)
mean(is.na(x1))  ## Are missing values important here?

## Make a boxplot of both 1999 and 2012
boxplot(x0, x1)
boxplot(log(x0), log(x1))

## Check negative values in 'x1'
summary(x1)
negative <- x1 < 0
sum(negative, na.rm = T)
mean(negative, na.rm = T)
dates <- pm1$Date
str(dates)
dates <- as.Date(as.character(dates), "%Y%m%d")
str(dates)
hist(dates,breaks = "month")  ## Check what's going on in months 1--6


## Plot a subset for one monitor at both times

## Find a monitor for New York State that exists in both datasets
site0 <- unique(subset(pm0, State.Code == 36, c(County.Code, Site.ID)))
site1 <- unique(subset(pm1, State.Code == 36, c(County.Code, Site.ID)))
site0 <- paste(site0[,1], site0[,2], sep = ".")
site1 <- paste(site1[,1], site1[,2], sep = ".")
str(site0)
str(site1)
both <- intersect(site0, site1)
print(both)

## Find how many observations available at each monitor
pm0$county.site <- with(pm0, paste(County.Code, Site.ID, sep = "."))
pm1$county.site <- with(pm1, paste(County.Code, Site.ID, sep = "."))
cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both)
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)
sapply(split(cnt0, cnt0$county.site), nrow)
sapply(split(cnt1, cnt1$county.site), nrow)

## Choose county 63 and side ID 2008
pm1sub <- subset(pm1, State.Code == 36 & County.Code == 63 & Site.ID == 2008)
pm0sub <- subset(pm0, State.Code == 36 & County.Code == 63 & Site.ID == 2008)
dim(pm1sub)
dim(pm0sub)

## Plot data for 2012
dates1 <- pm1sub$Date
x1sub <- pm1sub$Sample.Value
plot(dates1, x1sub)
dates1 <- as.Date(as.character(dates1), "%Y%m%d")
str(dates1)
plot(dates1, x1sub)

## Plot data for 1999
dates0 <- pm0sub$Date
dates0 <- as.Date(as.character(dates0), "%Y%m%d")
x0sub <- pm0sub$Sample.Value
plot(dates0, x0sub)

## Plot data for both years in same panel
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
plot(dates0, x0sub, pch = 20)
abline(h = median(x0sub, na.rm = T))
plot(dates1, x1sub, pch = 20)  ## Whoa! Different ranges
abline(h = median(x1sub, na.rm = T))

## Find global range
rng <- range(x0sub, x1sub, na.rm = T)
rng
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
plot(dates0, x0sub, pch = 20, ylim = rng)
abline(h = median(x0sub, na.rm = T))
plot(dates1, x1sub, pch = 20, ylim = rng)
abline(h = median(x1sub, na.rm = T))

## Show state-wide means and make a plot showing trend
head(pm0)
mn0 <- with(pm0, tapply(Sample.Value, State.Code, mean, na.rm = T))
str(mn0)
summary(mn0)
mn1 <- with(pm1, tapply(Sample.Value, State.Code, mean, na.rm = T))
str(mn1)

## Make separate data frames for states / years
d0 <- data.frame(state = names(mn0), mean = mn0)
d1 <- data.frame(state = names(mn1), mean = mn1)
mrg <- merge(d0, d1, by = "state")
dim(mrg)
head(mrg)

## Connect lines
par(mfrow = c(1, 1))
with(mrg, plot(rep(1999, 52), mrg[, 2], xlim = c(1998, 2013)))
with(mrg, points(rep(2012, 52), mrg[, 3]))
segments(rep(1999, 52), mrg[, 2], rep(2012, 52), mrg[, 3])

#### Course project 2 ####

# Q1
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Sum up PM2.5 emmisions to get the total value for each year

Total <- group_by(NEI,year)%>%
      summarize(sum(Emissions))
## using barplot to show total emmsion in different years for all sources
barplot(Total$`sum(Emissions)`/10^6,
        names.arg=Total$year,xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        ylim = c(0,8),
        main="Total PM2.5 Emissions From All US Sources")

## total emissions have decreased in the US from 1999 to 2008

## save the plot in PNG format
dev.copy(device = png,"plot1.png",width=480, height=480)
dev.off()

# Q2
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## calculate total emmision for Baltimore City 

TotalBaltimore <- NEI %>% 
      filter(fips== "24510") %>%
      group_by(year) %>%
      summarize(sum(Emissions))

## using barplot to show total emmsion in Baltimore for all sources
barplot(TotalBaltimore$`sum(Emissions)`,
        names.arg=Total$year,xlab="Year",
        ylim = c(0,3500),
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From All Baltimore City Sources")

## save the plot in PNG format
dev.copy(device = png,"plot2.png",width=480, height=480)
dev.off()

# Q3 
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI %>% 
      filter(fips== "24510") %>%
      select(Emissions,type,year)
## change year values to factor 
Baltimore <- transform(Baltimore,year=factor(year))

## ggplot to plot Baltimore data for different emission type across years
ggplot(data = Baltimore,aes(year,Emissions))+
      geom_col(aes(fill = type))+
      theme_bw()+
      facet_grid(.~type,scales = "free",space = "free") +
      guides(fill=FALSE)+
      labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
      labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
      theme(plot.title  = element_text(hjust = 0.5))

## save the plot in PNG format
dev.copy(device = png,"plot3.png",width=480, height=480)
dev.off()

####
####
# The non-road, nonpoint, on-road source types have all 
# decreased overall from 1999-2008 in Baltimore City
# The point source shows a slight increase overall from 1999-2008
# The point source shows a significant increase until 2005
# at which point it decreases again by 2008 to just above the starting values
####
####

# Q4 
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset the data based on coal combustion-related sources
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal<- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (combustion & coal)
combSCC <- SCC[coalComb,]$SCC
coalCombNEI <- NEI[NEI$SCC %in% combSCC,]

## change year values to factor 
coalCombNEI <- transform(coalCombNEI,year=factor(year))

ggplot(coalCombNEI,aes(year,Emissions/10^5)) +
      geom_col() +
      theme_bw() +
      guides(fill=FALSE) +
      labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
      labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))+
      theme(plot.title  = element_text(hjust = 0.5))

## save the plot in PNG format
dev.copy(device = png,"plot4.png",width=480, height=480)
dev.off()

####
####
# Across the United States, emissions from coal combustion-related 
# sources decreasedfrom 1999 to 2008
####
####

# Q5 
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset NEI based on Motor vehicles on SCC data
MotVech <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
MotoVechSCC <- SCC[MotVech,]$SCC
MotoVechNEI <- NEI[NEI$SCC %in% MotoVechSCC,]
## subset to Baltimore
Baltimore <- MotoVechNEI %>% 
      filter(fips== "24510")

## change year values to factor 
Baltimore <- transform(Baltimore,year=factor(year))

## plot with ggplot

ggplot(Baltimore,aes(year,Emissions)) +
      geom_col() +
      theme_bw() +  
      guides(fill=FALSE) +
      labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
      labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))+
      theme(plot.title  = element_text(hjust = 0.5))

## save the plot in PNG format
dev.copy(device = png,"plot5.png",width=480, height=480)
dev.off()

####
####
# Emissions from motor vehicle sources decreased 
# from 1999 to 2008 in Baltimore City
####
####

# Q6 
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset NEI based on Motor vehicles on SCC data
MotVech <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
MotoVechSCC <- SCC[MotVech,]$SCC
MotoVechNEI <- NEI[NEI$SCC %in% MotoVechSCC,]
## subset to Baltimore
Baltimore <- MotoVechNEI %>% 
      filter(fips== "24510") %>%
      mutate(fips = "Baltimore")
## subset to California
California <- MotoVechNEI %>% 
      filter(fips== "06037") %>%
      mutate(fips = "Los Angeles County")
      
## merge California and Baltimore data
merged <- rbind(Baltimore,California)

## change year values to factor 
merged <- transform(merged,year=factor(year))
merged <- transform(merged,fips=factor(fips))

## using ggplot to plot the data
ggplot(merged, aes(year, Emissions,fill = fips)) +
      geom_col() +
      facet_grid(scales="free", space="free", .~fips) +
      guides(fill=FALSE) +
      theme_bw() +
      labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
      labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))+
      theme(plot.title  = element_text(hjust = 0.5))

## save the plot in PNG format
dev.copy(device = png,"plot6.png",width=480, height=480)
dev.off()


####
####
# Los Angeles County has seen the greatest changes over
# time in motor vehicle emissions
####
####

