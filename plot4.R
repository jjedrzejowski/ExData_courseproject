## plot4.R
## addresses assignment no. 4
library(dplyr)
## read in data
Em <-readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## merge both datasets, using SCC id as a key
XXX <- merge(Em, SCC, by.x="SCC", by.y="SCC")
## keeps only required columns
YYY <- transmute(XXX, year, Emissions, EI.Sector)
## selects only coal-related emission sources
ZZZ <- YYY[grepl("Coal", YYY$EI.Sector),]
## prepare data for plotting
PlotData <- aggregate(Emissions~year, data=ZZZ, sum)
## plot to png file
png("./plot4.png")
plot(PlotData$year, PlotData$Emissions, type="l", 
     main="Emissions from coal-related sources", 
     xlab="year", ylab="Emissions", ylim=c(200000, 600000), col="darkred", lwd=2)
dev.off()