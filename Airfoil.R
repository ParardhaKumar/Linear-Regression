setwd("~/Desktop/Projects/Data Science /Linear Regression ")

data <- read.csv("airfoil_self_noise.csv")

View(data)
cor(data)

model <- lm(Sound_pressure_level ~ ., data = data)
summary(model)
