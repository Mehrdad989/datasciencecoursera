if (!dir.exists("./Exploratory Data Analysis")){
      dir.create("./Exploratory Data Analysis")
}
#### Exploratory Analysis ####

library(datasets)
data("cars")
with(cars,plot(speed,dist))

library(ggplot2)
data(mpg)
qplot(displ,hwy,data = mpg)