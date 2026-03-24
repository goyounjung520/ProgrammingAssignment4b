setwd("D:/DSR/asm4")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

# Lọc xe cơ giới (thường là loại ON-ROAD) tại Baltimore
vehiclesBaltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
totalVehicles <- aggregate(Emissions ~ year, vehiclesBaltimore, sum)

png("plot5.png", width=480, height=480)
g <- ggplot(totalVehicles, aes(factor(year), Emissions)) +
    geom_bar(stat="identity", fill="steelblue") +
    labs(x="Năm", y="Khí thải (Tấn)", title="Khí thải từ xe cơ giới tại Baltimore City")
print(g)
dev.off()
