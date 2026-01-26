# Roll Number: 23BAD067
library(ggplot2)
library(GGally)
library(dplyr)
health_data <- read.csv("3.healthcare_data.csv")
health_data <- na.omit(health_data)
health_data$Age_Group <- cut(
  health_data$Age,
  breaks = c(0, 30, 50, 100),
  labels = c("Young", "Middle-aged", "Senior"),
  right = FALSE
)
ggpairs(
  health_data,
  columns = c("Age", "BMI", "Glucose", "Blood_Pressure"),
  aes(color = Age_Group, alpha = 0.7)
)
correlation_matrix <- cor(
  health_data[, c("Age", "BMI", "Glucose", "Blood_Pressure")],
  use = "complete.obs"
)
print(correlation_matrix)
