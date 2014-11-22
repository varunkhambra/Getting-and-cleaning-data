## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##read data
trainData<-read.table("UCI HAR Dataset/train/X_train.txt")
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivity<-read.table("UCI HAR Dataset/train/Y_train.txt")
combinedtrainData<-cbind(trainData,trainSubject,trainActivity)


testData<-read.table("UCI HAR Dataset/test/X_test.txt")
testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt")
testActivity<-read.table("UCI HAR Dataset/test/Y_test.txt")
combinedtestData<-cbind(testData,testSubject,testActivity)

##combine data
combinedData<-rbind(combinedtrainData,combinedtestData)

##read features
features<-read.table("UCI HAR Dataset/features.txt")
colNames<-c(as.character(features[,2]),"Activity","Subject")
names(combinedData)<-colNames

##extract the measurements on the mean and standard deviation for each measurement

colsExtract<-grep("[-]std[(][)]|[-]mean[(][)]",colNames)
combinedData<-combinedData[,c(colsExtract,562:563)]

##Uses descriptive activity names to name the activities 
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
names(activityLabels)<-c("Activity","ActivityName")
mergeData<-merge(combinedData,activityLabels,sort=F)

##Create a tidy data set. 
aggregateData<-aggregate(.~Subject+ActivityName, FUN=mean, data=mergeData)
write.table(aggregateData,file="tidyData.txt",row.name=FALSE)
