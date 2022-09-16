# Reg : https://r-coder.com/violin-plot-r/, 
# install.packages("vioplot")
library("vioplot")
# install.packages("readxl")
library("readxl")
# install.packages("dplyr")
library("dplyr") 

setwd(dir = "/Volumes/MyWorks_WD/Documents/RStudio")
# filename <- "Rawdata_phylum and genus.xlsx"
filename <- "gv.csv"
sheet <- "Phylum"

# data <- read.table(filename, header=TRUE, sep=",")
data <- read.csv(filename, header=TRUE, sep=",")
# data <- read_excel(filename, sheet=sheet, col_names=TRUE, na="", skip=0)

left <- data[data$GWG == 1, ]
left <- select(left, Bifidobacterium, Bacteroides, Staphylococcus)
right <- data[data$GWG == 2, ]
right <- select(right, Bifidobacterium, Bacteroides, Staphylococcus)
tail(data)
vioplot(left, side = "left", plotCentre = "line", col = 2, horizontal = TRUE)
vioplot(right, side = "right", plotCentre = "line", col = 3, add = TRUE, horizontal = TRUE)
legend("topleft", legend = c("GWG1", "GWG2"), fill = c(2, 3), cex = 1.25)
