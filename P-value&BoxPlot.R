# Ref : https://cran.r-project.org/web/packages/pvaluefunctions/vignettes/pvaluefun.html, 
# install.packages("readxl")
library("readxl")
# install.packages("dplyr")
library("dplyr") 
# install.packages("pvaluefunctions")
library(pvaluefunctions)

setwd(dir = "/Volumes/MyWorks_WD/Documents/RStudio")
filename <- "spss raw_Genus,phylum.xlsx"
sheet <- "Genus_SPSS"

data <- read_excel(filename, sheet=sheet, col_names=TRUE, na="", skip=0)
# P-value
# dt = table(data)
# chisq.test(dt, p = rep(1/12, 12))

# Box plots
Veillonella <- data$Veillonella
Bifidobacterium <- data$Bifidobacterium
Enterococcus <- data$Enterococcus
Escherichia_Shigella <- data$Escherichia_Shigella
Bacteroides <- data$Bacteroides
Streptococcus <- data$Streptococcus
Prevotella <- data$Prevotella
#boxplot(data$Veillonella, main = "Veillonella only boxplot"
#        , xlab = "Veillonella", ylab = "Rates", col = "blue", border = "brown"
#        , horizontal = FALSE, notch = TRUE)
boxplot(Veillonella, Bifidobacterium, main = "Multiple boxplots"
        , names = c("Veillonella", "Bifidobacterium"), col = c("green", "red")
        , las = 2, border = "brown"
        , horizontal = FALSE, notch = TRUE)

boxplot(Veillonella, Bifidobacterium, Enterococcus, Escherichia_Shigella, Bacteroides, Streptococcus, Prevotella
        , main = "Multiple boxplots"
        , names = c("Veillonella", "Bifidobacterium", "Enterococcus", "Escherichia_Shigella"
                    , "Bacteroides", "Streptococcus", "Prevotella")
        , col = c("orange", "green", "blue", "red", "purple", "yellow", "pink")
        , las = 2, border = "brown", horizontal = FALSE, notch = TRUE)
