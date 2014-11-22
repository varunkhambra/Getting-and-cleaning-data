Getting-and-cleaning-data
=========================

Peer assesment

cbind() is used to attach the subject and activity data to the train and test data. Then rbind() is used to join the train and test data together.

The grep() function is used to extract columns with "mean()" or "std()" in them

The merge() function is used to join the activity labels on to the main dataset to give them descriptive names

Variable names are read from features.txt and used names() to assign them to the dataset

The aggregate() function is used to create a tidy dataset with the average for each activity and subject. It's tidy because it has one observation per row and one variable per column.
