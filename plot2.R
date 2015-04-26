## read files
NEI <- readRDS("summarySCC_PM25.rds")

## select only fips=="24510"
baNEI <- subset(NEI, fips=="24510")

## calculate the total emissions for each year
aggBaNEI <- aggregate(baNEI$Emissions, list(year=baNEI$year), sum, na.remove=TRUE)

##plot total emissions vs year and save as a png file
barplot(aggBaNEI$x, xlab="Year", ylab="Total PM 2.5 Emissions (tons)", main="Baltimore City", names.arg=aggBaNEI$year)
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()