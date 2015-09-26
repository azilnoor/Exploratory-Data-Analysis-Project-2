## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City (fips==24510)?
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question

library(ggplot2)

SubNEI <- NEI[NEI$fips=="24510",]

TotalEmissionByYearMDType <- aggregate(Emissions ~ year + type, SubNEI, sum)

png("plot3.png",  width=640)
gplot <- ggplot(TotalEmissionByYearMDType, aes(year, Emissions, color = type))
gplot <- gplot + geom_line() +   xlab("Year") +  ylab(expression("Total Emissions")) +  ggtitle('Total Emissions for Baltimore City, Maryland from 1999 - 2008 by Type')
print(gplot)
dev.off()