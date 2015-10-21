library(RODBC)
channel=odbcConnect("mysql", uid="root", pwd="")
sqlTables(channel)
data<-sqlFetch(channel,"time_num")
View(data)
x.data<-as.POSIXct(data$time)#将时间字符串数据转为R可以识别的日期型数据
library(xts)
data<-xts(data[,2],x.data) #再把时间数据替换进data中
View(data)
library(dygraphs)
dygraph(data, main = "timenum") %>% 
  dyRangeSelector(dateWindow = c("1998-01-01", "2012-01-01"))

