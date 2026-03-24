setwd("D:/DSR/asm4")
NEI <- readRDS("summarySCC_PM25.rds")

# Tính tổng khí thải theo năm
totalByYear <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png", width=480, height=480)
barplot(height=totalByYear$Emissions/10^6, names.arg=totalByYear$year, 
        xlab="Năm", ylab="Tổng khí thải PM2.5 (Triệu tấn)",
        main="Tổng khí thải PM2.5 tại Hoa Kỳ (1999-2008)", col="skyblue")
dev.off()
