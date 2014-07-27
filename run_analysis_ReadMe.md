# run_analysis.R ReadMe

I begin my code by cleaning up the global environment and loading the plyr package.  
Note: the Samsung data must be in the home directory.  


```r
rm(list=ls())
library(plyr)
```

Next, 
    - I read in the test data and the features and activity information.  
    - Assign the feature descriptions as the column names on the test data.  
    - Using join() from the plyr package, join the activity and test data.  
    - Column bind the activity description and the test data.  
    - Take only the columns expressing: Activity description, Feature mean, Feature standard deviation  

```r
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
```

Next,  
    - Use the same procedure on the training data.  

```r
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
```
    
Use rbind to combine the two data sets in to a single data set.  
Write the tidy data to a .txt comma seperated file in the home directory.  
Print the str() and summary() of the tidy data set.  

```
## 'data.frame':	10299 obs. of  62 variables:
##  $ Activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...
##  $ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
##  $ tBodyAcc-mean()-Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
##  $ tBodyAcc-std()-X           : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
##  $ tBodyAcc-std()-Y           : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
##  $ tBodyAcc-std()-Z           : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
##  $ tGravityAcc-mean()-X       : num  0.963 0.967 0.967 0.968 0.968 ...
##  $ tBodyAccJerk-mean()-X      : num  0.078 0.074 0.0736 0.0773 0.0734 ...
##  $ tBodyAccJerk-mean()-Y      : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
##  $ tBodyAccJerk-mean()-Z      : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
##  $ tBodyAccJerk-std()-X       : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
##  $ tBodyAccJerk-std()-Y       : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
##  $ tBodyAccJerk-std()-Z       : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
##  $ tBodyGyro-mean()-X         : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
##  $ tBodyGyro-mean()-Y         : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
##  $ tBodyGyro-mean()-Z         : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
##  $ tBodyGyro-std()-X          : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
##  $ tBodyGyro-std()-Y          : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
##  $ tBodyGyro-std()-Z          : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
##  $ tBodyGyroJerk-mean()-X     : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
##  $ tBodyGyroJerk-mean()-Y     : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
##  $ tBodyGyroJerk-mean()-Z     : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
##  $ tBodyGyroJerk-std()-X      : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
##  $ tBodyGyroJerk-std()-Y      : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
##  $ tBodyGyroJerk-std()-Z      : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
##  $ tBodyAccMag-mean()         : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
##  $ tBodyAccMag-std()          : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
##  $ tGravityAccMag-mean()      : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
##  $ tGravityAccMag-std()       : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
##  $ tBodyAccJerkMag-mean()     : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...
##  $ tBodyAccJerkMag-std()      : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...
##  $ tBodyGyroMag-mean()        : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...
##  $ tBodyGyroMag-std()         : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...
##  $ tBodyGyroJerkMag-mean()    : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...
##  $ tBodyGyroJerkMag-std()     : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
##  $ fBodyAcc-mean()-X          : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
##  $ fBodyAcc-mean()-Y          : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
##  $ fBodyAcc-mean()-Z          : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
##  $ fBodyAcc-std()-X           : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
##  $ fBodyAcc-std()-Y           : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
##  $ fBodyAcc-std()-Z           : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
##  $ fBodyAccJerk-mean()-X      : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
##  $ fBodyAccJerk-mean()-Y      : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
##  $ fBodyAccJerk-mean()-Z      : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
##  $ fBodyAccJerk-std()-X       : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
##  $ fBodyAccJerk-std()-Y       : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
##  $ fBodyAccJerk-std()-Z       : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
##  $ fBodyGyro-mean()-X         : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
##  $ fBodyGyro-mean()-Y         : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
##  $ fBodyGyro-mean()-Z         : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
##  $ fBodyGyro-std()-X          : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
##  $ fBodyGyro-std()-Y          : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
##  $ fBodyGyro-std()-Z          : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
##  $ fBodyAccMag-mean()         : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...
##  $ fBodyAccMag-std()          : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...
##  $ fBodyBodyAccJerkMag-mean() : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...
##  $ fBodyBodyAccJerkMag-std()  : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...
##  $ fBodyBodyGyroMag-mean()    : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...
##  $ fBodyBodyGyroMag-std()     : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...
##  $ fBodyBodyGyroJerkMag-mean(): num  -0.992 -0.996 -0.995 -0.995 -0.995 ...
##  $ fBodyBodyGyroJerkMag-std() : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
## NULL
```

