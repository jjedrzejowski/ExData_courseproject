## plot1.R
## plots assignment no. 1
## reads in the data
Em <-readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")
## converts data so it can be presented on a barplot
emBar <- with(Em, tapply(Emissions, year, sum))
## plots barplot to pgn file
png("./plot1.png")
barplot(emBar, main="Total Emissions by year", xlab="Year",
        ylab="Total emission", ylim=c(0, 8e+6), col="blue", space=0.5)
dev.off()