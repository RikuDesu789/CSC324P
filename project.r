library("dplyr")
dt <- read.csv("/Users/rikusmriga/Desktop/j2_data.csv")

dt %>% tail(5)
```

```{r}
dt %>%
  filter(Insomnia == max(dt["Insomnia"]))%>%
  head(5)

dt %>%
  filter(OCD == max(dt["OCD"]))%>%
  head(5)

dt %>%
  filter(Anxiety == max(dt["Anxiety"]))%>%
  head(5)
  
dt %>%
  select(Age, starts_with("Frequency"))%>%
  head(5)

dt %>%
  select('Age', 'Anxiety', 'Depression', 'OCD', 'Insomnia')%>%
  head(5)

dt %>%
  select(2, 3)%>%
  head(5)

dt %>%
  select(-c('Age', 'Anxiety', 'Depression', 'OCD', 'Insomnia'))%>%
  head(5)

dt %>%
  select("Timestamp":"Composer")%>%
  head(5)

dt %>%
  arrange(Age)%>%
  head(5)


dt %>%
  group_by(Insomnia) %>%
  summarise(mean_age = mean(Age),
            mean_Depression = mean(Depression),
            mean_Anxiety = mean(Anxiety))%>%
  head(5)

dt %>% mutate(Music.effects.new = ifelse(Music.effects == "Improve", 1, 0))%>%
  head(5)

dt %>% mutate(BPM_category = ifelse(BPM > 100, "fast", "slow"))%>%
  head(5)

dt %>% mutate(rounded_hpd = round(Hours.per.day, 0))%>%
  head(5)

library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)

iris %>%
  pivot_longer(
    c(Petal.Length, Petal.Width),
    names_to = "Attribute",
    values_to = "Measurement") %>%
  select(Species, Attribute, Measurement) %>%
  qplot(Attribute, Measurement,
        geom = "boxplot",
        facets = . ~ Species, data = .)