```
##                Activity    tBodyAcc-mean()-X tBodyAcc-mean()-Y
##  LAYING            :1944   Min.   :-1.000    Min.   :-1.0000  
##  SITTING           :1777   1st Qu.: 0.263    1st Qu.:-0.0249  
##  STANDING          :1906   Median : 0.277    Median :-0.0172  
##  WALKING           :1722   Mean   : 0.274    Mean   :-0.0177  
##  WALKING_DOWNSTAIRS:1406   3rd Qu.: 0.288    3rd Qu.:-0.0106  
##  WALKING_UPSTAIRS  :1544   Max.   : 1.000    Max.   : 1.0000  
##  tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y  tBodyAcc-std()-Z
##  Min.   :-1.0000   Min.   :-1.000   Min.   :-1.0000   Min.   :-1.000  
##  1st Qu.:-0.1210   1st Qu.:-0.992   1st Qu.:-0.9770   1st Qu.:-0.979  
##  Median :-0.1086   Median :-0.943   Median :-0.8350   Median :-0.851  
##  Mean   :-0.1089   Mean   :-0.608   Mean   :-0.5102   Mean   :-0.613  
##  3rd Qu.:-0.0976   3rd Qu.:-0.250   3rd Qu.:-0.0573   3rd Qu.:-0.279  
##  Max.   : 1.0000   Max.   : 1.000   Max.   : 1.0000   Max.   : 1.000  
##  tGravityAcc-mean()-X tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y
##  Min.   :-1.000       Min.   :-1.0000       Min.   :-1.0000      
##  1st Qu.: 0.812       1st Qu.: 0.0630       1st Qu.:-0.0186      
##  Median : 0.922       Median : 0.0760       Median : 0.0108      
##  Mean   : 0.669       Mean   : 0.0789       Mean   : 0.0079      
##  3rd Qu.: 0.955       3rd Qu.: 0.0913       3rd Qu.: 0.0335      
##  Max.   : 1.000       Max.   : 1.0000       Max.   : 1.0000      
##  tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X tBodyAccJerk-std()-Y
##  Min.   :-1.0000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.0316       1st Qu.:-0.991       1st Qu.:-0.985      
##  Median :-0.0012       Median :-0.951       Median :-0.925      
##  Mean   :-0.0047       Mean   :-0.640       Mean   :-0.608      
##  3rd Qu.: 0.0246       3rd Qu.:-0.291       3rd Qu.:-0.222      
##  Max.   : 1.0000       Max.   : 1.000       Max.   : 1.000      
##  tBodyAccJerk-std()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y
##  Min.   :-1.000       Min.   :-1.0000    Min.   :-1.0000   
##  1st Qu.:-0.989       1st Qu.:-0.0458    1st Qu.:-0.1040   
##  Median :-0.954       Median :-0.0278    Median :-0.0748   
##  Mean   :-0.763       Mean   :-0.0310    Mean   :-0.0747   
##  3rd Qu.:-0.548       3rd Qu.:-0.0106    3rd Qu.:-0.0511   
##  Max.   : 1.000       Max.   : 1.0000    Max.   : 1.0000   
##  tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
##  Min.   :-1.0000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000   
##  1st Qu.: 0.0648    1st Qu.:-0.987    1st Qu.:-0.982    1st Qu.:-0.985   
##  Median : 0.0863    Median :-0.902    Median :-0.911    Median :-0.882   
##  Mean   : 0.0884    Mean   :-0.721    Mean   :-0.683    Mean   :-0.654   
##  3rd Qu.: 0.1104    3rd Qu.:-0.482    3rd Qu.:-0.446    3rd Qu.:-0.338   
##  Max.   : 1.0000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000   
##  tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
##  Min.   :-1.0000        Min.   :-1.0000        Min.   :-1.0000       
##  1st Qu.:-0.1172        1st Qu.:-0.0587        1st Qu.:-0.0794       
##  Median :-0.0982        Median :-0.0406        Median :-0.0546       
##  Mean   :-0.0967        Mean   :-0.0423        Mean   :-0.0548       
##  3rd Qu.:-0.0793        3rd Qu.:-0.0252        3rd Qu.:-0.0317       
##  Max.   : 1.0000        Max.   : 1.0000        Max.   : 1.0000       
##  tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.991        1st Qu.:-0.992        1st Qu.:-0.993       
##  Median :-0.935        Median :-0.955        Median :-0.950       
##  Mean   :-0.731        Mean   :-0.786        Mean   :-0.740       
##  3rd Qu.:-0.486        3rd Qu.:-0.627        3rd Qu.:-0.510       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  tBodyAccMag-mean() tBodyAccMag-std() tGravityAccMag-mean()
##  Min.   :-1.000     Min.   :-1.000    Min.   :-1.000       
##  1st Qu.:-0.982     1st Qu.:-0.982    1st Qu.:-0.982       
##  Median :-0.875     Median :-0.844    Median :-0.875       
##  Mean   :-0.548     Mean   :-0.591    Mean   :-0.548       
##  3rd Qu.:-0.120     3rd Qu.:-0.242    3rd Qu.:-0.120       
##  Max.   : 1.000     Max.   : 1.000    Max.   : 1.000       
##  tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std()
##  Min.   :-1.000       Min.   :-1.000         Min.   :-1.000       
##  1st Qu.:-0.982       1st Qu.:-0.990         1st Qu.:-0.991       
##  Median :-0.844       Median :-0.948         Median :-0.929       
##  Mean   :-0.591       Mean   :-0.649         Mean   :-0.628       
##  3rd Qu.:-0.242       3rd Qu.:-0.296         3rd Qu.:-0.273       
##  Max.   : 1.000       Max.   : 1.000         Max.   : 1.000       
##  tBodyGyroMag-mean() tBodyGyroMag-std() tBodyGyroJerkMag-mean()
##  Min.   :-1.000      Min.   :-1.000     Min.   :-1.000         
##  1st Qu.:-0.978      1st Qu.:-0.978     1st Qu.:-0.992         
##  Median :-0.822      Median :-0.826     Median :-0.956         
##  Mean   :-0.605      Mean   :-0.662     Mean   :-0.762         
##  3rd Qu.:-0.245      3rd Qu.:-0.394     3rd Qu.:-0.550         
##  Max.   : 1.000      Max.   : 1.000     Max.   : 1.000         
##  tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y
##  Min.   :-1.000         Min.   :-1.000    Min.   :-1.000   
##  1st Qu.:-0.992         1st Qu.:-0.991    1st Qu.:-0.979   
##  Median :-0.940         Median :-0.946    Median :-0.864   
##  Mean   :-0.778         Mean   :-0.623    Mean   :-0.537   
##  3rd Qu.:-0.609         3rd Qu.:-0.265    3rd Qu.:-0.103   
##  Max.   : 1.000         Max.   : 1.000    Max.   : 1.000   
##  fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y  fBodyAcc-std()-Z
##  Min.   :-1.000    Min.   :-1.000   Min.   :-1.0000   Min.   :-1.000  
##  1st Qu.:-0.983    1st Qu.:-0.993   1st Qu.:-0.9769   1st Qu.:-0.978  
##  Median :-0.895    Median :-0.942   Median :-0.8326   Median :-0.840  
##  Mean   :-0.665    Mean   :-0.603   Mean   :-0.5284   Mean   :-0.618  
##  3rd Qu.:-0.366    3rd Qu.:-0.249   3rd Qu.:-0.0922   3rd Qu.:-0.302  
##  Max.   : 1.000    Max.   : 1.000   Max.   : 1.0000   Max.   : 1.000  
##  fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
##  Min.   :-1.000        Min.   :-1.000        Min.   :-1.000       
##  1st Qu.:-0.991        1st Qu.:-0.985        1st Qu.:-0.987       
##  Median :-0.952        Median :-0.926        Median :-0.948       
##  Mean   :-0.657        Mean   :-0.629        Mean   :-0.744       
##  3rd Qu.:-0.327        3rd Qu.:-0.264        3rd Qu.:-0.513       
##  Max.   : 1.000        Max.   : 1.000        Max.   : 1.000       
##  fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z
##  Min.   :-1.000       Min.   :-1.000       Min.   :-1.000      
##  1st Qu.:-0.992       1st Qu.:-0.987       1st Qu.:-0.990      
##  Median :-0.956       Median :-0.928       Median :-0.959      
##  Mean   :-0.655       Mean   :-0.612       Mean   :-0.781      
##  3rd Qu.:-0.320       3rd Qu.:-0.236       3rd Qu.:-0.590      
##  Max.   : 1.000       Max.   : 1.000       Max.   : 1.000      
##  fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
##  Min.   :-1.000     Min.   :-1.000     Min.   :-1.000    
##  1st Qu.:-0.985     1st Qu.:-0.985     1st Qu.:-0.985    
##  Median :-0.892     Median :-0.920     Median :-0.888    
##  Mean   :-0.672     Mean   :-0.706     Mean   :-0.644    
##  3rd Qu.:-0.384     3rd Qu.:-0.473     3rd Qu.:-0.323    
##  Max.   : 1.000     Max.   : 1.000     Max.   : 1.000    
##  fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean()
##  Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    Min.   :-1.000    
##  1st Qu.:-0.988    1st Qu.:-0.981    1st Qu.:-0.986    1st Qu.:-0.985    
##  Median :-0.905    Median :-0.906    Median :-0.891    Median :-0.875    
##  Mean   :-0.739    Mean   :-0.674    Mean   :-0.690    Mean   :-0.586    
##  3rd Qu.:-0.522    3rd Qu.:-0.438    3rd Qu.:-0.417    3rd Qu.:-0.217    
##  Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    Max.   : 1.000    
##  fBodyAccMag-std() fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
##  Min.   :-1.000    Min.   :-1.000             Min.   :-1.000           
##  1st Qu.:-0.983    1st Qu.:-0.990             1st Qu.:-0.991           
##  Median :-0.855    Median :-0.929             Median :-0.925           
##  Mean   :-0.659    Mean   :-0.621             Mean   :-0.640           
##  3rd Qu.:-0.382    3rd Qu.:-0.260             3rd Qu.:-0.308           
##  Max.   : 1.000    Max.   : 1.000             Max.   : 1.000           
##  fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std()
##  Min.   :-1.000          Min.   :-1.000        
##  1st Qu.:-0.983          1st Qu.:-0.978        
##  Median :-0.876          Median :-0.828        
##  Mean   :-0.697          Mean   :-0.700        
##  3rd Qu.:-0.451          3rd Qu.:-0.471        
##  Max.   : 1.000          Max.   : 1.000        
##  fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
##  Min.   :-1.000              Min.   :-1.000            
##  1st Qu.:-0.992              1st Qu.:-0.993            
##  Median :-0.945              Median :-0.938            
##  Mean   :-0.780              Mean   :-0.792            
##  3rd Qu.:-0.612              3rd Qu.:-0.644            
##  Max.   : 1.000              Max.   : 1.000
```
    
