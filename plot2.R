## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

SubNEI <- NEI[NEI$fips=="24510",]

TotalEmissionByYearMD <- aggregate(Emissions ~year, SubNEI,sum)
png('plot2.png')
barplot(height=TotalEmissionByYearMD$Emissions, names.arg=TotalEmissionByYearMD$year,col="blue", xlab="Years", ylab="Total Emission", main=expression('Total PM'[2.5]*' emissions for Baltimore City, Maryland from 1999 - 2008'))
dev.off()