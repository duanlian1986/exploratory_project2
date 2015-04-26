## read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## select only coal combustion related sources and data
coalSCC <- SCC[grep("Coal", SCC$EI.Sector),]
coalNEI <- NEI[NEI$SCC %in% coalSCC$SCC,]

## calculate total emissions by year
aggCoalNEI <- aggregate(coalNEI$Emissions, list(year=coalNEI$year), sum, na.remove=TRUE)

## plot total emissions vs year and save as png file
barplot(aggCoalNEI$x, xlab="Year", ylab="Total Emissions (tons)", main="Combustion related", names.arg=aggCoalNEI$year)
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()