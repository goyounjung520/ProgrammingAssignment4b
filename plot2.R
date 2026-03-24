setwd("D:/DSR/asm4")
NEI <- readRDS("summarySCC_PM25.rds")

# Lọc dữ liệu Baltimore City (fips == "24510")
baltimore <- subset(NEI, fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

png("plot2.png", width=480, height=480)
barplot(height=totalBaltimore$Emissions, names.arg=totalBaltimore$year, 
        xlab="Năm", ylab="Khí thải PM2.5 (Tấn)",
        main="Tổng khí thải PM2.5 tại Baltimore City", col="orange")
dev.off()
