setwd("D:/DSR/asm4")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips == "24510")

png("plot3.png", width=640, height=480)
g <- ggplot(baltimore, aes(factor(year), Emissions, fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(.~type) +
    labs(x="Năm", y="Tổng khí thải (Tấn)", title="Khí thải Baltimore theo loại nguồn (1999-2008)")
print(g)
dev.off()
