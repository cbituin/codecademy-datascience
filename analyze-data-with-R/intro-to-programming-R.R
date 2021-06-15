---
  title: "Day of the Race"
output: html_notebook
---
  
  ```{r}
# create friends vector here:
friends <- c('Megan', 'Janet', 'Tina')
```

```{r}
# add on to the list here:
info_list <- list(
  Esther = list(
    jersey = 3432,
    color = "purple"
  ),
  Feng = list(
    jersey = 4221,
    color = "blue"
  ),
  Megan = list(
    jersey = 1363,
    color = "green" 
  ),
  Janet = list(
    jersey = 6729,
    color = "green"
  ),
  Tina = list(
    jersey = 7501,
    color = "orange"
  )
)
```

```{r}
print_information <- function(name) {
  print(paste(name, "is #", info_list[[name]]$jersey, "wearing the color", info_list[[name]]$color))
}
# call the print_information function on the friends vector:
for (friend in friends) {
  print_information(friend)
}
```

```{r}
race_results <- c("Gi", "Francesca", "Lea", "Vivian", "Jessica", "Esther", "Mary", "Yasmina", "Megan", "Janet", "Tiffany", "Kishan", "Feng", "Z", "Tina")
```

```{r}
# write find_place() here:
find_place <- function(runner) {
  match(runner, race_results)
}

```


```{r}
# call and apply find_place() here:
find_place('Tiffany')

lapply(friends, find_place)
sapply(friends, find_place)

```