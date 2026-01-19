library(tidyverse)

clean_switching_data <- readRDS("hw2Jan16/data/clean/wl_switching_clean.rds")
clean_switching_data

wl_plot <- ggplot(clean_switching_data, aes(x = treatment, y = switch.pref)) + #did a box plot as it helps me visualize what the pattern in preferences to switch were depending on the treatment
  geom_boxplot(alpha = 0.25) + geom_jitter(aes(color = treatment))
wl_plot + theme(legend.position = "none")
