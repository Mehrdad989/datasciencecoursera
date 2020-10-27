library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()
mydf<-read.csv(path2csv,stringsAsFactors = FALSE)
dim(mydf)
head(mydf)

library(dplyr)
packageVersion("dplyr")

cran<-tbl_df(mydf)
rm("mydf")
cran

select(cran,ip_id,package,country)
select(cran,r_arch:country)
select(cran,country:r_arch)
cran
select(cran,-time)
-5:20
-(5:20)
select(cran,-(X:size))

filter(cran,package=="swirl")
filter(cran,r_version=="3.1.1",country=="US")
filter(cran,r_version<="3.0.2",country=="IN")
filter(cran,country=="US"|country=="IN")
filter(cran,size>100500 , r_os=="linux-gnu")
filter(cran,!is.na(r_version))
is.na(c(3,5,NA,10))
!is.na(c(3,5,NA,10))

cran2<-select(cran,size:ip_id)
arrange(cran2,ip_id)
arrange(cran2,desc(ip_id))
arrange(cran2, package, ip_id) 
arrange(cran2,country,desc(r_version),ip_id)

cran3 <- select(cran,ip_id,package,size)
cran3
mutate(cran3,size_mb = size/2^20)
mutate(cran3,size_mb = size/2^20, size_gb = size_mb / 2^10)
mutate(cran3,correct_size = size + 1000)

summarize(cran,avg_bytes = mean(size))

library(dplyr)

cran <- tbl_df(mydf)
rm("mydf")

by_package <- group_by(cran,package)
summarize(by_package,mean(size))

quantile(pack_sum$count,probs = 0.99)
top_counts <- filter(pack_sum,count >679)
top_counts_sorted <- arrange(top_counts,desc(count))
quantile(pack_sum$unique,probs = 0.99)
top_unique <- filter(pack_sum,unique>465)
top_unique_sorted <- arrange(top_unique,desc(unique))

students
?gather
gather(students,sex,count,-grade)
students2
res <- gather(students2,key = sex_class,value = count,-grade)
res
?separate
separate(res,col = sex_class,into = c("sex","class"))

students2 %>%
  gather( sex_class,count ,-grade ) %>%
  separate( sex_class, c("sex", "class")) %>%
  print()

students3

library(readr)
parse_number("class5")

passed <- mutate(passed,status="passed")
failed <- mutate(failed,status="failed")
bind_rows(passed,failed)

this_day <- today()
year(this_day)
wday(this_day)
wday(this_day,label = TRUE)

this_moment <- now()
minute(this_moment)
my_date <- ymd("1989-05-17")
class(my_date)
ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)
ymd("192012")
ymd("1920-1-2")
dt1
ymd_hms(dt1)
hms("03:22:14")
dt2
ymd(dt2)
update(this_moment,hours=8,minutes = 34,seconds = 55)
this_moment
this_moment <- update(this_moment,hours=5,minutes = 10)
nyc<-"America/New_York"
nyc <- now("America/New_York")
depart <- nyc + days(2)
depart <- update(depart,hours = 17, minutes = 34)
arrive <- depart + hours(15) + minutes(50)
arrive <- with_tz(time = arrive,tzone = "Asia/Hong_Kong")
last_time <- mdy("June 17, 2008",tz = "Singapore")
how_long <- interval(last_time,arrive)
as.period(how_long) 
stopwatch()
