---
  title: "Blood Transfusion Analysis"
output: html_notebook
---
  
  ```{r error=TRUE}
# load data
load("vein_lifespans.Rda")
load("artery_lifespans.Rda")
```

```{r error=TRUE}
# view vein_lifespans here:
head(vein_lifespans)
```

```{r error=TRUE}
# calculate vein_lifespans_mean here:
vein_lifespans_mean <- mean(vein_lifespans)
print(vein_lifespans_mean)

```

```{r error=TRUE}
# calculate vein_lifespans_sd here:
vein_lifespans_sd <- sd(vein_lifespans)
print(vein_lifespans_sd)
```

```{r error=TRUE}
# perform one sample t-test here:
vein_pack_test <- t.test(vein_lifespans, mu = 71)
print(vein_pack_test)

```

```{r error=TRUE}
# view artery_lifespans here:
head(artery_lifespans)
```

```{r error=TRUE}
# calculate artery_lifespans_mean here:
artery_lifespans_mean <- mean(artery_lifespans)

```

```{r error=TRUE}
# calculate artery_lifespans_sd here:
artery_lifespans_sd <- sd(artery_lifespans)

```

```{r error=TRUE}
# perform two sample t-test here:
artery_lifespans <- t.test(vein_lifespans, artery_lifespans)
print(artery_lifespans)
```