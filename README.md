# Visualize and analyze mrt assay data

This R package provides functions to create plots and run statistics and power analyses for mrt assays. Use the make_mrt_table function to convert the input data.frame into a mrt_table object, which can then be used for plotting and statistics.

## make_mrt_table()
Create a mrt_table object from a data frame containing mrt assay data for one or more strains. Input dataframe should have two columns, with generation number in the first and percentage of fertile individuals in the second. 

## mrt_plot()
Create a survival curve plot from a mrt_table object.

## perform_logranks()
Perform pairwise logrank tests between samples in a mrt_table object.

