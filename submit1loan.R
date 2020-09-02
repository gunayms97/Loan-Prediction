

train <- read.csv("train.csv", stringsAsFactors = FALSE, header = TRUE,na.strings =c("NA",""))
test <- read.csv("test.csv", stringsAsFactors = FALSE, header = TRUE,na.strings =c("NA",""))

train$isTrainSet <- TRUE
test$isTrainSet <- FALSE

test$Loan_Status <- NA

loan <- rbind(train, test)


table(loan$Gender)
loan[which(is.na(loan$Gender)),"Gender"] <- 'Male'

table(loan$Married)
loan[which(is.na(loan$Married)),"Married"] <- 'Yes'

table(loan$Dependents)
loan[which(is.na(loan$Dependents)),"Dependents"] <- '0'

table(loan$Self_Employed)
loan[which(is.na(loan$Self_Employed)),"Self_Employed"] <- 'No'

table(loan$Credit_History)
loan[which(is.na(loan$Credit_History)),"Credit_History"] <- '1'



loan[which(is.na(loan$LoanAmount)),"LoanAmount"] <- median(loan$LoanAmount, na.rm = T)


loan[which(is.na(loan$Loan_Amount_Term)),"Loan_Amount_Term"]<- median(loan$Loan_Amount_Term,na.rm = T)

loan$Gender <- as.factor(loan$Gender)
loan$Married <- as.factor(loan$Married)
loan$Dependents <- as.factor(loan$Dependents)
loan$Education <- as.factor(loan$Education)
loan$Self_Employed <- as.factor(loan$Self_Employed)
loan$Credit_History <- as.factor(loan$Credit_History)
loan$Property_Area <- as.factor(loan$Property_Area)


train <- loan[loan$isTrainSet == TRUE,]
test <- loan[loan$isTrainSet== FALSE,]

train$Loan_Status <- as.factor(train$Loan_Status)


loan_equation <- "Loan_Status~ Gender + Married + Dependents+Education + Self_Employed+ ApplicantIncome + CoapplicantIncome + LoanAmount + Loan_Amount_Term + Credit_History + Property_Area"
loan_formula <- as.formula(loan_equation)
library(randomForest)

loan_model <- randomForest(formula = loan_formula, data = train, ntree = 500, mtry = 3)

loanstatus <- predict(loan_model, newdata = test)

Loan_ID <- test$Loan_ID
output.df <- as.data.frame(Loan_ID)
output.df$Loan_Status <- loanstatus

write.csv(output.df, file = "av_loan.csv", row.names = FALSE)
