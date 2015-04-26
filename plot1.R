## read file
NEI <- readRDS("summarySCC_PM25.rds")

##summerize emissions by year
aggNEI <- aggregate(NEI$Emissions, list(year=NEI$year), FUN = sum, na.rm=TRUE)
names(aggNEI)[names(aggNEI)=="x"] <- "totalEmissions"

##plot barplot and save as .png file
barplot(aggNEI$totalEmissions, xlab="Year", ylab="Total PM 2.5 Emissions (tons)", names.arg=aggNEI$year)
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()