Next,  
We will create a second data sets that comprises the means of each Feature by Activity type.  

Start by creating a new data frame with the proper row names and get column names.  


```r
#Subsets of data by Activity type

columnNames<-names(train)[2:62]
activities<-c("STANDING","SITTING","LAYING","WALKING",
              "WALKING_DOWNSTAIRS","WALKING_UPSTAIRS")
averages<-data.frame(row.names=activities)
```

Subset the tidy data by Activity description.  
Take the mean of each feature throughout the subsets.  


```r
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
```
   
Create a new data sets by using rbind() to combine the colMeans() results.  
Add the column names.  
Write the new data set to a comma seperated .txt file in the home directory.  
Print the str() and summary() of the new data set.  
   

```
##  num [1:6, 1:61] 0.279 0.273 0.269 0.276 0.288 ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : chr [1:6] "AvgStand" "AvgSit" "AvgLay" "AvgWalk" ...
##   ..$ : chr [1:61] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" ...
## NULL
```

```
##  tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X
##  Min.   :0.262     Min.   :-0.0259   Min.   :-0.121    Min.   :-0.984  
##  1st Qu.:0.270     1st Qu.:-0.0182   1st Qu.:-0.109    1st Qu.:-0.978  
##  Median :0.275     Median :-0.0171   Median :-0.107    Median :-0.638  
##  Mean   :0.275     Mean   :-0.0179   Mean   :-0.109    Mean   :-0.563  
##  3rd Qu.:0.278     3rd Qu.:-0.0162   3rd Qu.:-0.106    3rd Qu.:-0.257  
##  Max.   :0.288     Max.   :-0.0127   Max.   :-0.106    Max.   : 0.101  
##  tBodyAcc-std()-Y  tBodyAcc-std()-Z tGravityAcc-mean()-X
##  Min.   :-0.9435   Min.   :-0.948   Min.   :-0.375      
##  1st Qu.:-0.9343   1st Qu.:-0.940   1st Qu.: 0.876      
##  Median :-0.4780   Median :-0.607   Median : 0.903      
##  Mean   :-0.4652   Mean   :-0.578   Mean   : 0.697      
##  3rd Qu.:-0.0179   3rd Qu.:-0.212   3rd Qu.: 0.933      
##  Max.   : 0.0595   Max.   :-0.175   Max.   : 0.942      
##  tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
##  Min.   :0.0750        Min.   :0.000747      Min.   :-0.00873     
##  1st Qu.:0.0761        1st Qu.:0.005975      1st Qu.:-0.00572     
##  Median :0.0767        Median :0.008782      Median :-0.00472     
##  Mean   :0.0792        Mean   :0.007673      Mean   :-0.00483     
##  3rd Qu.:0.0806        3rd Qu.:0.010581      3rd Qu.:-0.00301     
##  Max.   :0.0892        Max.   :0.011506      Max.   :-0.00232     
##  tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
##  Min.   :-0.9850      Min.   :-0.9739      Min.   :-0.982      
##  1st Qu.:-0.9803      1st Qu.:-0.9694      1st Qu.:-0.980      
##  Median :-0.6704      Median :-0.6518      Median :-0.803      
##  Mean   :-0.6012      Mean   :-0.5709      Mean   :-0.739      
##  3rd Qu.:-0.2907      3rd Qu.:-0.1622      3rd Qu.:-0.516      
##  Max.   :-0.0339      Max.   :-0.0737      Max.   :-0.389      
##  tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
##  Min.   :-0.08403   Min.   :-0.0934    Min.   :0.0599    
##  1st Qu.:-0.03751   1st Qu.:-0.0844    1st Qu.:0.0784    
##  Median :-0.03071   Median :-0.0708    Median :0.0833    
##  Mean   :-0.03230   Mean   :-0.0740    Mean   :0.0875    
##  3rd Qu.:-0.01922   3rd Qu.:-0.0681    3rd Qu.:0.0926    
##  Max.   : 0.00682   Max.   :-0.0530    Max.   :0.1259    
##  tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
##  Min.   :-0.981    Min.   :-0.967    Min.   :-0.964   
##  1st Qu.:-0.962    1st Qu.:-0.963    1st Qu.:-0.958   
##  Median :-0.708    Median :-0.655    Median :-0.648   
##  Mean   :-0.694    Mean   :-0.654    Mean   :-0.621   
##  3rd Qu.:-0.468    3rd Qu.:-0.345    3rd Qu.:-0.289   
##  Max.   :-0.334    Max.   :-0.340    Max.   :-0.237   
##  tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
##  Min.   :-0.1121        Min.   :-0.0513        Min.   :-0.0639       
##  1st Qu.:-0.1013        1st Qu.:-0.0440        1st Qu.:-0.0545       
##  Median :-0.0977        Median :-0.0415        Median :-0.0533       
##  Mean   :-0.0961        Mean   :-0.0426        Mean   :-0.0547       
##  3rd Qu.:-0.0946        3rd Qu.:-0.0392        3rd Qu.:-0.0522       
##  Max.   :-0.0728        Max.   :-0.0382        Max.   :-0.0508       
##  tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
##  Min.   :-0.986        Min.   :-0.987        Min.   :-0.985       
##  1st Qu.:-0.974        1st Qu.:-0.980        1st Qu.:-0.982       
##  Median :-0.760        Median :-0.824        Median :-0.769       
##  Mean   :-0.707        Mean   :-0.765        Mean   :-0.713       
##  3rd Qu.:-0.425        3rd Qu.:-0.551        3rd Qu.:-0.476       
##  Max.   :-0.376        Max.   :-0.466        Max.   :-0.327       
##  tBodyAccMag-mean() tBodyAccMag-std() tGravityAccMag-mean()
##  Min.   :-0.955     Min.   :-0.947    Min.   :-0.955       
##  1st Qu.:-0.951     1st Qu.:-0.938    1st Qu.:-0.951       
##  Median :-0.554     Median :-0.635    Median :-0.554       
##  Mean   :-0.503     Mean   :-0.548    Mean   :-0.503       
##  3rd Qu.:-0.117     3rd Qu.:-0.272    3rd Qu.:-0.117       
##  Max.   : 0.101     Max.   : 0.117    Max.   : 0.101       
##  tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std()
##  Min.   :-0.947       Min.   :-0.982         Min.   :-0.9789      
##  1st Qu.:-0.938       1st Qu.:-0.979         1st Qu.:-0.9735      
##  Median :-0.635       Median :-0.684         Median :-0.6784      
##  Mean   :-0.548       Mean   :-0.614         Mean   :-0.5893      
##  3rd Qu.:-0.272       3rd Qu.:-0.279         3rd Qu.:-0.2573      
##  Max.   : 0.117       Max.   :-0.112         Max.   :-0.0112      
##  tBodyGyroMag-mean() tBodyGyroMag-std() tBodyGyroJerkMag-mean()
##  Min.   :-0.947      Min.   :-0.951     Min.   :-0.988         
##  1st Qu.:-0.941      1st Qu.:-0.938     1st Qu.:-0.982         
##  Median :-0.607      Median :-0.656     Median :-0.793         
##  Mean   :-0.568      Mean   :-0.632     Mean   :-0.739         
##  3rd Qu.:-0.202      3rd Qu.:-0.348     3rd Qu.:-0.497         
##  Max.   :-0.130      Max.   :-0.251     Max.   :-0.417         
##  tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y
##  Min.   :-0.985         Min.   :-0.9831   Min.   :-0.9527  
##  1st Qu.:-0.976         1st Qu.:-0.9779   1st Qu.:-0.9467  
##  Median :-0.820         Median :-0.6324   Median :-0.5390  
##  Mean   :-0.757         Mean   :-0.5813   Mean   :-0.4941  
##  3rd Qu.:-0.541         3rd Qu.:-0.2945   3rd Qu.:-0.0655  
##  Max.   :-0.441         Max.   : 0.0353   Max.   : 0.0567  
##  fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y  fBodyAcc-std()-Z
##  Min.   :-0.960    Min.   :-0.986   Min.   :-0.9425   Min.   :-0.946  
##  1st Qu.:-0.957    1st Qu.:-0.978   1st Qu.:-0.9322   1st Qu.:-0.935  
##  Median :-0.663    Median :-0.641   Median :-0.5042   Median :-0.615  
##  Mean   :-0.633    Mean   :-0.558   Mean   :-0.4856   Mean   :-0.584  
##  3rd Qu.:-0.348    3rd Qu.:-0.245   3rd Qu.:-0.0357   3rd Qu.:-0.258  
##  Max.   :-0.214    Max.   : 0.122   Max.   :-0.0082   Max.   :-0.147  
##  fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
##  Min.   :-0.9852       Min.   :-0.974        Min.   :-0.980       
##  1st Qu.:-0.9802       1st Qu.:-0.970        1st Qu.:-0.977       
##  Median :-0.6850       Median :-0.665        Median :-0.784       
##  Mean   :-0.6198       Mean   :-0.594        Mean   :-0.718       
##  3rd Qu.:-0.3308       3rd Qu.:-0.219        3rd Qu.:-0.486       
##  Max.   :-0.0723       Max.   :-0.116        Max.   :-0.333       
##  fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z
##  Min.   :-0.9862      Min.   :-0.9758      Min.   :-0.984      
##  1st Qu.:-0.9823      1st Qu.:-0.9715      1st Qu.:-0.981      
##  Median :-0.6854      Median :-0.6622      Median :-0.821      
##  Mean   :-0.6183      Mean   :-0.5759      Mean   :-0.760      
##  3rd Qu.:-0.3132      3rd Qu.:-0.1580      3rd Qu.:-0.545      
##  Max.   :-0.0822      Max.   :-0.0909      Max.   :-0.444      
##  fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
##  Min.   :-0.977     Min.   :-0.973     Min.   :-0.964    
##  1st Qu.:-0.958     1st Qu.:-0.967     1st Qu.:-0.960    
##  Median :-0.669     Median :-0.712     Median :-0.634    
##  Mean   :-0.641     Mean   :-0.678     Mean   :-0.609    
##  3rd Qu.:-0.360     3rd Qu.:-0.406     3rd Qu.:-0.300    
##  Max.   :-0.218     Max.   :-0.318     Max.   :-0.166    
##  fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean()
##  Min.   :-0.982    Min.   :-0.964    Min.   :-0.967    Min.   :-0.956    
##  1st Qu.:-0.964    1st Qu.:-0.961    1st Qu.:-0.961    1st Qu.:-0.951    
##  Median :-0.729    Median :-0.661    Median :-0.686    Median :-0.612    
##  Mean   :-0.713    Mean   :-0.645    Mean   :-0.662    Mean   :-0.542    
##  3rd Qu.:-0.499    3rd Qu.:-0.339    3rd Qu.:-0.388    3rd Qu.:-0.265    
##  Max.   :-0.375    Max.   :-0.293    Max.   :-0.292    Max.   : 0.143    
##  fBodyAccMag-std() fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
##  Min.   :-0.9496   Min.   :-0.9787            Min.   :-0.9782          
##  1st Qu.:-0.9402   1st Qu.:-0.9735            1st Qu.:-0.9726          
##  Median :-0.7075   Median :-0.6625            Median :-0.7026          
##  Mean   :-0.6239   Mean   :-0.5813            Mean   :-0.6034          
##  3rd Qu.:-0.3913   3rd Qu.:-0.2495            3rd Qu.:-0.2748          
##  Max.   :-0.0754   Max.   : 0.0048            Max.   :-0.0423          
##  fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std()
##  Min.   :-0.964          Min.   :-0.952        
##  1st Qu.:-0.953          1st Qu.:-0.939        
##  Median :-0.699          Median :-0.702        
##  Mean   :-0.669          Mean   :-0.673        
##  3rd Qu.:-0.419          3rd Qu.:-0.405        
##  Max.   :-0.289          Max.   :-0.361        
##  fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
##  Min.   :-0.985              Min.   :-0.985            
##  1st Qu.:-0.977              1st Qu.:-0.976            
##  Median :-0.817              Median :-0.838            
##  Mean   :-0.758              Mean   :-0.773            
##  3rd Qu.:-0.551              3rd Qu.:-0.562            
##  Max.   :-0.438              Max.   :-0.486
```
   
   
    
    
