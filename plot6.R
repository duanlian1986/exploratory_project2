## read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## select fips=="24510" and fips=="06037"
baNEI <- subset(NEI, fips=="24510")
laNEI <- subset(NEI, fips=="06037")

## select only motor vehicle sources and data
onroadSCC <- SCC[grep("Onroad", SCC$Data.Category,ignore.case=TRUE),]
onroadBaNEI <- baNEI[baNEI$SCC %in% onroadSCC$SCC,]
onroadLaNEI <- laNEI[laNEI$SCC %in% onroadSCC$SCC,]

## calculate total emissions by year
aggOnroadBaNEI <- aggregate(onroadBaNEI$Emissions, list(year=onroadBaNEI$year), sum, na.rm=TRUE)
aggOnroadLaNEI <- aggregate(onroadLaNEI$Emissions, list(year=onroadLaNEI$year), sum, na.rm=TRUE)

## plot total emissions vs year and save as png file
par(mfrow=c(1,2))
barplot(aggOnroadBaNEI$x, xlab="Year", ylab="Total Emissions (tons)", main="Baltimore city-Onroad", names.arg=aggOnroadBaNEI$year)
barplot(aggOnroadLaNEI$x, xlab="Year", ylab="Total Emissions (tons)", main="Los Angeles-Onroad", names.arg=aggOnroadLaNEI$year)
dev.copy(png, file="plot6.png", width=700, height=480)
dev.off()