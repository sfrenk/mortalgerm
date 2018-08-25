# Visualize and analyze mrt assay data

This R package provides functions to create plots and run statistics and power analyses for mrt assays. Use the make_mrt_table function to convert the input data.frame into a mrt_table object, which can then be used for plotting and statistics.

### make_mrt_table()
Create a mrt_table object from a data frame containing mrt assay data for one or more strains. Input dataframe should have two columns, with generation number in the first and percentage of fertile individuals in the second. 

### mrt_plot()
Create a survival curve plot from a mrt_table object.

### perform_logranks()
Perform pairwise logrank tests between samples in a mrt_table object.


## Installation
Open the R console (or Rstudio) and run the following:

```R
library(devtools)
install_github("sfrenk/mortalgerm")
```

## Usage example
Let's say you have an excel file with four columns: Generation, then number of fertile lines for wild-type, *trt-1* and *trt-1 dcr-1*. Save this file as a csv and load it into R:

```R
mrt_assay_data <- read.csv("test_data.csv")
```

Convert the dataframe to a mrt table:

```R
mrt <- make_mrt_table(mrt_assay_data)
```

Perform pairwise logranks and save p-values as a csv file (which can be loaded into excel). Using correction (Bonferroni) is generally a good idea:

```R
results <- perform_logranks(mrt, correct = TRUE)
write.csv(results, "mrt_assay_pvals.csv", quote = FALSE)
```

You can also make a plot of the data. The plot object created by mrt_plot() is of the ggplot2 class, so you can change the theme etc.:

```R
mrt_assay_plot <- mrt_plot(mrt) 
mrt_assay_plot <- mrt_assay_plot + scale_y_continuous(labels = function(x) x *100) + ylab("Percent fertile")
ggsave("mrt_assay_plot.png", mrt_assay_plot)
```