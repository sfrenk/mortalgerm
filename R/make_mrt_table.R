#' Make a mrt_table object
#'
#' Creates a mrt_table object from a data frame containing mrt assay data.
#' @param data Data frame containing mrt assay data. Generation number must be in the first column, and the remaining columns must contain percentage of viable plates for a given strain at the specified generations.
#' @export

make_mrt_table <- function(data){
    mrt_data <-  data_frame_out <- data.frame("time" = numeric(), "status" = numeric(), "sample" = character())
    for (i in 2:ncol(data)){
        mrt_sample <- convert_mrt(gen = data[,1], count = data[,i])
        mrt_sample$sample <- colnames(data)[i]
        mrt_data <- rbind(mrt_data, mrt_sample)
    } 
    return(mrt_data)
}