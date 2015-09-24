# README
xvshiting  
2015年9月24日  
##1.merging training data and Test data Together
Library "dplyr"

```r
   library(dplyr)
```
###*Read* **feature** from **features.txt**,change factor to charachter

```r
    feature<-read.csv("features.txt",header = FALSE,sep = " ")
    feature<-feature[,2]            #提取特征名称(factor)
    feature<-as.character(feature)  #charachter
    head(feature,10)
```

```
##  [1] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"
##  [4] "tBodyAcc-std()-X"  "tBodyAcc-std()-Y"  "tBodyAcc-std()-Z" 
##  [7] "tBodyAcc-mad()-X"  "tBodyAcc-mad()-Y"  "tBodyAcc-mad()-Z" 
## [10] "tBodyAcc-max()-X"
```
###Build test data
 
 In this process,we put all the data in test(dir),like:X_test,y_test,subject_test,together!Feature will be the X_test's label!

```r
    subject_test<-read.csv("test/subject_test.txt",header = FALSE)# subject
names(subject_test)<-"subject_ID"
X_test<-read.csv("test/X_test.txt",sep="",header = FALSE)#collected data
X_test<-X_test[,!is.na(X_test[1,])]
y_test<-read.csv("test/y_test.txt",header=FALSE)#label_activity
names(X_test)<-feature  #对应的列名
names(y_test)<-"activity_label"
dat_test<-data.frame(subject_test,y_test,X_test)#完整的test数据
names(dat_test)
```

