x <- c(6, 9, 0, 19, -1, 8, 12, 5, 3, 7, 2, 4, 3, -8, -9, 8, 4, 12, 5, 14)

# install.packages("vioplot")
library("vioplot")

vioplot(x)
vioplot(x, horizontal = TRUE)
vioplot(x,
        col = 2,               # Color of the area
        rectCol = "red",       # Color of the rectangle
        lineCol = "white",     # Color of the line
        colMed = "green",      # Pch symbol color
        border = "black",      # Color of the border of the violin
        pchMed = 16,           # Pch symbol for the median
        plotCentre = "points") # If "line", plots a median line

stripchart(x, method = "jitter", col = "blue",
           vertical = TRUE, pch = 19, add = TRUE)

box <- boxplot(x)
x <- x[!(x %in% box$out)]
vioplot(x)

par(mfrow = c(1, 2))
vioplot(1:10)
vioplot(1:10, ylog = TRUE)
par(mfrow = c(1, 1))

set.seed(1)

# Multimodal data
n <- 10000
ii <- rbinom(n, 1, 0.5)
data <- rnorm(n, mean = 130, sd = 10) * ii + rnorm(n, mean = 80, sd = 5) * (1 - ii)

# Histogram
hist(data, probability = TRUE, col = "grey", axes = FALSE,
     main = "", xlab = "",  ylab = "")

# X-axis
axis(1)

# Density
lines(density(data), lwd = 2, col = "red")

# Add violin plot
par(new = TRUE)
vioplot(data, horizontal = TRUE, yaxt = "n", axes = FALSE,
        col = rgb(0, 1, 1, alpha = 0.15))

tail(chickwts) # Last rows

data <- chickwts
vioplot(data$weight ~ data$feed, col = 2:length(levels(data$feed)),
        xlab = "Feed", ylab = "Weight")

stripchart(data$weight ~ data$feed, vertical = TRUE, method = "jitter",
           pch = 19, add = TRUE, col = 3:8)

tail(trees) # Last rows

data <- trees

vioplot(data, col = 2:4, border = 2:4)

# Equivalent to:
stacked_data <- stack(trees)
vioplot(stacked_data$values ~ stacked_data$ind, col = 2:4,
        border = 2:4)

levels(chickwts$feed)

par(mfrow = c(1, 2))
data <- chickwts
#----------------
# Lower to higher
#----------------
medians <- reorder(data$feed, data$weight, median)
# medians <- with(data, reorder(feed, weight, median)) # Equivalent
vioplot(data$weight ~ medians, col = 2:(length(levels(data$feed)) + 1),
        xlab = "", ylab = "Weight", las = 2)
#----------------
# Higher to lower
#----------------
medians <- reorder(data$feed, -data$weight, median)
# medians <- with(data, reorder(feed, -weight, median)) # Equivalent
vioplot(data$weight ~ medians, col = 2:(length(levels(data$feed)) + 1),
        xlab = "", ylab = "Weight", las = 2)
par(mfrow = c(1, 1))

par(mfrow = c(1, 2))
# Exponential data
set.seed(5)
x <- rexp(20)
#-------------------
# Vertical vioplot
#-------------------
vioplot(x, col = 4)
# Add mean point
points(mean(x), pch = 19, col = "green", cex = 1.5)
#-------------------
# Horizontal vioplot
#-------------------
vioplot(x, col = 4, horizontal = TRUE)
# Add mean point
points(mean(x), 1, pch = 19, col = "green", cex = 1.5)
legend("topright", pch = c(21, 19), col = c("black", "green"),
       bg = "white", legend = c("Median", "Mean"), cex = 1.25)
par(mfrow = c(1, 1))

par(mfrow = c(1, 2))
set.seed(5)
df <- data.frame(x = rexp(20), y = rexp(20), z = rexp(20))
#--------------------------
# Vertical vioplot by group
#--------------------------
vioplot(df, col = 2:4)
# Add mean points
means <- apply(df, 2, mean)
means <- colMeans(df) # Equivalent (more efficient)
points(means, pch = 19, col = "green", cex = 1.25)
legend("top", pch = c(21, 19), col = c("black", "green"),
       bg = "white", legend = c("Median", "Mean"), cex = 1.25)
#----------------------------
# Horizontal vioplot by group
#----------------------------
vioplot(df, col = 2:4,
        horizontal = TRUE)
# Add mean points
means <- apply(df, 2, mean)
means <- colMeans(df) # Equivalent (more efficient)
points(means, 1:ncol(df), pch = 19, col = "green", cex = 1.25)
par(mfrow = c(1, 1))

data <- trees
tall <- trees[trees$Height >= 76, ]
small <- trees[trees$Height < 76, ]
vioplot(tall, side = "left", plotCentre = "line", col = 2, horizontal = TRUE)
vioplot(small, side = "right", plotCentre = "line", col = 3, add = TRUE, horizontal = TRUE)
legend("topleft", legend = c("Tall", "Small"), fill = c(2, 3), cex = 1.25)

