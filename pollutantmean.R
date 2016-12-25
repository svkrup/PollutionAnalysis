pollutantmean <- function(directory,pollutant,id=1:332){
  # This programs uses a data set of fine particulate pollution data collected in the US
  # This data is from 332 pollution monitors around the country for a period of an year
  # The data from each monitor is available as a csv file
  # THe data is available for download at:
  # https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
  # Calculates mean pollutant levels for a specified sequence of monitors
  # Takes as input the file directory where there is one csv file for each monitor
  # Each such file contains sulphate and nitrate level information for each day of the year
  # Files may contain NA values, which need to be discarded from the mean calculation
  
  
  #setting the working directory to specdata
  current_wd<-getwd()
  old_wd<-"C:/Users/krupakar_singampally/Documents"
  if (current_wd==old_wd){setwd(directory)}
  
  
  #initialize vector of monitor means
  df<-data.frame(date=numeric(), sulf=numeric(),nitr=numeric())
  
  #initialize pollutant index
  if (pollutant=="sulfate") {pol=2}
  else {pol=3}
  
  
  #initialize vector of files
  file_list<-dir()
 
  
  #in a loop, open each data file, calculate the mean for the pollutant
  #Store the mean in the means vector
  for (i in 1:length(id)){
      j=id[i]
      file_i=read.csv(file_list[j])
      df<-rbind(df,file_i)
      
    }
    
  
  #Computes mean across the selected files
  pol_mean=mean(df[,pol],na.rm = TRUE)
  print(pol_mean)
}