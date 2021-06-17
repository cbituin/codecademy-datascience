---
title: "ACLU Child Separations"
output: html_notebook
---
  # To perform your analysis, you will need access to the helpful tidyverse packages readr and dplyr. Load the libraries at the top of notebook.Rmd so you will have access to the packages' functions.
  
  ```{r message=FALSE, warning=FALSE, error=TRUE}
# load libraries
library(readr)
library(dplyr)
```
# The data from the ACLU is stored in a csv file aclu_separations.csv. Load the file into a data frame aclu to get started.

```{r error=TRUE}
# load data
aclu <- read_csv('aclu_separations.csv')
```
# It's always a good idea to inspect the data you load into R so you know what you are working with. Inspect aclu with head() and summary().

# What kind of information was loaded from the csv? What can you do with this information?

# Each row of this data frame represents a single detention center, and the number stored in column n is the number of children held at each facility. It's important to remember that a simple data point can represent a human life, and performing analyses on such data can have an immense impact on human lives.

```{r error=TRUE}
# inspect data
head(aclu)
summary(aclu)
```
# After inspecting the data frame, you see that the addr column contains the same information that is contained in the program_city and program_state columns. Select all columns from aclu but addr and save your new data frame to aclu.

```{r error=TRUE}
# select columns
aclu <- aclu %>%
  select(-addr)
```
# Print the column names of aclu. Are they clear and descriptive?

```{r error=TRUE}
# view columns
print(colnames(aclu))
```
# You know it would be better if the column names were more explicit. Update the column names of aclu as follows:
# program_city -> city
# program_state -> state
# n -> number_children
# lon -> longitude
# lat -> latitude
# Print the column names of aclu to confirm the names of the columns have been changed.

```{r error=TRUE}
# rename columns
aclu <- aclu %>%
  rename(city = program_city,
         state = program_state,
         number_children = n,
         longitude = lon,
         latitude = lat)

print(colnames(aclu))
```
# You are interested in getting an understanding of how far some of the children have been moved from the United States-Mexico border. Since latitude represents how far north or south a location is, you decide to measure how far each detention center is from the border in terms of latitude change. You find out the southernmost point of the border lies at a latitude of 25.83. Create a variable border_latitude with the value 25.83.

```{r error=TRUE}
# add column
border_latitude <- 25.83

aclu <- aclu %>%
  mutate(
    lat_change_border = latitude - border_latitude
  )

head(aclu)

```
# Now that you have a column representing a detention centers' distance from the border, you want to see which detention centers are far away from where the family separations occurred. Filter the rows of aclu to find all the detention centers where lat_change_border is greater than 15. Save this new data frame to further_away and view it.

# To better analyze the furthest detention centers from the border, arrange the rows of further_away by lat_change_border descending. Save this new data frame to further_away.

```{r error=TRUE}
# latitude change
further_away <- aclu %>%
  filter(lat_change_border > 15) %>%
  arrange(desc(lat_change_border))

head(further_away)
```
# As a concerned citizen of the world, you want to identify the detention centers that held the largest number of children. Order the rows of aclu by number_children descending and save the new data frame to ordered_by_children. View ordered_by_children.

```{r error=TRUE}
# number of children
ordered_by_children <- aclu %>%
  arrange(desc(number_children))

head(ordered_by_children)
```

# According to the data, children have been separated from their parents to detention centers located in many states. Is a state you live in, have visited, or are interested in found in the data set? Create a variable chosen_state that contains the capitalized two letter abbreviation for a state you want to check. Abbreviations for all the US States are provided in the hint below.

# Filter aclu to only include rows where the state column is equal to chosen_state. Save the new data frame to chosen_state_separations.

# Order the rows of chosen_state_separations by number_children descending and save the new data frame to chosen_state_separations. View chosen_state_separations.

# How many children were separated from their families and held in a detention center in the state you chose?

# You can change the state abbreviation stored in chosen_state to check out the results for other states.

```{r error=TRUE}
# state analysis
chosen_state <- 'TX'

chosen_state_separations <- aclu %>%
  filter(state == chosen_state) %>%
  arrange(desc(number_children))

head(chosen_state_separations)
```