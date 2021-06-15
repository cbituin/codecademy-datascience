---
  title: "Standard Deviation"
output: html_notebook
---
  ```{r message=FALSE, warning=FALSE, error=TRUE}
library(readr)
library(dplyr)
```

```{r error=TRUE}
load("project.Rda")
```

```{r error=TRUE}
# Change these variables to be the standard deviation of each dataset.

# Inspect Data
head(london_data)
nrow(london_data)

temp <- london_data$TemperatureC

avg_temp <- mean(temp)

print(avg_temp)

# Variance and SD for the year
temp_variance <- var(temp)
print(temp_variance)

temp_std_dev <- sd(temp)
print(temp_std_dev)

#Inspect once again
head(london_data)

# Get monthly temperature average
june <- london_data %>% filter(month == '06')

july <- london_data %>% filter(month == '07')

june_mean <- mean(june$TemperatureC)
july_mean <- mean(july$TemperatureC)

june_sd <- sd(june$TemperatureC)
print(june_sd)
july_sd <- sd(july$TemperatureC)
print(july_sd)

# Analyze by month
# Analyze by month
monthly_stats <- london_data %>%
  group_by(month) %>%
  summarize(mean = mean(TemperatureC),
            standard_deviation = sd(TemperatureC))

print(monthly_stats)
```