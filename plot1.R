## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008

TotalEmissionByYear <- aggregate(Emissions ~year, NEI,sum)
png('plot1.png')
barplot(height=TotalEmissionByYear$Emissions, names.arg=TotalEmissionByYear$year,col="blue", xlab="Years", ylab="Total Emission", main=expression('Total PM'[2.5]*' emissions from 1999 - 2008'))
dev.off()
