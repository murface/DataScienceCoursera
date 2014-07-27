rm(list=ls())

library(plyr)

# Read in test data and labels
features<-read.table("features.txt")
test<-read.table("X_test.txt")
# Add feature names as column headers
colnames(test)<-features[,2]
# Read in activity labels and data
testLabels<-read.table("y_test.txt")
colnames(testLabels)<-"ActivityCode"
activityLabels<-read.table("activity_labels.txt")
colnames(activityLabels)<-c("ActivityCode","Activity")
# Add acitvity name to training data
activity<-join(testLabels,activityLabels,by="ActivityCode")
test<-cbind(activity$Activity,test)
colnames(test)[1]<-"Activity"
test<-test[,c(1:7,42.47,82:87,122:127,162:167,202,203,215,216,228,229,
              241,242,254,255,267:272,346:351,425:430,504,505,517,518,
              530,531,543,544)]



# Read in training data and labels
features<-read.table("features.txt")
train<-read.table("X_train.txt")
# Add feature names as column headers
colnames(train)<-features[,2]
# Read in activity labels and data
trainingLabels<-read.table("y_train.txt")
colnames(trainingLabels)<-"ActivityCode"
activityLabels<-read.table("activity_labels.txt")
colnames(activityLabels)<-c("ActivityCode","Activity")
# Add acitvity name to training data
activity<-join(trainingLabels,activityLabels,by="ActivityCode")
train<-cbind(activity$Activity,train)
colnames(train)[1]<-"Activity"
train<-train[,c(1:7,42.47,82:87,122:127,162:167,202,203,215,216,228,229,
              241,242,254,255,267:272,346:351,425:430,504,505,517,518,
              530,531,543,544)]

# Combine the test and trinaing data
data<-rbind(train,test)

write.table(data,"TidyDataSet.txt",sep=",")

print(str(data))
print(summary(data))

#############################################

#Subsets of data by Activity type

columnNames<-names(train)[2:62]
activities<-c("STANDING","SITTING","LAYING","WALKING",
              "WALKING_DOWNSTAIRS","WALKING_UPSTAIRS")
averages<-data.frame(row.names=activities)


stand<-data[data$Activity=="STANDING",]
sit<-data[data$Activity=="SITTING",]
lay<-data[data$Activity=="LAYING",]
walk<-data[data$Activity=="WALKING",]
downstairs<-data[data$Activity=="WALKING_DOWNSTAIRS",]
upstairs<-data[data$Activity=="WALKING_UPSTAIRS",]

# Data Frame of Averages by Activity and Feature
AvgStand<-colMeans(stand[,-1])
AvgSit<-colMeans(sit[,-1])
AvgLay<-colMeans(lay[,-1])
AvgWalk<-colMeans(walk[,-1])
AvgWalkDownstairs<-colMeans(downstairs[,-1])
AvgWalkUpstairs<-colMeans(upstairs[,-1])

#create a single data frame
averages<-rbind(AvgStand,AvgSit,AvgLay,AvgWalk,AvgWalkDownstairs,AvgWalkUpstairs)
colnames(averages)<-columnNames


write.table(averages,"AvgTidyDataSet.txt",sep=",")

print(str(averages))
print(summary(averages))

