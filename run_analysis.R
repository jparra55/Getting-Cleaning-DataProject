# Current location ../UCI HAR Dataset
# Read all the needed files into R

# Train files
setwd("train")
xTrain <- read.table("X_train.txt")
yTrain <- read.table("y_train.txt")
subTrain <- read.table("subject_train.txt")

# Test files
setwd("..")
setwd("test")
xTest <- read.table("X_test.txt")
yTest <- read.table("y_test.txt")
subTest <- read.table("subject_test.txt")

# Features and activity files
setwd("..")
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt", stringsAsFactors = F)

# Processing steps
# Include the subject code into the respective sets
xTrainS <- cbind(xTrain, subTrain)
xTestS <- cbind(xTest, subTest)

# Include the ySets into their respective sets
trainSet <- cbind(xTrainS, yTrain)
testSet <- cbind(xTestS, yTest)

# Merge the train and test sets (STEP 1 of the assignment)
fullSet <- rbind(trainSet, testSet)

# Rename the first variable names with the names given in the features file 
# (STEP 4 of the assignment)
names(fullSet) <- features[,2]

# Rename the last two columns added (Subject and activityCode)
names(fullSet)[(ncol(fullSet)-1):ncol(fullSet)] <- c("subjectNumber","activityDescription") 

# Convert the code of the activity into the name (STEP 3 of the assignment)
for(i in 1:nrow(fullSet))
     for(j in 1:nrow(activity))
          if(fullSet$activityDescription[i] == j)
               fullSet$activityName[i] <- activity[j,2] 
     
# Extract only the measurements on the mean and standard deviation for each measurement.
# (STEP 2 of the assignment) In this case I also extract the columns of the subject 
# and the activity code and description
index <- c(grep("mean[()]",names(fullSet)),grep("std[()]",names(fullSet)),(ncol(fullSet)-2):ncol(fullSet))
finalSet <- fullSet[,index]

# Second data set with the average of each variable for each activity and each subject.
# For that I will use the reshape2 package.
# (STEP 5 of the assignment)
library(reshape2)
meltData <- melt(finalSet, id = names(finalSet)[(ncol(finalSet)-2):ncol(finalSet)], 
                 measure.vars = names(finalSet[1:(ncol(finalSet)-3)]))
averageSet <- dcast(meltData, subjectNumber + activityName ~ variable, mean)
write.table(averageSet, "myTidyDataSet.txt", row.name=FALSE) 
