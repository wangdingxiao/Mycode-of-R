library(RODBC)
channel=odbcConnect("mysql", uid="root", pwd="")
sqlTables(channel)
data<-sqlFetch(channel,"who_num_10")
View(data)
library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(RColorBrewer)
data %>%
  mjs_plot(x=num, y=Who, width=500, height=400) %>%
  mjs_bar() %>%
  mjs_axis_x(xax_format = 'plain')
