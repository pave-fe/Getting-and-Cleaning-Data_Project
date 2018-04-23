# Codebook for Getting and Cleaning Data Week 4 

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Additional information on the study can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables and attributes
```
"subjectID"  ID number of the subject with a range of 1-30                                                      
"activityType"   The six different activity types measured in the study.  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
```
### The following variables are descriptively lableled and represent the measurements taken during the experiment.  
```
"TimeDomain.BodyAcceleration-Mean()-X"                             
"TimeDomain.BodyAcceleration-Mean()-Y"                             
"TimeDomain.BodyAcceleration-Mean()-Z"       
                      
"TimeDomain.BodyAcceleration-StandardDeviation()-X"                
"TimeDomain.BodyAcceleration-StandardDeviation()-Y"                
"TimeDomain.BodyAcceleration-StandardDeviation()-Z"   
             
"TimeDomain.GravityAcceleration-Mean()-X"                          
"TimeDomain.GravityAcceleration-Mean()-Y"                          
"TimeDomain.GravityAcceleration-Mean()-Z"           
               
"TimeDomain.GravityAcceleration-StandardDeviation()-X"             
"TimeDomain.GravityAcceleration-StandardDeviation()-Y"             
"TimeDomain.GravityAcceleration-StandardDeviation()-Z"  
           
"TimeDomain.BodyAccelerationJerk-Mean()-X"                         
"TimeDomain.BodyAccelerationJerk-Mean()-Y"                         
"TimeDomain.BodyAccelerationJerk-Mean()-Z"    
                     
"TimeDomain.BodyAccelerationJerk-StandardDeviation()-X"            
"TimeDomain.BodyAccelerationJerk-StandardDeviation()-Y"            
"TimeDomain.BodyAccelerationJerk-StandardDeviation()-Z"  
          
"TimeDomain.BodyGyro-Mean()-X"                                     
"TimeDomain.BodyGyro-Mean()-Y"                                     
"TimeDomain.BodyGyro-Mean()-Z"        
                             
"TimeDomain.BodyGyro-StandardDeviation()-X"                        
"TimeDomain.BodyGyro-StandardDeviation()-Y"                        
"TimeDomain.BodyGyro-StandardDeviation()-Z" 
                       
"TimeDomain.BodyGyroJerk-Mean()-X"                                 
"TimeDomain.BodyGyroJerk-Mean()-Y"                                 
"TimeDomain.BodyGyroJerk-Mean()-Z"  
                               
"TimeDomain.BodyGyroJerk-StandardDeviation()-X"                    
"TimeDomain.BodyGyroJerk-StandardDeviation()-Y"                    
"TimeDomain.BodyGyroJerk-StandardDeviation()-Z"  
                  
"TimeDomain.BodyAccelerationMagnitude-Mean()"                      
"TimeDomain.BodyAccelerationMagnitude-StandardDeviation()"  
       
"TimeDomain.GravityAccelerationMagnitude-Mean()"                   
"TimeDomain.GravityAccelerationMagnitude-StandardDeviation()" 
     
"TimeDomain.BodyAccelerationJerkMagnitude-Mean()"                  
"TimeDomain.BodyAccelerationJerkMagnitude-StandardDeviation()" 
    
"TimeDomain.BodyGyroMagnitude-Mean()"                              
"TimeDomain.BodyGyroMagnitude-StandardDeviation()" 
                
"TimeDomain.BodyGyroJerkMagnitude-Mean()"                          
"TimeDomain.BodyGyroJerkMagnitude-StandardDeviation()" 
            
"FrequencyDomain.BodyAcceleration-Mean()-X"                        
"FrequencyDomain.BodyAcceleration-Mean()-Y"                        
"FrequencyDomain.BodyAcceleration-Mean()-Z"      
                  
"FrequencyDomain.BodyAcceleration-StandardDeviation()-X"           
"FrequencyDomain.BodyAcceleration-StandardDeviation()-Y"           
"FrequencyDomain.BodyAcceleration-StandardDeviation()-Z"   
        
"FrequencyDomain.BodyAcceleration-MeanFrequency()-X"               
"FrequencyDomain.BodyAcceleration-MeanFrequency()-Y"               
"FrequencyDomain.BodyAcceleration-MeanFrequency()-Z"   
            
"FrequencyDomain.BodyAccelerationJerk-Mean()-X"                    
"FrequencyDomain.BodyAccelerationJerk-Mean()-Y"                    
"FrequencyDomain.BodyAccelerationJerk-Mean()-Z"      
              
"FrequencyDomain.BodyAccelerationJerk-StandardDeviation()-X"       
"FrequencyDomain.BodyAccelerationJerk-StandardDeviation()-Y"       
"FrequencyDomain.BodyAccelerationJerk-StandardDeviation()-Z"  
     
"FrequencyDomain.BodyAccelerationJerk-MeanFrequency()-X"           
"FrequencyDomain.BodyAccelerationJerk-MeanFrequency()-Y"           
"FrequencyDomain.BodyAccelerationJerk-MeanFrequency()-Z" 
          
"FrequencyDomain.BodyGyro-Mean()-X"                                
"FrequencyDomain.BodyGyro-Mean()-Y"                                
"FrequencyDomain.BodyGyro-Mean()-Z"                                

"FrequencyDomain.BodyGyro-StandardDeviation()-X"                   
"FrequencyDomain.BodyGyro-StandardDeviation()-Y"                   
"FrequencyDomain.BodyGyro-StandardDeviation()-Z"  
                 
"FrequencyDomain.BodyGyro-MeanFrequency()-X"                       
"FrequencyDomain.BodyGyro-MeanFrequency()-Y"                       
"FrequencyDomain.BodyGyro-MeanFrequency()-Z"    
                   
"FrequencyDomain.BodyAccelerationMagnitude-Mean()"                 
"FrequencyDomain.BodyAccelerationMagnitude-StandardDeviation()"    
"FrequencyDomain.BodyAccelerationMagnitude-MeanFrequency()"  
      
"FrequencyDomain.BodyAccelerationJerkMagnitude-Mean()"             
"FrequencyDomain.BodyAccelerationJerkMagnitude-StandardDeviation()"
"FrequencyDomain.BodyAccelerationJerkMagnitude-MeanFrequency()"  
  
"FrequencyDomain.BodyGyroMagnitude-Mean()"                         
"FrequencyDomain.BodyGyroMagnitude-StandardDeviation()"            
"FrequencyDomain.BodyGyroMagnitude-MeanFrequency()"  
              
"FrequencyDomain.BodyGyroJerkMagnitude-Mean()"                     
"FrequencyDomain.BodyGyroJerkMagnitude-StandardDeviation()"        
"FrequencyDomain.BodyGyroJerkMagnitude-MeanFrequency()" 
```