```
##   [1] "subject_ID"                          
##   [2] "activity_label"                      
##   [3] "tBodyAcc.mean...X"                   
##   [4] "tBodyAcc.mean...Y"                   
##   [5] "tBodyAcc.mean...Z"                   
##   [6] "tBodyAcc.std...X"                    
##   [7] "tBodyAcc.std...Y"                    
##   [8] "tBodyAcc.std...Z"                    
##   [9] "tBodyAcc.mad...X"                    
##  [10] "tBodyAcc.mad...Y"                    
##  [11] "tBodyAcc.mad...Z"                    
##  [12] "tBodyAcc.max...X"                    
##  [13] "tBodyAcc.max...Y"                    
##  [14] "tBodyAcc.max...Z"                    
##  [15] "tBodyAcc.min...X"                    
##  [16] "tBodyAcc.min...Y"                    
##  [17] "tBodyAcc.min...Z"                    
##  [18] "tBodyAcc.sma.."                      
##  [19] "tBodyAcc.energy...X"                 
##  [20] "tBodyAcc.energy...Y"                 
##  [21] "tBodyAcc.energy...Z"                 
##  [22] "tBodyAcc.iqr...X"                    
##  [23] "tBodyAcc.iqr...Y"                    
##  [24] "tBodyAcc.iqr...Z"                    
##  [25] "tBodyAcc.entropy...X"                
##  [26] "tBodyAcc.entropy...Y"                
##  [27] "tBodyAcc.entropy...Z"                
##  [28] "tBodyAcc.arCoeff...X.1"              
##  [29] "tBodyAcc.arCoeff...X.2"              
##  [30] "tBodyAcc.arCoeff...X.3"              
##  [31] "tBodyAcc.arCoeff...X.4"              
##  [32] "tBodyAcc.arCoeff...Y.1"              
##  [33] "tBodyAcc.arCoeff...Y.2"              
##  [34] "tBodyAcc.arCoeff...Y.3"              
##  [35] "tBodyAcc.arCoeff...Y.4"              
##  [36] "tBodyAcc.arCoeff...Z.1"              
##  [37] "tBodyAcc.arCoeff...Z.2"              
##  [38] "tBodyAcc.arCoeff...Z.3"              
##  [39] "tBodyAcc.arCoeff...Z.4"              
##  [40] "tBodyAcc.correlation...X.Y"          
##  [41] "tBodyAcc.correlation...X.Z"          
##  [42] "tBodyAcc.correlation...Y.Z"          
##  [43] "tGravityAcc.mean...X"                
##  [44] "tGravityAcc.mean...Y"                
##  [45] "tGravityAcc.mean...Z"                
##  [46] "tGravityAcc.std...X"                 
##  [47] "tGravityAcc.std...Y"                 
##  [48] "tGravityAcc.std...Z"                 
##  [49] "tGravityAcc.mad...X"                 
##  [50] "tGravityAcc.mad...Y"                 
##  [51] "tGravityAcc.mad...Z"                 
##  [52] "tGravityAcc.max...X"                 
##  [53] "tGravityAcc.max...Y"                 
##  [54] "tGravityAcc.max...Z"                 
##  [55] "tGravityAcc.min...X"                 
##  [56] "tGravityAcc.min...Y"                 
##  [57] "tGravityAcc.min...Z"                 
##  [58] "tGravityAcc.sma.."                   
##  [59] "tGravityAcc.energy...X"              
##  [60] "tGravityAcc.energy...Y"              
##  [61] "tGravityAcc.energy...Z"              
##  [62] "tGravityAcc.iqr...X"                 
##  [63] "tGravityAcc.iqr...Y"                 
##  [64] "tGravityAcc.iqr...Z"                 
##  [65] "tGravityAcc.entropy...X"             
##  [66] "tGravityAcc.entropy...Y"             
##  [67] "tGravityAcc.entropy...Z"             
##  [68] "tGravityAcc.arCoeff...X.1"           
##  [69] "tGravityAcc.arCoeff...X.2"           
##  [70] "tGravityAcc.arCoeff...X.3"           
##  [71] "tGravityAcc.arCoeff...X.4"           
##  [72] "tGravityAcc.arCoeff...Y.1"           
##  [73] "tGravityAcc.arCoeff...Y.2"           
##  [74] "tGravityAcc.arCoeff...Y.3"           
##  [75] "tGravityAcc.arCoeff...Y.4"           
##  [76] "tGravityAcc.arCoeff...Z.1"           
##  [77] "tGravityAcc.arCoeff...Z.2"           
##  [78] "tGravityAcc.arCoeff...Z.3"           
##  [79] "tGravityAcc.arCoeff...Z.4"           
##  [80] "tGravityAcc.correlation...X.Y"       
##  [81] "tGravityAcc.correlation...X.Z"       
##  [82] "tGravityAcc.correlation...Y.Z"       
##  [83] "tBodyAccJerk.mean...X"               
##  [84] "tBodyAccJerk.mean...Y"               
##  [85] "tBodyAccJerk.mean...Z"               
##  [86] "tBodyAccJerk.std...X"                
##  [87] "tBodyAccJerk.std...Y"                
##  [88] "tBodyAccJerk.std...Z"                
##  [89] "tBodyAccJerk.mad...X"                
##  [90] "tBodyAccJerk.mad...Y"                
##  [91] "tBodyAccJerk.mad...Z"                
##  [92] "tBodyAccJerk.max...X"                
##  [93] "tBodyAccJerk.max...Y"                
##  [94] "tBodyAccJerk.max...Z"                
##  [95] "tBodyAccJerk.min...X"                
##  [96] "tBodyAccJerk.min...Y"                
##  [97] "tBodyAccJerk.min...Z"                
##  [98] "tBodyAccJerk.sma.."                  
##  [99] "tBodyAccJerk.energy...X"             
## [100] "tBodyAccJerk.energy...Y"             
## [101] "tBodyAccJerk.energy...Z"             
## [102] "tBodyAccJerk.iqr...X"                
## [103] "tBodyAccJerk.iqr...Y"                
## [104] "tBodyAccJerk.iqr...Z"                
## [105] "tBodyAccJerk.entropy...X"            
## [106] "tBodyAccJerk.entropy...Y"            
## [107] "tBodyAccJerk.entropy...Z"            
## [108] "tBodyAccJerk.arCoeff...X.1"          
## [109] "tBodyAccJerk.arCoeff...X.2"          
## [110] "tBodyAccJerk.arCoeff...X.3"          
## [111] "tBodyAccJerk.arCoeff...X.4"          
## [112] "tBodyAccJerk.arCoeff...Y.1"          
## [113] "tBodyAccJerk.arCoeff...Y.2"          
## [114] "tBodyAccJerk.arCoeff...Y.3"          
## [115] "tBodyAccJerk.arCoeff...Y.4"          
## [116] "tBodyAccJerk.arCoeff...Z.1"          
## [117] "tBodyAccJerk.arCoeff...Z.2"          
## [118] "tBodyAccJerk.arCoeff...Z.3"          
## [119] "tBodyAccJerk.arCoeff...Z.4"          
## [120] "tBodyAccJerk.correlation...X.Y"      
## [121] "tBodyAccJerk.correlation...X.Z"      
## [122] "tBodyAccJerk.correlation...Y.Z"      
## [123] "tBodyGyro.mean...X"                  
## [124] "tBodyGyro.mean...Y"                  
## [125] "tBodyGyro.mean...Z"                  
## [126] "tBodyGyro.std...X"                   
## [127] "tBodyGyro.std...Y"                   
## [128] "tBodyGyro.std...Z"                   
## [129] "tBodyGyro.mad...X"                   
## [130] "tBodyGyro.mad...Y"                   
## [131] "tBodyGyro.mad...Z"                   
## [132] "tBodyGyro.max...X"                   
## [133] "tBodyGyro.max...Y"                   
## [134] "tBodyGyro.max...Z"                   
## [135] "tBodyGyro.min...X"                   
## [136] "tBodyGyro.min...Y"                   
## [137] "tBodyGyro.min...Z"                   
## [138] "tBodyGyro.sma.."                     
## [139] "tBodyGyro.energy...X"                
## [140] "tBodyGyro.energy...Y"                
## [141] "tBodyGyro.energy...Z"                
## [142] "tBodyGyro.iqr...X"                   
## [143] "tBodyGyro.iqr...Y"                   
## [144] "tBodyGyro.iqr...Z"                   
## [145] "tBodyGyro.entropy...X"               
## [146] "tBodyGyro.entropy...Y"               
## [147] "tBodyGyro.entropy...Z"               
## [148] "tBodyGyro.arCoeff...X.1"             
## [149] "tBodyGyro.arCoeff...X.2"             
## [150] "tBodyGyro.arCoeff...X.3"             
## [151] "tBodyGyro.arCoeff...X.4"             
## [152] "tBodyGyro.arCoeff...Y.1"             
## [153] "tBodyGyro.arCoeff...Y.2"             
## [154] "tBodyGyro.arCoeff...Y.3"             
## [155] "tBodyGyro.arCoeff...Y.4"             
## [156] "tBodyGyro.arCoeff...Z.1"             
## [157] "tBodyGyro.arCoeff...Z.2"             
## [158] "tBodyGyro.arCoeff...Z.3"             
## [159] "tBodyGyro.arCoeff...Z.4"             
## [160] "tBodyGyro.correlation...X.Y"         
## [161] "tBodyGyro.correlation...X.Z"         
## [162] "tBodyGyro.correlation...Y.Z"         
## [163] "tBodyGyroJerk.mean...X"              
## [164] "tBodyGyroJerk.mean...Y"              
## [165] "tBodyGyroJerk.mean...Z"              
## [166] "tBodyGyroJerk.std...X"               
## [167] "tBodyGyroJerk.std...Y"               
## [168] "tBodyGyroJerk.std...Z"               
## [169] "tBodyGyroJerk.mad...X"               
## [170] "tBodyGyroJerk.mad...Y"               
## [171] "tBodyGyroJerk.mad...Z"               
## [172] "tBodyGyroJerk.max...X"               
## [173] "tBodyGyroJerk.max...Y"               
## [174] "tBodyGyroJerk.max...Z"               
## [175] "tBodyGyroJerk.min...X"               
## [176] "tBodyGyroJerk.min...Y"               
## [177] "tBodyGyroJerk.min...Z"               
## [178] "tBodyGyroJerk.sma.."                 
## [179] "tBodyGyroJerk.energy...X"            
## [180] "tBodyGyroJerk.energy...Y"            
## [181] "tBodyGyroJerk.energy...Z"            
## [182] "tBodyGyroJerk.iqr...X"               
## [183] "tBodyGyroJerk.iqr...Y"               
## [184] "tBodyGyroJerk.iqr...Z"               
## [185] "tBodyGyroJerk.entropy...X"           
## [186] "tBodyGyroJerk.entropy...Y"           
## [187] "tBodyGyroJerk.entropy...Z"           
## [188] "tBodyGyroJerk.arCoeff...X.1"         
## [189] "tBodyGyroJerk.arCoeff...X.2"         
## [190] "tBodyGyroJerk.arCoeff...X.3"         
## [191] "tBodyGyroJerk.arCoeff...X.4"         
## [192] "tBodyGyroJerk.arCoeff...Y.1"         
## [193] "tBodyGyroJerk.arCoeff...Y.2"         
## [194] "tBodyGyroJerk.arCoeff...Y.3"         
## [195] "tBodyGyroJerk.arCoeff...Y.4"         
## [196] "tBodyGyroJerk.arCoeff...Z.1"         
## [197] "tBodyGyroJerk.arCoeff...Z.2"         
## [198] "tBodyGyroJerk.arCoeff...Z.3"         
## [199] "tBodyGyroJerk.arCoeff...Z.4"         
## [200] "tBodyGyroJerk.correlation...X.Y"     
## [201] "tBodyGyroJerk.correlation...X.Z"     
## [202] "tBodyGyroJerk.correlation...Y.Z"     
## [203] "tBodyAccMag.mean.."                  
## [204] "tBodyAccMag.std.."                   
## [205] "tBodyAccMag.mad.."                   
## [206] "tBodyAccMag.max.."                   
## [207] "tBodyAccMag.min.."                   
## [208] "tBodyAccMag.sma.."                   
## [209] "tBodyAccMag.energy.."                
## [210] "tBodyAccMag.iqr.."                   
## [211] "tBodyAccMag.entropy.."               
## [212] "tBodyAccMag.arCoeff..1"              
## [213] "tBodyAccMag.arCoeff..2"              
## [214] "tBodyAccMag.arCoeff..3"              
## [215] "tBodyAccMag.arCoeff..4"              
## [216] "tGravityAccMag.mean.."               
## [217] "tGravityAccMag.std.."                
## [218] "tGravityAccMag.mad.."                
## [219] "tGravityAccMag.max.."                
## [220] "tGravityAccMag.min.."                
## [221] "tGravityAccMag.sma.."                
## [222] "tGravityAccMag.energy.."             
## [223] "tGravityAccMag.iqr.."                
## [224] "tGravityAccMag.entropy.."            
## [225] "tGravityAccMag.arCoeff..1"           
## [226] "tGravityAccMag.arCoeff..2"           
## [227] "tGravityAccMag.arCoeff..3"           
## [228] "tGravityAccMag.arCoeff..4"           
## [229] "tBodyAccJerkMag.mean.."              
## [230] "tBodyAccJerkMag.std.."               
## [231] "tBodyAccJerkMag.mad.."               
## [232] "tBodyAccJerkMag.max.."               
## [233] "tBodyAccJerkMag.min.."               
## [234] "tBodyAccJerkMag.sma.."               
## [235] "tBodyAccJerkMag.energy.."            
## [236] "tBodyAccJerkMag.iqr.."               
## [237] "tBodyAccJerkMag.entropy.."           
## [238] "tBodyAccJerkMag.arCoeff..1"          
## [239] "tBodyAccJerkMag.arCoeff..2"          
## [240] "tBodyAccJerkMag.arCoeff..3"          
## [241] "tBodyAccJerkMag.arCoeff..4"          
## [242] "tBodyGyroMag.mean.."                 
## [243] "tBodyGyroMag.std.."                  
## [244] "tBodyGyroMag.mad.."                  
## [245] "tBodyGyroMag.max.."                  
## [246] "tBodyGyroMag.min.."                  
## [247] "tBodyGyroMag.sma.."                  
## [248] "tBodyGyroMag.energy.."               
## [249] "tBodyGyroMag.iqr.."                  
## [250] "tBodyGyroMag.entropy.."              
## [251] "tBodyGyroMag.arCoeff..1"             
## [252] "tBodyGyroMag.arCoeff..2"             
## [253] "tBodyGyroMag.arCoeff..3"             
## [254] "tBodyGyroMag.arCoeff..4"             
## [255] "tBodyGyroJerkMag.mean.."             
## [256] "tBodyGyroJerkMag.std.."              
## [257] "tBodyGyroJerkMag.mad.."              
## [258] "tBodyGyroJerkMag.max.."              
## [259] "tBodyGyroJerkMag.min.."              
## [260] "tBodyGyroJerkMag.sma.."              
## [261] "tBodyGyroJerkMag.energy.."           
## [262] "tBodyGyroJerkMag.iqr.."              
## [263] "tBodyGyroJerkMag.entropy.."          
## [264] "tBodyGyroJerkMag.arCoeff..1"         
## [265] "tBodyGyroJerkMag.arCoeff..2"         
## [266] "tBodyGyroJerkMag.arCoeff..3"         
## [267] "tBodyGyroJerkMag.arCoeff..4"         
## [268] "fBodyAcc.mean...X"                   
## [269] "fBodyAcc.mean...Y"                   
## [270] "fBodyAcc.mean...Z"                   
## [271] "fBodyAcc.std...X"                    
## [272] "fBodyAcc.std...Y"                    
## [273] "fBodyAcc.std...Z"                    
## [274] "fBodyAcc.mad...X"                    
## [275] "fBodyAcc.mad...Y"                    
## [276] "fBodyAcc.mad...Z"                    
## [277] "fBodyAcc.max...X"                    
## [278] "fBodyAcc.max...Y"                    
## [279] "fBodyAcc.max...Z"                    
## [280] "fBodyAcc.min...X"                    
## [281] "fBodyAcc.min...Y"                    
## [282] "fBodyAcc.min...Z"                    
## [283] "fBodyAcc.sma.."                      
## [284] "fBodyAcc.energy...X"                 
## [285] "fBodyAcc.energy...Y"                 
## [286] "fBodyAcc.energy...Z"                 
## [287] "fBodyAcc.iqr...X"                    
## [288] "fBodyAcc.iqr...Y"                    
## [289] "fBodyAcc.iqr...Z"                    
## [290] "fBodyAcc.entropy...X"                
## [291] "fBodyAcc.entropy...Y"                
## [292] "fBodyAcc.entropy...Z"                
## [293] "fBodyAcc.maxInds.X"                  
## [294] "fBodyAcc.maxInds.Y"                  
## [295] "fBodyAcc.maxInds.Z"                  
## [296] "fBodyAcc.meanFreq...X"               
## [297] "fBodyAcc.meanFreq...Y"               
## [298] "fBodyAcc.meanFreq...Z"               
## [299] "fBodyAcc.skewness...X"               
## [300] "fBodyAcc.kurtosis...X"               
## [301] "fBodyAcc.skewness...Y"               
## [302] "fBodyAcc.kurtosis...Y"               
## [303] "fBodyAcc.skewness...Z"               
## [304] "fBodyAcc.kurtosis...Z"               
## [305] "fBodyAcc.bandsEnergy...1.8"          
## [306] "fBodyAcc.bandsEnergy...9.16"         
## [307] "fBodyAcc.bandsEnergy...17.24"        
## [308] "fBodyAcc.bandsEnergy...25.32"        
## [309] "fBodyAcc.bandsEnergy...33.40"        
## [310] "fBodyAcc.bandsEnergy...41.48"        
## [311] "fBodyAcc.bandsEnergy...49.56"        
## [312] "fBodyAcc.bandsEnergy...57.64"        
## [313] "fBodyAcc.bandsEnergy...1.16"         
## [314] "fBodyAcc.bandsEnergy...17.32"        
## [315] "fBodyAcc.bandsEnergy...33.48"        
## [316] "fBodyAcc.bandsEnergy...49.64"        
## [317] "fBodyAcc.bandsEnergy...1.24"         
## [318] "fBodyAcc.bandsEnergy...25.48"        
## [319] "fBodyAcc.bandsEnergy...1.8.1"        
## [320] "fBodyAcc.bandsEnergy...9.16.1"       
## [321] "fBodyAcc.bandsEnergy...17.24.1"      
## [322] "fBodyAcc.bandsEnergy...25.32.1"      
## [323] "fBodyAcc.bandsEnergy...33.40.1"      
## [324] "fBodyAcc.bandsEnergy...41.48.1"      
## [325] "fBodyAcc.bandsEnergy...49.56.1"      
## [326] "fBodyAcc.bandsEnergy...57.64.1"      
## [327] "fBodyAcc.bandsEnergy...1.16.1"       
## [328] "fBodyAcc.bandsEnergy...17.32.1"      
## [329] "fBodyAcc.bandsEnergy...33.48.1"      
## [330] "fBodyAcc.bandsEnergy...49.64.1"      
## [331] "fBodyAcc.bandsEnergy...1.24.1"       
## [332] "fBodyAcc.bandsEnergy...25.48.1"      
## [333] "fBodyAcc.bandsEnergy...1.8.2"        
## [334] "fBodyAcc.bandsEnergy...9.16.2"       
## [335] "fBodyAcc.bandsEnergy...17.24.2"      
## [336] "fBodyAcc.bandsEnergy...25.32.2"      
## [337] "fBodyAcc.bandsEnergy...33.40.2"      
## [338] "fBodyAcc.bandsEnergy...41.48.2"      
## [339] "fBodyAcc.bandsEnergy...49.56.2"      
## [340] "fBodyAcc.bandsEnergy...57.64.2"      
## [341] "fBodyAcc.bandsEnergy...1.16.2"       
## [342] "fBodyAcc.bandsEnergy...17.32.2"      
## [343] "fBodyAcc.bandsEnergy...33.48.2"      
## [344] "fBodyAcc.bandsEnergy...49.64.2"      
## [345] "fBodyAcc.bandsEnergy...1.24.2"       
## [346] "fBodyAcc.bandsEnergy...25.48.2"      
## [347] "fBodyAccJerk.mean...X"               
## [348] "fBodyAccJerk.mean...Y"               
## [349] "fBodyAccJerk.mean...Z"               
## [350] "fBodyAccJerk.std...X"                
## [351] "fBodyAccJerk.std...Y"                
## [352] "fBodyAccJerk.std...Z"                
## [353] "fBodyAccJerk.mad...X"                
## [354] "fBodyAccJerk.mad...Y"                
## [355] "fBodyAccJerk.mad...Z"                
## [356] "fBodyAccJerk.max...X"                
## [357] "fBodyAccJerk.max...Y"                
## [358] "fBodyAccJerk.max...Z"                
## [359] "fBodyAccJerk.min...X"                
## [360] "fBodyAccJerk.min...Y"                
## [361] "fBodyAccJerk.min...Z"                
## [362] "fBodyAccJerk.sma.."                  
## [363] "fBodyAccJerk.energy...X"             
## [364] "fBodyAccJerk.energy...Y"             
## [365] "fBodyAccJerk.energy...Z"             
## [366] "fBodyAccJerk.iqr...X"                
## [367] "fBodyAccJerk.iqr...Y"                
## [368] "fBodyAccJerk.iqr...Z"                
## [369] "fBodyAccJerk.entropy...X"            
## [370] "fBodyAccJerk.entropy...Y"            
## [371] "fBodyAccJerk.entropy...Z"            
## [372] "fBodyAccJerk.maxInds.X"              
## [373] "fBodyAccJerk.maxInds.Y"              
## [374] "fBodyAccJerk.maxInds.Z"              
## [375] "fBodyAccJerk.meanFreq...X"           
## [376] "fBodyAccJerk.meanFreq...Y"           
## [377] "fBodyAccJerk.meanFreq...Z"           
## [378] "fBodyAccJerk.skewness...X"           
## [379] "fBodyAccJerk.kurtosis...X"           
## [380] "fBodyAccJerk.skewness...Y"           
## [381] "fBodyAccJerk.kurtosis...Y"           
## [382] "fBodyAccJerk.skewness...Z"           
## [383] "fBodyAccJerk.kurtosis...Z"           
## [384] "fBodyAccJerk.bandsEnergy...1.8"      
## [385] "fBodyAccJerk.bandsEnergy...9.16"     
## [386] "fBodyAccJerk.bandsEnergy...17.24"    
## [387] "fBodyAccJerk.bandsEnergy...25.32"    
## [388] "fBodyAccJerk.bandsEnergy...33.40"    
## [389] "fBodyAccJerk.bandsEnergy...41.48"    
## [390] "fBodyAccJerk.bandsEnergy...49.56"    
## [391] "fBodyAccJerk.bandsEnergy...57.64"    
## [392] "fBodyAccJerk.bandsEnergy...1.16"     
## [393] "fBodyAccJerk.bandsEnergy...17.32"    
## [394] "fBodyAccJerk.bandsEnergy...33.48"    
## [395] "fBodyAccJerk.bandsEnergy...49.64"    
## [396] "fBodyAccJerk.bandsEnergy...1.24"     
## [397] "fBodyAccJerk.bandsEnergy...25.48"    
## [398] "fBodyAccJerk.bandsEnergy...1.8.1"    
## [399] "fBodyAccJerk.bandsEnergy...9.16.1"   
## [400] "fBodyAccJerk.bandsEnergy...17.24.1"  
## [401] "fBodyAccJerk.bandsEnergy...25.32.1"  
## [402] "fBodyAccJerk.bandsEnergy...33.40.1"  
## [403] "fBodyAccJerk.bandsEnergy...41.48.1"  
## [404] "fBodyAccJerk.bandsEnergy...49.56.1"  
## [405] "fBodyAccJerk.bandsEnergy...57.64.1"  
## [406] "fBodyAccJerk.bandsEnergy...1.16.1"   
## [407] "fBodyAccJerk.bandsEnergy...17.32.1"  
## [408] "fBodyAccJerk.bandsEnergy...33.48.1"  
## [409] "fBodyAccJerk.bandsEnergy...49.64.1"  
## [410] "fBodyAccJerk.bandsEnergy...1.24.1"   
## [411] "fBodyAccJerk.bandsEnergy...25.48.1"  
## [412] "fBodyAccJerk.bandsEnergy...1.8.2"    
## [413] "fBodyAccJerk.bandsEnergy...9.16.2"   
## [414] "fBodyAccJerk.bandsEnergy...17.24.2"  
## [415] "fBodyAccJerk.bandsEnergy...25.32.2"  
## [416] "fBodyAccJerk.bandsEnergy...33.40.2"  
## [417] "fBodyAccJerk.bandsEnergy...41.48.2"  
## [418] "fBodyAccJerk.bandsEnergy...49.56.2"  
## [419] "fBodyAccJerk.bandsEnergy...57.64.2"  
## [420] "fBodyAccJerk.bandsEnergy...1.16.2"   
## [421] "fBodyAccJerk.bandsEnergy...17.32.2"  
## [422] "fBodyAccJerk.bandsEnergy...33.48.2"  
## [423] "fBodyAccJerk.bandsEnergy...49.64.2"  
## [424] "fBodyAccJerk.bandsEnergy...1.24.2"   
## [425] "fBodyAccJerk.bandsEnergy...25.48.2"  
## [426] "fBodyGyro.mean...X"                  
## [427] "fBodyGyro.mean...Y"                  
## [428] "fBodyGyro.mean...Z"                  
## [429] "fBodyGyro.std...X"                   
## [430] "fBodyGyro.std...Y"                   
## [431] "fBodyGyro.std...Z"                   
## [432] "fBodyGyro.mad...X"                   
## [433] "fBodyGyro.mad...Y"                   
## [434] "fBodyGyro.mad...Z"                   
## [435] "fBodyGyro.max...X"                   
## [436] "fBodyGyro.max...Y"                   
## [437] "fBodyGyro.max...Z"                   
## [438] "fBodyGyro.min...X"                   
## [439] "fBodyGyro.min...Y"                   
## [440] "fBodyGyro.min...Z"                   
## [441] "fBodyGyro.sma.."                     
## [442] "fBodyGyro.energy...X"                
## [443] "fBodyGyro.energy...Y"                
## [444] "fBodyGyro.energy...Z"                
## [445] "fBodyGyro.iqr...X"                   
## [446] "fBodyGyro.iqr...Y"                   
## [447] "fBodyGyro.iqr...Z"                   
## [448] "fBodyGyro.entropy...X"               
## [449] "fBodyGyro.entropy...Y"               
## [450] "fBodyGyro.entropy...Z"               
## [451] "fBodyGyro.maxInds.X"                 
## [452] "fBodyGyro.maxInds.Y"                 
## [453] "fBodyGyro.maxInds.Z"                 
## [454] "fBodyGyro.meanFreq...X"              
## [455] "fBodyGyro.meanFreq...Y"              
## [456] "fBodyGyro.meanFreq...Z"              
## [457] "fBodyGyro.skewness...X"              
## [458] "fBodyGyro.kurtosis...X"              
## [459] "fBodyGyro.skewness...Y"              
## [460] "fBodyGyro.kurtosis...Y"              
## [461] "fBodyGyro.skewness...Z"              
## [462] "fBodyGyro.kurtosis...Z"              
## [463] "fBodyGyro.bandsEnergy...1.8"         
## [464] "fBodyGyro.bandsEnergy...9.16"        
## [465] "fBodyGyro.bandsEnergy...17.24"       
## [466] "fBodyGyro.bandsEnergy...25.32"       
## [467] "fBodyGyro.bandsEnergy...33.40"       
## [468] "fBodyGyro.bandsEnergy...41.48"       
## [469] "fBodyGyro.bandsEnergy...49.56"       
## [470] "fBodyGyro.bandsEnergy...57.64"       
## [471] "fBodyGyro.bandsEnergy...1.16"        
## [472] "fBodyGyro.bandsEnergy...17.32"       
## [473] "fBodyGyro.bandsEnergy...33.48"       
## [474] "fBodyGyro.bandsEnergy...49.64"       
## [475] "fBodyGyro.bandsEnergy...1.24"        
## [476] "fBodyGyro.bandsEnergy...25.48"       
## [477] "fBodyGyro.bandsEnergy...1.8.1"       
## [478] "fBodyGyro.bandsEnergy...9.16.1"      
## [479] "fBodyGyro.bandsEnergy...17.24.1"     
## [480] "fBodyGyro.bandsEnergy...25.32.1"     
## [481] "fBodyGyro.bandsEnergy...33.40.1"     
## [482] "fBodyGyro.bandsEnergy...41.48.1"     
## [483] "fBodyGyro.bandsEnergy...49.56.1"     
## [484] "fBodyGyro.bandsEnergy...57.64.1"     
## [485] "fBodyGyro.bandsEnergy...1.16.1"      
## [486] "fBodyGyro.bandsEnergy...17.32.1"     
## [487] "fBodyGyro.bandsEnergy...33.48.1"     
## [488] "fBodyGyro.bandsEnergy...49.64.1"     
## [489] "fBodyGyro.bandsEnergy...1.24.1"      
## [490] "fBodyGyro.bandsEnergy...25.48.1"     
## [491] "fBodyGyro.bandsEnergy...1.8.2"       
## [492] "fBodyGyro.bandsEnergy...9.16.2"      
## [493] "fBodyGyro.bandsEnergy...17.24.2"     
## [494] "fBodyGyro.bandsEnergy...25.32.2"     
## [495] "fBodyGyro.bandsEnergy...33.40.2"     
## [496] "fBodyGyro.bandsEnergy...41.48.2"     
## [497] "fBodyGyro.bandsEnergy...49.56.2"     
## [498] "fBodyGyro.bandsEnergy...57.64.2"     
## [499] "fBodyGyro.bandsEnergy...1.16.2"      
## [500] "fBodyGyro.bandsEnergy...17.32.2"     
## [501] "fBodyGyro.bandsEnergy...33.48.2"     
## [502] "fBodyGyro.bandsEnergy...49.64.2"     
## [503] "fBodyGyro.bandsEnergy...1.24.2"      
## [504] "fBodyGyro.bandsEnergy...25.48.2"     
## [505] "fBodyAccMag.mean.."                  
## [506] "fBodyAccMag.std.."                   
## [507] "fBodyAccMag.mad.."                   
## [508] "fBodyAccMag.max.."                   
## [509] "fBodyAccMag.min.."                   
## [510] "fBodyAccMag.sma.."                   
## [511] "fBodyAccMag.energy.."                
## [512] "fBodyAccMag.iqr.."                   
## [513] "fBodyAccMag.entropy.."               
## [514] "fBodyAccMag.maxInds"                 
## [515] "fBodyAccMag.meanFreq.."              
## [516] "fBodyAccMag.skewness.."              
## [517] "fBodyAccMag.kurtosis.."              
## [518] "fBodyBodyAccJerkMag.mean.."          
## [519] "fBodyBodyAccJerkMag.std.."           
## [520] "fBodyBodyAccJerkMag.mad.."           
## [521] "fBodyBodyAccJerkMag.max.."           
## [522] "fBodyBodyAccJerkMag.min.."           
## [523] "fBodyBodyAccJerkMag.sma.."           
## [524] "fBodyBodyAccJerkMag.energy.."        
## [525] "fBodyBodyAccJerkMag.iqr.."           
## [526] "fBodyBodyAccJerkMag.entropy.."       
## [527] "fBodyBodyAccJerkMag.maxInds"         
## [528] "fBodyBodyAccJerkMag.meanFreq.."      
## [529] "fBodyBodyAccJerkMag.skewness.."      
## [530] "fBodyBodyAccJerkMag.kurtosis.."      
## [531] "fBodyBodyGyroMag.mean.."             
## [532] "fBodyBodyGyroMag.std.."              
## [533] "fBodyBodyGyroMag.mad.."              
## [534] "fBodyBodyGyroMag.max.."              
## [535] "fBodyBodyGyroMag.min.."              
## [536] "fBodyBodyGyroMag.sma.."              
## [537] "fBodyBodyGyroMag.energy.."           
## [538] "fBodyBodyGyroMag.iqr.."              
## [539] "fBodyBodyGyroMag.entropy.."          
## [540] "fBodyBodyGyroMag.maxInds"            
## [541] "fBodyBodyGyroMag.meanFreq.."         
## [542] "fBodyBodyGyroMag.skewness.."         
## [543] "fBodyBodyGyroMag.kurtosis.."         
## [544] "fBodyBodyGyroJerkMag.mean.."         
## [545] "fBodyBodyGyroJerkMag.std.."          
## [546] "fBodyBodyGyroJerkMag.mad.."          
## [547] "fBodyBodyGyroJerkMag.max.."          
## [548] "fBodyBodyGyroJerkMag.min.."          
## [549] "fBodyBodyGyroJerkMag.sma.."          
## [550] "fBodyBodyGyroJerkMag.energy.."       
## [551] "fBodyBodyGyroJerkMag.iqr.."          
## [552] "fBodyBodyGyroJerkMag.entropy.."      
## [553] "fBodyBodyGyroJerkMag.maxInds"        
## [554] "fBodyBodyGyroJerkMag.meanFreq.."     
## [555] "fBodyBodyGyroJerkMag.skewness.."     
## [556] "fBodyBodyGyroJerkMag.kurtosis.."     
## [557] "angle.tBodyAccMean.gravity."         
## [558] "angle.tBodyAccJerkMean..gravityMean."
## [559] "angle.tBodyGyroMean.gravityMean."    
## [560] "angle.tBodyGyroJerkMean.gravityMean."
## [561] "angle.X.gravityMean."                
## [562] "angle.Y.gravityMean."                
## [563] "angle.Z.gravityMean."
```
###Build train data
 In this process,we put all the data in train(dir)together

