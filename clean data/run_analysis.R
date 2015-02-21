## 1. Loading and staging data

### Load and unzip data from web source
library(downloader)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="UCI_HAR_Dataset.zip", mode="wb") 
unzip ("UCI_HAR_Dataset.zip")

### Load test data sets.
testdataX<-read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, strip.white=TRUE)
testdataY<-read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)

### Load train data sets.
traindataX<-read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, strip.white=TRUE)
traindataY<-read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

### Load descriptive data files for subject idetification the labeling of features and activity columns.
subjectdata_test<-read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
subjectdata_train<-read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
featuredata<-read.table("UCI HAR Dataset/features.txt", header=FALSE, strip.white=TRUE)
activitydata<-read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, strip.white=TRUE)

### Read feature and activitiy lables.
featuredata$V2<-as.character(featuredata$V2)
activitydata$V2<-as.character(activitydata$V2)

### Apply column names to data frames. 
colnames(traindataX) <- featuredata$V2
colnames(traindataY) <-  c("Activities")
colnames(testdataX) <- featuredata$V2
colnames(testdataY) <- c("Activities")
colnames(subjectdata_test) <-  c("Subjects")
colnames(subjectdata_train) <-  c("Subjects")


## 2. Transforming and cleaning data

### Extract column names from data set which hold mean and standard deviation data.
ff<-featuredata[grepl("mean|std", featuredata$V2),]
#traindataX2<-traindataX[ , names(traindataX) %in% ff$V2]
#testdataX2<-testdataX[ , names(testdataX) %in% ff$V2]

### Combining data frames to form one data frame.
alldata<-cbind(rbind(testdataX,traindataX),rbind(testdataY,traindataY),rbind(subjectdata_test,subjectdata_train))

### Extract actual columns from data frame which conatin mean and standard deviation data.
alldata_temp<-alldata[ , names(alldata) %in% ff$V2]
alldata_temp2<-alldata[ , names(alldata) %in% c("Activities","Subjects")]
alldata<-cbind(alldata_temp,alldata_temp2)

### Function to get label from data frame.
get_label<-function(x){
    x<-activitydata$V2[[x]]
    x
}

### Change activity IDs with activities names from activities data frame.
alldata$Activities<-do.call(rbind, lapply(alldata$Activities,get_label))

### Aggregate data frame grouped by columns "Subjects" and "Activities".
alldata_tidy<-aggregate(alldata[ff$V2], 
                    by = alldata[c("Subjects","Activities")],
                    FUN=mean, na.rm=TRUE)

## 3. Output tidy data set

### Write resulting data frame to text file.
write.table(alldata_tidy, file = "./tidy_data.txt",row.name=FALSE)