## read files
NEI <- readRDS("summarySCC_PM25.rds")

## select only fips=="24510"
baNEI <- subset(NEI, fips=="24510")

## calculate total emissions for each type by year
library(dplyr)
baNEI_2 <- tbl_df(baNEI) %>% group_by(type, year) %>% summarise(total=sum(Emissions))

## plot graph of total emissions vs year for each type and save as a png file
library(ggplot2)
qplot(year, total, data=baNEI_2, col=type, geom=c("point", "smooth"), method="auto", ylab="Total PM 2.5 Emissions (tons)", xlab="Year", main="By type variable")
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
