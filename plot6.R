setwd("D:/DSR/asm4")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

# Lọc dữ liệu 2 thành phố
compareData <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
compareData$city <- ifelse(compareData$fips == "24510", "Baltimore City", "Los Angeles")

totalCompare <- aggregate(Emissions ~ year + city, compareData, sum)

png("plot6.png", width=640, height=480)
g <- ggplot(totalCompare, aes(factor(year), Emissions, fill=city)) +
    geom_bar(stat="identity") +
    facet_grid(.~city, scales="free") + # Dùng free scales để thấy rõ xu hướng
    labs(x="Năm", y="Khí thải (Tấn)", title="So sánh khí thải xe cơ giới: Baltimore vs LA")
print(g)
dev.off()
