#' Make a mrt_table object from a dataframe containing survival data for one or more samples
#'
#' Creates a mrt_table object from a data frame containing mrt assay data.
#' @param data Data frame containing mrt assay data. Generation number must be in the first column, and the remaining columns must contain the number of viable plates for a given strain at the specified generations.
#' @param censored Optional data frame containing number of censored individuals at each generation, with the same column order as data.
#' @export

make_mrt_table <- function(data, censored = NULL){
    mrt_data <-  data_frame_out <- data.frame("time" = numeric(), "status" = numeric(), "sample" = character())
    for (i in 2:ncol(data)){
        if (missing(censored)){
            mrt_sample <- convert_mrt(gen = data[,1], count = data[,i])
        } else {
            mrt_sample <- convert_mrt(gen = data[,1], count = data[,i], censor_col = censored[,i])
        }
        mrt_sample$sample <- colnames(data)[i]
        mrt_data <- rbind(mrt_data, mrt_sample)
    } 
    return(mrt_data)
}
