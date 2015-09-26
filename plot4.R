## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

Comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRel <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (Comb & coalRel)
combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

png("plot4.png",width=640,height=480, units = "px", bg="transparent")

library(ggplot2)

gplot <- ggplot(combNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total Emission ")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion-Related Source Emissions Across US from 1999-2008"))

print(gplot)

dev.off()