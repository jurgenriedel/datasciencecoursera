# Code Book - Course Project "Clean Data"

This document describes the code inside the file "run_analysis.R".

The code is splitted in the following sections:

1. Downloading and loading data
2. Transforming and cleaning data
3. Output tidy data set to txt file

## 1. Loading and staging data

### Perquisites

1. Load R package "downloader"

### Load data files into R.

1. Load test data sets
2. Load train data sets
3. Load descriptive data files for subject idetification the labeling of features and activity columns.

### Add labels

1. Read feature and activitiy lables.
2. Apply column names to data frames. 

## 2. Transforming and cleaning data

1. Combining data frames from test data files and train data files to form one data frame. 
2. Extract column names from data set which hold mean and standard deviation data. Here, the choice was made to look for          variables which names contain "mean" or "std".
3. Change activity IDs with activities names from activities data frame.
4. Aggregate data frame grouped by columns "Subjects" and "Activities".

## 3. Output tidy data set

### Write resulting data frame to text file.

The final data frame has the following format:

  Subjects Activities tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
  
1        1     LAYING         0.2215982       -0.04051395        -0.1132036

2        2     LAYING         0.2813734       -0.01815874        -0.1072456

3        3     LAYING         0.2755169       -0.01895568        -0.1013005

Write data frame to the output file = "tidy_data.txt" in current working directory.

The output file "tidy_data.txt" contains the folowwing fields:

No  Field name

1.   Subjects

2.   Activities

3   tBodyAcc-mean()-X

4   tBodyAcc-mean()-Y

5   tBodyAcc-mean()-Z

6   tBodyAcc-std()-X

7   tBodyAcc-std()-Y

8   tBodyAcc-std()-Z

9   tGravityAcc-mean()-X

10  tGravityAcc-mean()-Y

11  tGravityAcc-mean()-Z

12  tGravityAcc-std()-X

13  tGravityAcc-std()-Y

14  tGravityAcc-std()-Z

15  tBodyAccJerk-mean()-X

16  tBodyAccJerk-mean()-Y

17  tBodyAccJerk-mean()-Z

18  tBodyAccJerk-std()-X

19  tBodyAccJerk-std()-Y

20  tBodyAccJerk-std()-Z

21  1tBodyGyro-mean()-X

22  tBodyGyro-mean()-Y

23  tBodyGyro-mean()-Z

24  tBodyGyro-std()-X

25  tBodyGyro-std()-Y

26  tBodyGyro-std()-Z

27  tBodyGyroJerk-mean()-X

28  tBodyGyroJerk-mean()-Y

29  tBodyGyroJerk-mean()-Z

30  tBodyGyroJerk-std()-X

31  tBodyGyroJerk-std()-Y

32  tBodyGyroJerk-std()-Z

33  tBodyAccMag-mean()

34  tBodyAccMag-std()

35  tGravityAccMag-mean()

36  tGravityAccMag-std()

37  tBodyAccJerkMag-mean()

38  tBodyAccJerkMag-std()

39  tBodyGyroMag-mean()

40  tBodyGyroMag-std()

41  tBodyGyroJerkMag-mean()

42  tBodyGyroJerkMag-std()

43  fBodyAcc-mean()-X

44  fBodyAcc-mean()-Y

45  fBodyAcc-mean()-Z

46  fBodyAcc-std()-X

47  fBodyAcc-std()-Y

48  fBodyAcc-std()-Z

49  fBodyAcc-meanFreq()-X

50  fBodyAcc-meanFreq()-Y

51  fBodyAcc-meanFreq()-Z

52  fBodyAccJerk-mean()-X

53  fBodyAccJerk-mean()-Y

54  fBodyAccJerk-mean()-Z

55  fBodyAccJerk-std()-X

56  fBodyAccJerk-std()-Y

57  fBodyAccJerk-std()-Z

58  fBodyAccJerk-meanFreq()-X

59  fBodyAccJerk-meanFreq()-Y

60  fBodyAccJerk-meanFreq()-Z

61  fBodyGyro-mean()-X

62  fBodyGyro-mean()-Y

63  fBodyGyro-mean()-Z

64  fBodyGyro-std()-X

65  fBodyGyro-std()-Y

66  fBodyGyro-std()-Z

67  fBodyGyro-meanFreq()-X

68  fBodyGyro-meanFreq()-Y

69  fBodyGyro-meanFreq()-Z

70  fBodyAccMag-mean()

71  fBodyAccMag-std()

72  fBodyAccMag-meanFreq()

73  fBodyBodyAccJerkMag-mean()

74  fBodyBodyAccJerkMag-std()

75  fBodyBodyAccJerkMag-meanFreq()

76  fBodyBodyGyroMag-mean()

77  fBodyBodyGyroMag-std()

78  fBodyBodyGyroMag-meanFreq()

79  fBodyBodyGyroJerkMag-mean()

80  fBodyBodyGyroJerkMag-std()

81  fBodyBodyGyroJerkMag-meanFreq()
