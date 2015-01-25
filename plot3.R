## plot3.R
## Addresses assignment no. 3
library(ggplot2)
## read in data
Em <-readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## keep only data for Baltimore
EmBaltimore<-Em[Em$fips=="24510",]
## Prepare data for plotting
BaltPlot<-aggregate(Emissions ~ year+type, data=EmBaltimore, sum)
## Plot data to png file
png("./plot3.png")
qplot(year, Emissions, data=BaltPlot, facets=type~., 
      main="Emissions in Baltimore City by type", binwidth=2, geom="line")
dev.off()