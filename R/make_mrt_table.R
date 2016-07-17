#' Make a mrt_table object
#'
#' Creates a mrt_table object from a data frame containing mrt assay data.
#' @param data Data frame containing mrt assay data. Generation number must be in the first column, and the remaining columns must contain percentage of viable plates for a given strain at the specified generations.
#' @export
#' @examples
#' mrt_plot()

make_mrt_table <- function(x){
    x[is.na(x)] <- 0
    mrt_data <- melt(x, id = colnames(x)[1])
    colnames(mrt_data) <- c("generation", "strain", "percent_viable")
    return(mrt_data)
}