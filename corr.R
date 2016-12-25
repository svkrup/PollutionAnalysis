corr<-function(directory,threshold=0){
  # This programs uses a data set of fine particulate pollution data collected in the US
  # This data is from 332 pollution monitors around the country for a period of an year
  # The data from each monitor is available as a csv file
  # THe data is available for download at:
  # https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
  # This program computes a vector of correlation coefficients between sulphate and nitrate obs
  # for monitors that have obs>threshold
  
  #  setting the working directory to specdata
  current_wd<-getwd()
  old_wd<-"C:/Users/krupakar_singampally/Documents"
  if(current_wd==old_wd){setwd(directory)}
  
  #  Getting the total list of monitor files into a vector
  file_list<-dir()
  fc<-length(file_list)
  j=1
  corr_v<-numeric()
  
  for(i in 1:fc){
    #  open each file and read
    file_i<-read.csv(file_list[i])  
    #  compute the total obs in that file
    com_c<-sum(complete.cases(file_i))
    
    if(com_c>threshold){
      sulf<-file_i$sulfate
      nitr<-file_i$nitrate
      #  compute correlation
      corr_v[j]<-cor(sulf,nitr,use="complete.obs")  
      j=j+1
      }
    
  }
  corr_v
}