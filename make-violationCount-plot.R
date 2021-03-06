library(tidyverse)
library(distill)
library(ggthemes)
library(plotly)
library(gganimate)

rawdata <- read_csv("traffic_violaions.csv")

violationCount <- rawdata |>
  group_by(violation) |>
  summarize(count=n()) |>
  drop_na(violation) |>
  ggplot(aes(x=violation, 
             y=count, 
  )) +
  geom_col(fill="white") +
  theme(plot.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "darkgrey"),
        panel.grid.minor.x = element_blank()) +
  labs(title="A Comparison Between Different Violations",
       subtitle="From least to greatest frequency of violations",
       x="Different Types of Violations",
       y="Number of Violations")

write_rds(violationCount, "violationCount.rds")
