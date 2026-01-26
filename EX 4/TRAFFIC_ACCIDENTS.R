# ROLL_NUMBER: 23BAD067
library(ggplot2)
accidents <- read.csv("4.traffic_accidents.csv")
accidents$Severity_Num <- as.numeric(
  factor(accidents$Severity,
         levels = c("Minor", "Serious", "Fatal"))
)
accidents$Location <- as.factor(accidents$Location)
ggplot(accidents, aes(
  x = Location,
  y = Severity_Num,
  color = Severity_Num,
  size = Vehicles_Involved,
  shape = Accident_Type
)) +
  geom_point(alpha = 0.7) +
  scale_color_gradient(low = "lightblue", high = "darkred") +
  labs(
    title = "Traffic Accident Severity Analysis",
    x = "Location",
    y = "Severity Level (Minor – Fatal)",
    color = "Severity",
    size = "Vehicles Involved",
    shape = "Accident Type"
  ) +
  theme_minimal()
