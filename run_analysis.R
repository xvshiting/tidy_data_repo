library(dplyr)
feature<-read.csv("features.txt",header = FALSE,sep = " ")
feature<-feature[,2]            #提取特征名称(factor)
feature<-as.character(feature)  #charachter
#merge test
subject_test<-read.csv("test/subject_test.txt",header = FALSE)# subject
names(subject_test)<-"subject_ID"
X_test<-read.csv("test/X_test.txt",sep="",header = FALSE)#collected data
X_test<-X_test[,!is.na(X_test[1,])]
y_test<-read.csv("test/y_test.txt",header=FALSE)#label_activity
names(X_test)<-feature  #对应的列名
names(y_test)<-"activity_label"
dat_test<-data.frame(subject_test,y_test,X_test)#完整的test数据
#merge train
subject_train<-read.csv("train/subject_train.txt",header = FALSE)# subject
names(subject_train)<-"subject_ID"
X_train<-read.csv("train/X_train.txt",sep="",header = FALSE)#collected data
X_train<-X_train[,!is.na(X_train[1,])]
y_train<-read.csv("train/y_train.txt",header=FALSE)#label_activity
names(X_train)<-feature  #对应的列名
names(y_train)<-"activity_label"
dat_train<-data.frame(subject_train,y_train,X_train)#完整的train数据
#put training and test data together! nrow(dat)=10299 length(dat=563) origin data~
dat<-merge(dat_test,dat_train,by.x=names(dat_test),by.y=names(dat_train),all = TRUE)

#Extract mean and std
new_feature<-grepl("mean|std",feature)#正则表达式得到logical
new_dat<-dat[,3:length(dat)]
new_dat<-new_dat[new_feature]# Extract OK!
#chage Activity name
new_label<-dat[,2]
Ac_label<-read.csv("activity_labels.txt",header = FALSE,sep ="")
Ac_label<-Ac_label[,2]
Ac_label<-as.character(Ac_label)
new_label<-sapply(new_label,function(x){Ac_label[x]})
#combine ID and activity and mean,std again
new_ID<-dat[,1]
new_dat<-data.frame(new_ID,new_label,new_dat)#length~81,nrow~10299
#creates a second, independent tidy data set with the average of each variable for each activity and each subject
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

