library(tidyverse)

switching_data <- read_csv("hw1 - jan. 9/data/raw/WL_switching_df.csv")

#Examining the structure of the data 
glimpse(switching_data)#examines the structure of each column - was told it is a better str()

#Examining data for problems
colSums(is.na(switching_data)) #colSums(is.na(dataframe)) shows you the missing values from each column - StackOverflow 
count(switching_data, treatment, sort = TRUE) #counts number of data points in each treatment 
count(switching_data, switch.pref) #swithcing preference is in a likert scale. However, the numeric value would need to be change to be a categorical value to be either switching or no switching

#Histogram plot for checking if there are any values that fall outside of the likert scale 
plot_one <- ggplot(switching_data, aes(x=switch.pref))+geom_histogram(binwidth = 1)
plot_one

#Scatter plot to check if baseline positive mood and post positive mood seem accurate 
plot_two <- ggplot(switching_data, aes(x = pos.baseline, y = pos.post)) + geom_point()
plot_two + theme(legend.position = "none")

#Fixing problems and restructuring so it is ready for analysis
switching_data <- (switching_data |> mutate(treatment = as.factor(treatment), gender = as.factor(gender)))
 
#saving file as RDS
saveRDS(switching_data,
        file = ("hw2Jan16/data/clean/wl_switching_clean.rds"))
                   
        