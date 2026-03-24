setwd("D:/DSR/asm4")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Tìm các nguồn có chữ "Coal" và "Comb"
coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
combMatches  <- grepl("comb", SCC$Short.Name, ignore.case=TRUE)
coalCombSCC <- SCC[coalMatches & combMatches, ]$SCC

# Lọc dữ liệu NEI
coalData <- NEI[NEI$SCC %in% coalCombSCC, ]
totalCoal <- aggregate(Emissions ~ year, coalData, sum)

png("plot4.png", width=480, height=480)
g <- ggplot(totalCoal, aes(factor(year), Emissions/10^5)) +
    geom_bar(stat="identity", fill="darkgrey") +
    labs(x="Năm", y="Khí thải (10^5 Tấn)", title="Khí thải từ các nguồn Đốt Than toàn Hoa Kỳ")
print(g)
dev.off()
