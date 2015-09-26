## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). 
#Which city has seen greater changes over time in motor vehicle emissions?

#Answer, 
#no specific sources for motor vehicle SCC, therefore, gathered the subset in NEI corresponding to 'vehicle'. 
#Vessels, airplane, agro equipment may not included in!

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
baltvehicles <- vehiclesNEI[vehiclesNEI$fips=="24510",]
baltvehicles$city <- "Baltimore City"

LAvehicles <- vehiclesNEI[vehiclesNEI$fips=="06037",]
LAvehicles$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
CombDat <- rbind(baltvehicles,LAvehicles)

png("plot6.png",width=640,height=480,units="px")

library(ggplot2)

gplot <- ggplot(CombDat, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_grey() +
  labs(x="Year", y=expression("Total Emission")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(gplot)

dev.off()