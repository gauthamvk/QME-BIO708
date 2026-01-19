library(tidyverse)

clean_switching_data <- readRDS("hw2Jan16/data/clean/wl_switching_clean.rds")
clean_switching_data

wl_plot <- ggplot(clean_switching_data, aes(x = treatment, y = switch.pref)) + #did a box plot as it helps me visualize what the pattern in preferences to switch were depending on the treatment
    geom_boxplot(alpha = 0.25) + geom_jitter(aes(color = treatment))
                                             height=0, width = 0.25)
wl_plot + theme(legend.position = "none")

## BMB: stat_sum or geom_beeswarm might be nicer? jittering with height>0
## is probably unwanted here

gg0 <- ggplot(clean_switching_data, aes(x = treatment, y = switch.pref,
                                        color = treatment))

gg0 + stat_sum()
library(ggbeeswarm)
gg0 + geom_beeswarm()

## mark: 2



