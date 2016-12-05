# Getting-Cleaning-DataProject
This repository includes all the files required by the course project in the third course of the data science program

## Description of the script
As you can see, I have only submitted one script, in that file you'll find all the requirements for the course project. It could be summarized as it follows.

1. In the first part, I load all the needed files contained in the UCI HAR Dataset directory into R, putting each one a representative name to identify it.
2. Then I decided to include the columns for the activity and the subjects of the experiment into their respective datasets (train and test sets). In this case I used the cbind function.
3. After doing that, I merge the train and test sets (step 1 of the requeriments), in one set containing all the records associated with the experiment. In this case I used de rbind function.
4. Before doing the second step of the requeriments, I chose to put some significant names to the variables associated with the dataset. For that, I used the features file, that contains all the names of the variables examinated, accomplishing the fourth step of the requeriments.
5. Once I've put all the names to the different variables, I convert the code of the activity, to the activity description given in the activity_labels file, meeting the third requeriment. In this step of the convertion, I used a for cycle, in order to evaluate each cell individually, and therefore to assign each description individually. 
6. In this step, I extracted all the attributes that were either the mean or the standar deviation of the measures of the original dataset, I did that using the grep function and the concepts learned in the lecture of the regular expressions.
7. Finally, I used the reshape2 package, in order to accomplish the last requeriment of the script, using the melt function to create a new variable with all the names of the variables and their respective value. After that, I used the dcast function to create a new dataset with the average of all the diferent variables that I got in the previous step, grouped by subject and the activity. This dataset was saved using the write.table function, with the parameters described in the submission tab.

## Variable names
### The next is a brief description of the names used in my submission. (As I said, I used the names given by the file features, for that reason I'll put in here the same description which was given in the UCI HAR Dataset directory in the features_info file).

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
