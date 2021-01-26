
train <- read.csv("train.csv", na.strings = c("NA",""))
##Quick Data Exploration
head(train)
dim(train)

str(train)
summary(train)

colSums(is.na(train))

library(Amelia)
missmap(train, col = c("black","grey"))

##Distribution analysis
library(ggplot2)

ggplot(train, aes(x = ApplicantIncome)) +
  theme_bw() +
  geom_histogram(bins = 50) +
  labs(y = "Applicant Count",
       x = "ApplicantIncome",
       title = "Applicant Income Distribtion")


ggplot(train, aes(x = Education , y = ApplicantIncome)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Applicant Income",
       x = "Education",
       title = "Applicant Income")


#loan amount hist
ggplot(train, aes(x = LoanAmount)) +
  theme_bw() +
  geom_histogram(bins = 50) +
  labs(y = "Applicant Count",
       x = "Loan Amount",
       title = "Loan Amount Distribtion")

ggplot(train, aes( y = LoanAmount)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Loan Amount",
       title = "Loan Amount")







