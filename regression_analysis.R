# Load required libraries
if(!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

# ---------- Dataset 1: mtcars ----------
data(mtcars)

# Linear regression: mpg ~ wt
model1 <- lm(mpg ~ wt, data = mtcars)
summary(model1)

# Plot with regression line
plot1 <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  ggtitle("MPG vs Weight (mtcars)")

# Save plot
ggsave("mtcars_plot.png", plot1)

# ---------- Dataset 2: iris ----------
data(iris)

# Linear regression: Petal.Length ~ Sepal.Length for setosa only
iris_setosa <- subset(iris, Species == "setosa")
model2 <- lm(Petal.Length ~ Sepal.Length, data = iris_setosa)
summary(model2)

# Plot with regression line
plot2 <- ggplot(iris_setosa, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(color = "green") +
  geom_smooth(method = "lm", color = "purple", se = FALSE) +
  ggtitle("Petal Length vs Sepal Length (Setosa Only)")

# Save plot
ggsave("iris_plot.png", plot2)
