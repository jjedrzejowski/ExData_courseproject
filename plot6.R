## plot6.R
## addresses assignment 6
library(ggplot2)
library(dplyr)
## read in data
Em <-readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## select comparative data for Baltimore and LA
EmCompare<-Em[Em$fips=="24510"|Em$fips=="06037",]
## merge data with SCC as key
XXX<-merge(EmCompare, SCC, by.x="SCC", by.y="SCC")
## keep only necessary columns
YYY<- transmute(XXX, year, Emissions, SCC.Level.Two, fips)
## select data for motor vehicle emission
ZZZ<- YYY[grepl("Vehicle", YYY$SCC.Level.Two),]
## prepare data for plotting, provide descriptive variable names
PlotData<- aggregate(Emissions~year+fips, data=ZZZ, sum)
PlotData[PlotData$fips=="06037",2]<-"Los Angeles"
PlotData[PlotData$fips=="24510",2]<-"Baltimore"
## plot data to png file
png("./plot6.png")
qplot(year, Emissions, data=PlotData, facets=fips~., 
      main="Motor vehicle emissions", binwidth=2, geom="line")->graph
print(graph)
dev.off()