```r
subject_train<-read.csv("train/subject_train.txt",header = FALSE)# subject
names(subject_train)<-"subject_ID"
X_train<-read.csv("train/X_train.txt",sep="",header = FALSE)#collected data
X_train<-X_train[,!is.na(X_train[1,])]
y_train<-read.csv("train/y_train.txt",header=FALSE)#label_activity
names(X_train)<-feature  #对应的列名
names(y_train)<-"activity_label"
dat_train<-data.frame(subject_train,y_train,X_train)#完整的train数据
```
###Merge Training data and test data together
All  labels between dat_train and dat_test this two datafram are all the same,so we could merge then together conveniently to build a big datafram.

```r
dat<-merge(dat_test,dat_train,by.x=names(dat_test),by.y=names(dat_train),all = TRUE)
str(dat)
```

```
## 'data.frame':	10299 obs. of  563 variables:
##  $ subject_ID                          : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ activity_label                      : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ tBodyAcc.mean...X                   : num  0.156 0.18 0.19 0.202 0.204 ...
##  $ tBodyAcc.mean...Y                   : num  -0.04961 -0.0178 -0.0389 -0.00904 -0.03051 ...
##  $ tBodyAcc.mean...Z                   : num  -0.1129 -0.0393 -0.0987 -0.0791 -0.1371 ...
##  $ tBodyAcc.std...X                    : num  -0.297 -0.377 -0.331 -0.221 -0.247 ...
##  $ tBodyAcc.std...Y                    : num  0.1756 0.0235 0.0448 0.1231 0.2986 ...
##  $ tBodyAcc.std...Z                    : num  -0.254 -0.247 -0.354 -0.222 -0.206 ...
##  $ tBodyAcc.mad...X                    : num  -0.392 -0.434 -0.385 -0.272 -0.3 ...
##  $ tBodyAcc.mad...Y                    : num  0.088 -0.0419 0.0128 0.0727 0.2651 ...
##  $ tBodyAcc.mad...Z                    : num  -0.237 -0.243 -0.329 -0.21 -0.246 ...
##  $ tBodyAcc.max...X                    : num  0.1165 -0.2292 -0.1669 -0.1195 -0.0859 ...
##  $ tBodyAcc.max...Y                    : num  -0.0194 -0.1187 -0.0623 -0.105 -0.0922 ...
##  $ tBodyAcc.max...Z                    : num  -0.355 -0.227 -0.41 -0.238 -0.147 ...
##  $ tBodyAcc.min...X                    : num  -0.1079 0.1099 -0.0316 0.2378 0.1655 ...
##  $ tBodyAcc.min...Y                    : num  -0.069 0.0808 0.0654 -0.0447 -0.1629 ...
##  $ tBodyAcc.min...Z                    : num  0.38 0.42 0.454 0.429 0.407 ...
##  $ tBodyAcc.sma..                      : num  -0.1473 -0.2068 -0.1922 -0.0682 -0.0426 ...
##  $ tBodyAcc.energy...X                 : num  -0.749 -0.802 -0.773 -0.694 -0.714 ...
##  $ tBodyAcc.energy...Y                 : num  -0.732 -0.797 -0.788 -0.756 -0.675 ...
##  $ tBodyAcc.energy...Z                 : num  -0.748 -0.736 -0.809 -0.725 -0.714 ...
##  $ tBodyAcc.iqr...X                    : num  -0.539 -0.534 -0.467 -0.335 -0.375 ...
##  $ tBodyAcc.iqr...Y                    : num  -0.392 -0.396 -0.245 -0.35 -0.133 ...
##  $ tBodyAcc.iqr...Z                    : num  -0.244 -0.185 -0.371 -0.107 -0.372 ...
##  $ tBodyAcc.entropy...X                : num  0.269 0.304 0.36 0.222 0.297 ...
##  $ tBodyAcc.entropy...Y                : num  0.322 0.467 0.364 0.457 0.416 ...
##  $ tBodyAcc.entropy...Z                : num  0.2292 0.0989 0.122 0.0747 -0.0262 ...
##  $ tBodyAcc.arCoeff...X.1              : num  -0.0866 -0.4113 -0.412 -0.4492 -0.1353 ...
##  $ tBodyAcc.arCoeff...X.2              : num  0.104 0.458 0.468 0.472 0.096 ...
##  $ tBodyAcc.arCoeff...X.3              : num  0.15 -0.304 -0.243 -0.359 0.102 ...
##  $ tBodyAcc.arCoeff...X.4              : num  -0.1149 0.1609 0.0855 0.2435 -0.0194 ...
##  $ tBodyAcc.arCoeff...Y.1              : num  -0.224 -0.4 -0.286 -0.426 -0.154 ...
##  $ tBodyAcc.arCoeff...Y.2              : num  0.219 0.393 0.287 0.434 0.138 ...
##  $ tBodyAcc.arCoeff...Y.3              : num  0.14518 -0.00193 0.11167 -0.05746 0.25176 ...
##  $ tBodyAcc.arCoeff...Y.4              : num  -0.09331 -0.05973 -0.13985 0.00446 -0.14631 ...
##  $ tBodyAcc.arCoeff...Z.1              : num  0.0665 -0.2198 -0.0923 -0.1015 -0.1917 ...
##  $ tBodyAcc.arCoeff...Z.2              : num  0.0206 0.167 0.1309 0.1121 0.2389 ...
##  $ tBodyAcc.arCoeff...Z.3              : num  0.36086 -0.00316 0.21078 0.00516 -0.19821 ...
##  $ tBodyAcc.arCoeff...Z.4              : num  -0.63902 -0.12758 -0.52724 -0.17857 0.00423 ...
##  $ tBodyAcc.correlation...X.Y          : num  -0.3356 -0.1265 -0.0995 -0.2879 -0.0878 ...
##  $ tBodyAcc.correlation...X.Z          : num  -0.4477 -0.1133 -0.3152 -0.222 -0.0816 ...
##  $ tBodyAcc.correlation...Y.Z          : num  0.437 0.387 0.279 0.39 0.39 ...
##  $ tGravityAcc.mean...X                : num  0.911 0.951 0.929 0.946 0.954 ...
##  $ tGravityAcc.mean...Y                : num  -0.334 -0.248 -0.302 -0.255 -0.243 ...
##  $ tGravityAcc.mean...Z                : num  -0.1447 -0.0385 -0.1194 -0.0226 -0.023 ...
##  $ tGravityAcc.std...X                 : num  -0.933 -0.983 -0.981 -0.99 -0.989 ...
##  $ tGravityAcc.std...Y                 : num  -0.935 -0.958 -0.98 -0.963 -0.979 ...
##  $ tGravityAcc.std...Z                 : num  -0.725 -0.956 -0.979 -0.954 -0.977 ...
##  $ tGravityAcc.mad...X                 : num  -0.932 -0.984 -0.985 -0.99 -0.99 ...
##  $ tGravityAcc.mad...Y                 : num  -0.94 -0.959 -0.979 -0.961 -0.98 ...
##  $ tGravityAcc.mad...Z                 : num  -0.732 -0.958 -0.979 -0.956 -0.977 ...
##  $ tGravityAcc.max...X                 : num  0.86 0.882 0.858 0.874 0.883 ...
##  $ tGravityAcc.max...Y                 : num  -0.337 -0.254 -0.316 -0.268 -0.258 ...
##  $ tGravityAcc.max...Z                 : num  -0.057 -0.0339 -0.1214 -0.0205 -0.0264 ...
##  $ tGravityAcc.min...X                 : num  0.91 0.965 0.934 0.961 0.969 ...
##  $ tGravityAcc.min...Y                 : num  -0.332 -0.227 -0.277 -0.238 -0.222 ...
##  $ tGravityAcc.min...Z                 : num  -0.1851 -0.0468 -0.1227 -0.0328 -0.026 ...
##  $ tGravityAcc.sma..                   : num  0.1567 -0.2819 0.0366 -0.3163 -0.3346 ...
##  $ tGravityAcc.energy...X              : num  0.763 0.868 0.809 0.853 0.874 ...
##  $ tGravityAcc.energy...Y              : num  -0.807 -0.898 -0.844 -0.891 -0.903 ...
##  $ tGravityAcc.energy...Z              : num  -0.952 -0.996 -0.969 -0.998 -0.998 ...
##  $ tGravityAcc.iqr...X                 : num  -0.931 -0.983 -0.992 -0.992 -0.991 ...
##  $ tGravityAcc.iqr...Y                 : num  -0.949 -0.96 -0.977 -0.964 -0.98 ...
##  $ tGravityAcc.iqr...Z                 : num  -0.768 -0.964 -0.98 -0.965 -0.976 ...
##  $ tGravityAcc.entropy...X             : num  -0.0667 -1 -0.5078 -1 -1 ...
##  $ tGravityAcc.entropy...Y             : num  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
##  $ tGravityAcc.entropy...Z             : num  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
##  $ tGravityAcc.arCoeff...X.1           : num  -0.321 -0.224 -0.285 -0.193 -0.195 ...
##  $ tGravityAcc.arCoeff...X.2           : num  0.405 0.306 0.377 0.277 0.286 ...
##  $ tGravityAcc.arCoeff...X.3           : num  -0.488 -0.384 -0.468 -0.353 -0.37 ...
##  $ tGravityAcc.arCoeff...X.4           : num  0.571 0.456 0.558 0.421 0.446 ...
##  $ tGravityAcc.arCoeff...Y.1           : num  -0.0907 -0.0559 0.023 -0.0262 0.0266 ...
##  $ tGravityAcc.arCoeff...Y.2           : num  0.1182 0.1099 0.0229 0.0929 0.0355 ...
##  $ tGravityAcc.arCoeff...Y.3           : num  -0.21 -0.231 -0.14 -0.229 -0.171 ...
##  $ tGravityAcc.arCoeff...Y.4           : num  0.326 0.376 0.283 0.39 0.332 ...
##  $ tGravityAcc.arCoeff...Z.1           : num  -0.27579 -0.55437 0.00322 -0.38426 -0.30142 ...
##  $ tGravityAcc.arCoeff...Z.2           : num  0.2981 0.581 0.0216 0.4088 0.336 ...
##  $ tGravityAcc.arCoeff...Z.3           : num  -0.3206 -0.6067 -0.0432 -0.4314 -0.368 ...
##  $ tGravityAcc.arCoeff...Z.4           : num  0.3408 0.6287 0.0597 0.4495 0.3948 ...
##  $ tGravityAcc.correlation...X.Y       : num  0.966 0.885 0.423 -0.428 -0.72 ...
##  $ tGravityAcc.correlation...X.Z       : num  0.891 -0.353 0.246 -0.705 -0.2 ...
##  $ tGravityAcc.correlation...Y.Z       : num  0.7743 -0.0059 0.3784 0.8055 0.1683 ...
##  $ tBodyAccJerk.mean...X               : num  0.2151 0.3631 0.2202 -0.1378 -0.0752 ...
##  $ tBodyAccJerk.mean...Y               : num  0.2801 0.1097 0.0691 0.4212 0.2401 ...
##  $ tBodyAccJerk.mean...Z               : num  0.202 0.253 -0.209 0.507 -0.259 ...
##  $ tBodyAccJerk.std...X                : num  -0.0117 -0.2244 -0.1152 -0.1362 -0.0812 ...
##  $ tBodyAccJerk.std...Y                : num  0.1059 -0.0527 0.014 0.0427 0.243 ...
##  $ tBodyAccJerk.std...Z                : num  -0.351 -0.582 -0.505 -0.546 -0.492 ...
##  $ tBodyAccJerk.mad...X                : num  -0.0763 -0.2129 -0.0872 -0.1281 -0.0488 ...
##  $ tBodyAccJerk.mad...Y                : num  0.0401 -0.0523 0.0177 0.05 0.2589 ...
##  $ tBodyAccJerk.mad...Z                : num  -0.286 -0.534 -0.452 -0.52 -0.438 ...
##  $ tBodyAccJerk.max...X                : num  -0.063 -0.426 -0.419 -0.424 -0.272 ...
##  $ tBodyAccJerk.max...Y                : num  -0.133 -0.345 -0.263 -0.379 -0.31 ...
##  $ tBodyAccJerk.max...Z                : num  -0.542 -0.752 -0.63 -0.693 -0.757 ...
##  $ tBodyAccJerk.min...X                : num  -0.3808 -0.1043 -0.2187 0.0663 0.1072 ...
##  $ tBodyAccJerk.min...Y                : num  0.1074 0.3805 0.1511 0.1822 -0.0404 ...
##  $ tBodyAccJerk.min...Z                : num  0.384 0.546 0.509 0.358 0.416 ...
##  $ tBodyAccJerk.sma..                  : num  -0.0611 -0.2348 -0.1329 -0.1661 -0.0443 ...
##  $ tBodyAccJerk.energy...X             : num  -0.509 -0.696 -0.606 -0.624 -0.575 ...
##   [list output truncated]
```
##Extract mean and std & change Activity name!
 We use the function grepl() to find all the feature related to mean and std!

