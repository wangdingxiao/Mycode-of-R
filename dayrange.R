library(RODBC)
channel=odbcConnect("mysql", uid="root", pwd="")
sqlTables(channel)
data<-sqlFetch(channel,"dayrange")
View(data)
x=data[,2]
names(x)=c("1天以内", "1天至10天","10天至100天", "100天至1000天","1000天以上")
percent_str <- paste(round(x/sum(x) * 100,1), "%", sep="")
paste("type: ",names(x)," percent ",percent_str, sep="")
pie(x,col = c("purple", "violetred1", "green3", "cornsilk"))

