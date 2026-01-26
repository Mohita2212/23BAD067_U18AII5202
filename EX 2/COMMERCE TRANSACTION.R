# Roll Number: 23BAD067
library(ggplot2)
library(dplyr)

data <- read.csv("2.ecommerce_transactions.csv")
data <- na.omit(data)

ggplot(data, aes(x = Transaction_Amount)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(
    title = "Distribution of Transaction Amounts",
    x = "Transaction Amount",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(data, aes(y = Transaction_Amount)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Boxplot of Transaction Amounts",
    y = "Transaction Amount"
  ) +
  theme_minimal()

data$Month <- format(as.Date(data$Transaction_Date), "%b")

monthly_sales <- data %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Transaction_Amount))

ggplot(monthly_sales, aes(x = Month, y = 1, fill = Total_Sales)) +
  geom_tile() +
  labs(
    title = "Heatmap of Monthly Sales Intensity",
    x = "Month",
    y = "",
    fill = "Sales"
  ) +
  theme_minimal()
