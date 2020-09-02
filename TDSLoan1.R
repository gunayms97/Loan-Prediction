

#Loan_Amount_Term -> This represents the number of months required to repay the loan.
#Credit_History ->  A credit history is a record of a borrower's responsible repayment of debts. It suggests ??? 1 denotes that the credit history is good and 0 otherwise.


train <- read.csv("train.csv", na.strings = c("NA",""))
test <- read.csv("test.csv", na.strings = c("NA",""))

head(train,5)
colnames(train)
dim(train)

table(train$Loan_Status) #twice as more yes than no 192 422

table(train$Gender) #more males 112 489

table(train$Married) #more yes 213 398 

table(train$Dependents) #0(345)   1(102)   2(101)  3+(51)

table(train$Education) #more graduate 480 ;Not Graduate 134

table(train$Self_Employed) #more no 500;yes 82

table(train$Credit_History) #more 1 475 ;0 89

table(train$Property_Area) #more semiurban 233; rural 179; urban 202


#visualizations
library(ggplot2)
#GENDER
ggplot(train, aes(x = Gender)) +
  geom_bar(fill = "salmon")

#married
ggplot(train, aes(x = Married)) +
  geom_bar(fill = "light blue")


#self employed
ggplot(train, aes(x = Self_Employed)) +
  geom_bar(fill = "salmon")

#credit history
ggplot(train, aes(x = as.factor(Credit_History))) +
  geom_bar(fill = "salmon")

#education
ggplot(train, aes(x = Education)) +
  geom_bar(fill = "salmon")

#property area
ggplot(train, aes(x = Property_Area)) +
  geom_bar(fill = "salmon")

#Dependents
ggplot(train, aes(x = Dependents)) +
  geom_bar(fill = "salmon")

########
#?
  
ggplot(train, aes(x = Credit_History,y = ApplicantIncome,fill = Loan_Status)) +
geom_point() 


ggplot(train, aes(x = Married,fill = Loan_Status)) +
  geom_bar() 

ggplot(train, aes(x = Dependents,fill = Loan_Status)) +
  geom_bar() 

ggplot(train, aes(x = Education,fill = Loan_Status)) +
  geom_bar() 

ggplot(train, aes(x = Self_Employed,fill = Loan_Status)) +
  geom_bar() 

##DATA CLEANING AND STRUCTURING

colSums(is.na(train))

table(train$Gender)
train[which(is.na(train$Gender)),"Gender"] <- 'Male'

table(train$Married)
train[which(is.na(train$Married)),"Married"] <- 'Yes'

table(train$Dependents)
train[which(is.na(train$Dependents)),"Dependents"] <- '0'

table(train$Self_Employed)
train[which(is.na(train$Self_Employed)),"Self_Employed"] <- 'No'

table(train$Credit_History)
train[which(is.na(train$Credit_History)),"Credit_History"] <- '1'



train[which(is.na(train$LoanAmount)),"LoanAmount"] <- median(train$LoanAmount, na.rm = T)

table(train$Loan_Amount_Term)
train[which(is.na(train$Loan_Amount_Term)),"Loan_Amount_Term"]<- median(train$Loan_Amount_Term,na.rm = T)

#unique values
sapply(train, function(x) length(unique(x)))















