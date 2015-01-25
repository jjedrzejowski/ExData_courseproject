## plot2.R
## script to solve assignment no.2
## read in data
Em <-readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## keep only data for Baltimore
EmBaltimore<-Em[Em$fips=="24510",]
## prepare data for plotting
BaltPlot <- aggregate(Emissions ~ year, data=EmBaltimore, sum)
## plot data to png file
png("./plot2.png")
plot(BaltPlot, type="l", main="Total emissions in Baltimore City (MD)",
     xlim=c(1998, 2009), ylim=c(1500, 3500), col="darkred", lwd=2)
dev.off()