## plot5.R
## Addressess assignment no. 5
library(dplyr)
## read in data
Em <-readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## keep only data for Baltimore
EmBaltimore<-Em[Em$fips=="24510",]
## merge with SCC as key
XXX<-merge(EmBaltimore, SCC, by.x="SCC", by.y="SCC")
## keep only necessary columns
YYY<- transmute(XXX, year, Emissions, SCC.Level.Two)
## select vehicle-related data only
ZZZ<- YYY[grepl("Vehicle", YYY$SCC.Level.Two),]
## prepare data for plotting
PlotData<- aggregate(Emissions~year, data=ZZZ, sum)
## plot to png file
png("./plot5.png")
plot(PlotData$year, PlotData$Emissions, type="l", 
     main="Emissions from motor vehicles in Baltimore City", 
     xlab="year", ylab="Emissions", ylim=c(100, 450), col="darkred", lwd=2)
dev.off()