```r
new_feature<-grepl("mean|std",feature)#正则表达式得到logical
new_dat<-dat[,3:length(dat)]
new_dat<-new_dat[new_feature]# Extract OK!
names(new_dat)
```

```
##  [1] "tBodyAcc.mean...X"               "tBodyAcc.mean...Y"              
##  [3] "tBodyAcc.mean...Z"               "tBodyAcc.std...X"               
##  [5] "tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
##  [7] "tGravityAcc.mean...X"            "tGravityAcc.mean...Y"           
##  [9] "tGravityAcc.mean...Z"            "tGravityAcc.std...X"            
## [11] "tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
## [13] "tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"          
## [15] "tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"           
## [17] "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
## [19] "tBodyGyro.mean...X"              "tBodyGyro.mean...Y"             
## [21] "tBodyGyro.mean...Z"              "tBodyGyro.std...X"              
## [23] "tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
## [25] "tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"         
## [27] "tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"          
## [29] "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
## [31] "tBodyAccMag.mean.."              "tBodyAccMag.std.."              
## [33] "tGravityAccMag.mean.."           "tGravityAccMag.std.."           
## [35] "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
## [37] "tBodyGyroMag.mean.."             "tBodyGyroMag.std.."             
## [39] "tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."         
## [41] "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
## [43] "fBodyAcc.mean...Z"               "fBodyAcc.std...X"               
## [45] "fBodyAcc.std...Y"                "fBodyAcc.std...Z"               
## [47] "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
## [49] "fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"          
## [51] "fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"          
## [53] "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
## [55] "fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"      
## [57] "fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"      
## [59] "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
## [61] "fBodyGyro.mean...Z"              "fBodyGyro.std...X"              
## [63] "fBodyGyro.std...Y"               "fBodyGyro.std...Z"              
## [65] "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
## [67] "fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."             
## [69] "fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."         
## [71] "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
## [73] "fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."        
## [75] "fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."    
## [77] "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
## [79] "fBodyBodyGyroJerkMag.meanFreq.."
```
Use sapply to construct the new_label for activity name.

