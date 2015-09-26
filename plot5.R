## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question 5
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Answer, 
#no specific sources for motor vehicle SCC, therefore, gathered the subset in NEI corresponding to 'vehicle'. 
#Vessels, airplane, agro equipment may not included in!

# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
baltvehicles <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

gplot <- ggplot(baltvehicles,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="blue",width=0.7) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total Emission")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(gplot)

dev.off()

