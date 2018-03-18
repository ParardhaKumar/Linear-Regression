#setwd("~/Desktop/Projects/Data Science /Linear Regression ")

data <- read.csv("airfoil_self_noise.csv")

View(data)
cor(data)

model <- lm(Sound_pressure_level ~ ., data = data)
summary(model)

plot(model) #Residual vs Fitted Plot shows Heteroskedasticity

model <- update(model, log(Sound_pressure_level) ~ .)
summary(model)

plot(model)

set.seed(1)
d <- sample(x = nrow(data), size = nrow(data)*0.7)
train = data[d, ]
test = data[-d, ]

model <- lm(log(Sound_pressure_level) ~ ., data = train)
summary(model)

pred <- predict(model, test) # The predictions are log of the dependent variable. Therefore take log.

pred <- exp(pred)

library(Metrics)
rmse(actual = test$Sound_pressure_level, predicted = pred)

d <- boxplot(train$Frquency.Hz.)
d$out #Enlist Outliers