```r
new_label<-dat[,2]
Ac_label<-read.csv("activity_labels.txt",header = FALSE,sep ="")
Ac_label<-Ac_label[,2]
Ac_label<-as.character(Ac_label)
new_label<-sapply(new_label,function(x){Ac_label[x]})
```
merge together again!

```r
#combine ID and activity and mean,std again
new_ID<-dat[,1]
new_dat<-data.frame(new_ID,new_label,new_dat)#length~81,nrow~10299
str(new_dat)
```

```
## 'data.frame':	10299 obs. of  81 variables:
##  $ new_ID                         : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ new_label                      : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
##  $ tBodyAcc.mean...X              : num  0.156 0.18 0.19 0.202 0.204 ...
##  $ tBodyAcc.mean...Y              : num  -0.04961 -0.0178 -0.0389 -0.00904 -0.03051 ...
##  $ tBodyAcc.mean...Z              : num  -0.1129 -0.0393 -0.0987 -0.0791 -0.1371 ...
##  $ tBodyAcc.std...X               : num  -0.297 -0.377 -0.331 -0.221 -0.247 ...
##  $ tBodyAcc.std...Y               : num  0.1756 0.0235 0.0448 0.1231 0.2986 ...
##  $ tBodyAcc.std...Z               : num  -0.254 -0.247 -0.354 -0.222 -0.206 ...
##  $ tGravityAcc.mean...X           : num  0.911 0.951 0.929 0.946 0.954 ...
##  $ tGravityAcc.mean...Y           : num  -0.334 -0.248 -0.302 -0.255 -0.243 ...
##  $ tGravityAcc.mean...Z           : num  -0.1447 -0.0385 -0.1194 -0.0226 -0.023 ...
##  $ tGravityAcc.std...X            : num  -0.933 -0.983 -0.981 -0.99 -0.989 ...
##  $ tGravityAcc.std...Y            : num  -0.935 -0.958 -0.98 -0.963 -0.979 ...
##  $ tGravityAcc.std...Z            : num  -0.725 -0.956 -0.979 -0.954 -0.977 ...
##  $ tBodyAccJerk.mean...X          : num  0.2151 0.3631 0.2202 -0.1378 -0.0752 ...
##  $ tBodyAccJerk.mean...Y          : num  0.2801 0.1097 0.0691 0.4212 0.2401 ...
##  $ tBodyAccJerk.mean...Z          : num  0.202 0.253 -0.209 0.507 -0.259 ...
##  $ tBodyAccJerk.std...X           : num  -0.0117 -0.2244 -0.1152 -0.1362 -0.0812 ...
##  $ tBodyAccJerk.std...Y           : num  0.1059 -0.0527 0.014 0.0427 0.243 ...
##  $ tBodyAccJerk.std...Z           : num  -0.351 -0.582 -0.505 -0.546 -0.492 ...
##  $ tBodyGyro.mean...X             : num  0.2082 -0.044 -0.0428 0.0175 0.0368 ...
##  $ tBodyGyro.mean...Y             : num  -0.22176 -0.00142 -0.1664 0.05153 -0.23542 ...
##  $ tBodyGyro.mean...Z             : num  -0.1172 0.0757 0.1145 0.1078 0.167 ...
##  $ tBodyGyro.std...X              : num  -0.225 -0.514 -0.461 -0.445 -0.482 ...
##  $ tBodyGyro.std...Y              : num  0.0313 -0.0654 -0.0218 -0.0224 0.0137 ...
##  $ tBodyGyro.std...Z              : num  -0.301 -0.333 -0.365 -0.348 -0.316 ...
##  $ tBodyGyroJerk.mean...X         : num  0.0569 0.0644 -0.0951 -0.1927 -0.1607 ...
##  $ tBodyGyroJerk.mean...Y         : num  -0.4138 -0.3598 -0.0566 -0.5182 -0.0958 ...
##  $ tBodyGyroJerk.mean...Z         : num  -0.0336 -0.2291 -0.1246 0.0395 -0.0809 ...
##  $ tBodyGyroJerk.std...X          : num  -0.182 -0.293 -0.159 -0.174 -0.206 ...
##  $ tBodyGyroJerk.std...Y          : num  -0.161 -0.362 -0.236 -0.319 -0.341 ...
##  $ tBodyGyroJerk.std...Z          : num  -0.348 -0.462 -0.395 -0.426 -0.284 ...
##  $ tBodyAccMag.mean..             : num  -0.1518 -0.2065 -0.2043 -0.0836 -0.0465 ...
##  $ tBodyAccMag.std..              : num  -0.119 -0.305 -0.27 -0.202 -0.186 ...
##  $ tGravityAccMag.mean..          : num  -0.1518 -0.2065 -0.2043 -0.0836 -0.0465 ...
##  $ tGravityAccMag.std..           : num  -0.119 -0.305 -0.27 -0.202 -0.186 ...
##  $ tBodyAccJerkMag.mean..         : num  -0.104 -0.245 -0.157 -0.175 -0.046 ...
##  $ tBodyAccJerkMag.std..          : num  0.1621 -0.202 -0.0971 -0.0923 -0.0603 ...
##  $ tBodyGyroMag.mean..            : num  0.0536 -0.2215 -0.1511 -0.1438 -0.1131 ...
##  $ tBodyGyroMag.std..             : num  -0.124 -0.112 -0.167 -0.149 -0.195 ...
##  $ tBodyGyroJerkMag.mean..        : num  -0.203 -0.386 -0.233 -0.3 -0.293 ...
##  $ tBodyGyroJerkMag.std..         : num  -0.202 -0.341 -0.293 -0.336 -0.365 ...
##  $ fBodyAcc.mean...X              : num  -0.151 -0.28 -0.216 -0.182 -0.161 ...
##  $ fBodyAcc.mean...Y              : num  0.1555 -0.1011 0.0173 0.1284 0.2504 ...
##  $ fBodyAcc.mean...Z              : num  -0.259 -0.344 -0.397 -0.254 -0.279 ...
##  $ fBodyAcc.std...X               : num  -0.364 -0.419 -0.382 -0.236 -0.284 ...
##  $ fBodyAcc.std...Y               : num  0.11182 0.02044 -0.00666 0.04916 0.24154 ...
##  $ fBodyAcc.std...Z               : num  -0.312 -0.253 -0.38 -0.265 -0.228 ...
##  $ fBodyAcc.meanFreq...X          : num  -0.121 -0.273 -0.288 -0.296 -0.151 ...
##  $ fBodyAcc.meanFreq...Y          : num  0.1009 -0.0801 0.0178 0.1114 0.1094 ...
##  $ fBodyAcc.meanFreq...Z          : num  0.2364 -0.0305 0.1604 0.2266 0.056 ...
##  $ fBodyAccJerk.mean...X          : num  -0.038 -0.26 -0.18 -0.197 -0.115 ...
##  $ fBodyAccJerk.mean...Y          : num  -0.0194 -0.2173 -0.0941 -0.0876 0.1191 ...
##  $ fBodyAccJerk.mean...Z          : num  -0.351 -0.543 -0.491 -0.502 -0.452 ...
##  $ fBodyAccJerk.std...X           : num  -0.0723 -0.2553 -0.1254 -0.1485 -0.1274 ...
##  $ fBodyAccJerk.std...Y           : num  0.1686 0.0556 0.0647 0.114 0.296 ...
##  $ fBodyAccJerk.std...Z           : num  -0.35 -0.62 -0.516 -0.588 -0.529 ...
##  $ fBodyAccJerk.meanFreq...X      : num  -0.114 -0.1325 -0.2785 -0.2711 -0.0591 ...
##  $ fBodyAccJerk.meanFreq...Y      : num  -0.389 -0.523 -0.449 -0.665 -0.398 ...
##  $ fBodyAccJerk.meanFreq...Z      : num  -0.059 -0.407 -0.236 -0.208 -0.233 ...
##  $ fBodyGyro.mean...X             : num  -0.0927 -0.4047 -0.2853 -0.2919 -0.4162 ...
##  $ fBodyGyro.mean...Y             : num  0.0203 -0.0819 -0.1039 -0.0771 -0.0965 ...
##  $ fBodyGyro.mean...Z             : num  -0.21 -0.253 -0.247 -0.283 -0.227 ...
##  $ fBodyGyro.std...X              : num  -0.268 -0.549 -0.517 -0.494 -0.504 ...
##  $ fBodyGyro.std...Y              : num  0.03075 -0.06186 0.01886 0.00317 0.06913 ...
##  $ fBodyGyro.std...Z              : num  -0.398 -0.422 -0.467 -0.431 -0.41 ...
##  $ fBodyGyro.meanFreq...X         : num  -0.1979 0.0799 -0.0168 -0.0973 -0.0591 ...
##  $ fBodyGyro.meanFreq...Y         : num  0.0683 -0.0119 -0.0341 0.1447 -0.1538 ...
##  $ fBodyGyro.meanFreq...Z         : num  -0.1516 -0.0899 -0.0509 0.0133 0.1 ...
##  $ fBodyAccMag.mean..             : num  0.0267 -0.2494 -0.1705 -0.085 -0.0688 ...
##  $ fBodyAccMag.std..              : num  -0.35 -0.445 -0.446 -0.4 -0.388 ...
##  $ fBodyAccMag.meanFreq..         : num  0.369 0.136 0.231 0.177 0.204 ...
##  $ fBodyBodyAccJerkMag.mean..     : num  0.206 -0.2047 -0.0456 -0.0865 -0.0187 ...
##  $ fBodyBodyAccJerkMag.std..      : num  0.106 -0.204 -0.172 -0.106 -0.116 ...
##  $ fBodyBodyAccJerkMag.meanFreq.. : num  0.20083 -0.00852 0.09666 -0.07766 0.23101 ...
##  $ fBodyBodyGyroMag.mean..        : num  -0.0735 -0.1175 -0.1511 -0.1547 -0.2683 ...
##  $ fBodyBodyGyroMag.std..         : num  -0.32 -0.263 -0.326 -0.292 -0.283 ...
##  $ fBodyBodyGyroMag.meanFreq..    : num  0.272 0.179 0.351 0.346 0.271 ...
##  $ fBodyBodyGyroJerkMag.mean..    : num  -0.232 -0.333 -0.306 -0.36 -0.37 ...
##  $ fBodyBodyGyroJerkMag.std..     : num  -0.218 -0.397 -0.326 -0.352 -0.403 ...
##  $ fBodyBodyGyroJerkMag.meanFreq..: num  0.00908 0.05571 0.23578 0.13391 0.07759 ...
```
##Create a tidy data
Using the group_by function,and use a loop to compute each col's average in g_dat(I use the summarise() function)!Then merge them together by "new_ID"and"new_label"!Finally,change the feature's lable back and write this fram to "new_tidy_data.txt"

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
g_dat<-group_by(new_dat,new_ID,new_label)
g_name<-names(g_dat)[3:length(g_dat)]
nam<-as.name(g_name[1])
for(i in 2:79){a<-as.name(g_name[i]);nam<-c(nam,a)}
b<-summarise(g_dat,mean(tBodyAcc.mean...X))

nam<-nam[2:79]
i<-i+1
mer<-function(x){a<-summarise(g_dat,mean(x));}
for(i in 2:79)
{
  a<-mer(nam[[i-1]]);
  names(a)[3]<-i;
  b<-merge(b,a,by.x=c("new_ID","new_label"),by.y=c("new_ID","new_label"),all=TRUE)
}
names(b)[3:81]<-g_name
write.table(b,file = "new_tidy_data.txt",row.names = FALSE)
```
##That's all,Thank you!
