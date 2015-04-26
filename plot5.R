## read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## select only fips=="24510"
baNEI <- subset(NEI, fips=="24510")

## select only motor vehicle sources and data
onroadSCC <- SCC[grep("Onroad", SCC$Data.Category,ignore.case=TRUE),]
onroadBaNEI <- baNEI[baNEI$SCC %in% onroadSCC$SCC,]

## calculate total emissions by year
aggOnroadBaNEI <- aggregate(onroadBaNEI$Emissions, list(year=onroadBaNEI$year), sum, na.rm=TRUE)

## plot total emissions vs year and save as png file
barplot(aggOnroadBaNEI$x, xlab="Year", ylab="Total Emissions (tons)", main="Baltimore city-Onroad", names.arg=aggOnroadBaNEI$year)
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()