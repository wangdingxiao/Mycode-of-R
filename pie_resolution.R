library(RODBC)
channel=odbcConnect("mysql", uid="root", pwd="")
sqlTables(channel)
data<-sqlFetch(channel,"pie_resolution")
View(data)
x=data[,2]
names(x)=c("已修复", "无效","无法修复", "下一个版本")
percent_str <- paste(round(x/sum(x) * 100,1), "%", sep="")
paste("type: ",names(x)," percent ",percent_str, sep="")
pie(x,col = c("purple", "violetred1", "green3", "cornsilk"))

