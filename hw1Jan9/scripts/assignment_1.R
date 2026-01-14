library(tidyverse)

## JD: Moved your directory to a simpler, space-free name, sorry.
## JD: The way to confirm you are running this from the assignment directory is that the data path is relative to that (i.e., starts from there).

switching_data <- read_csv("hw1Jan9/data/raw/WL_switching_df.csv") #Data is from the previous PhD student who worked in Reuven's lab. 
wl_switch <- select(switching_data, participant.ID, treatment, switch.pref) #selecting only the appropriate columns necessary for the analysis
wl_switch <- wl_switch %>% #creating a new column that assigns the likert scale values of switching preferece to a binary value for analysis
  mutate(
    switched = if_else(switch.pref >= 3, "switch", "no_switch")) #Values above 3 has been characterized as preference for switching and under 3 for not switching
wl_switch

## JD: This is all reasonable, but we should talk at some point about advantages and disadvantages of dichotomization

switch_counts <- wl_switch %>% 
  count(treatment, switched)
switch_counts

chisq.test(table(wl_switch$treatment, wl_switch$switched))

## JD: Grade 2/3
