library(RODBC)
channel=odbcConnect("mysql", uid="root", pwd="")
sqlTables(channel)
data<-sqlFetch(channel,"bug_resolution_all_num_desc")
View(data)
library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(RColorBrewer)
data %>%
  mjs_plot(x=num, y=Added, width=500, height=400) %>%
  mjs_bar() %>%
  mjs_axis_x(xax_format = 'plain')

