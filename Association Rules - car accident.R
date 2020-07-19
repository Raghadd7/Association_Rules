#reading dataset 
labeled <- read.csv("~/labeled.csv")

#importing libriraies 
#install.packages('arules')
#install.packages('arulesViz')
#install.packages('seas')
library(arulesViz)
library(arules)
library(seas)

#seperate the date from the time in Date variable 
Time <- format(as.POSIXct(strptime(labeled$Date,"%Y-%m-%d %H:%M:%S",tz="")) ,format = "%H:%M:%S")

Date <- format(as.POSIXct(strptime(labeled$Date,"%Y-%m-%d %H:%M:%S",tz="")) ,format = "%Y-%m-%d")

labeled$Date <- Date
labeled$Time <- Time

#discretizing Time variable to parts of the day (morning, evening and night)
res <- cut(strptime(labeled$Time, format = "%H:%M"), breaks = strptime(c("04:30", "12:00", 
           "21:00", "21:01"), format = "%H:%M"), 
                   labels = c("morning", "evening", "night"))

res[is.na(res)] <- "night"
labeled$Time <- res

#discretizing Date variable to seasons 
labeled$Date <- as.Date(labeled$Date)
Season <-  mkseas(labeled, width="DJF")
labeled$Season <- Season

#discretizing numerical variables to intervals 
labeled$Speed_limit <- discretize(labeled$Speed_limit, method = "interval", breaks= 3)
labeled$Age_of_Casualty <- discretize(labeled$Age_of_Casualty, method = "interval", breaks = 3)
labeled$Number_of_Casualties<- discretize(labeled$Number_of_Casualties, method = "interval", breaks = 4)
labeled$Number_of_Vehicles<- discretize(labeled$Number_of_Vehicles, method = "interval", breaks = 3)


labeled2 <- labeled[,-c(1,2,3,4,7,12,13,17,18,20,21,22,29,30,31,32)]


#generating rules 
rules <- apriori(labeled2, parameter = list(minlen=2,supp=0.005,conf=0.7),
                 appearance = list(rhs= c("Casualty_Severity=Fatal"),
                                   default = "lhs"), 
                 control = list(verbose=F)
)
rules 
rules.sorted <- sort(rules,by="lift")
rules.sorted
inspect(head(rules.sorted))
inspect(tail(rules.sorted))
inspect(rules.sorted)

#grouped matrix 
plot(rules, method="grouped")




