#' Make a mrt_table object
#'
#' Creates a mrt_table object from a data frame containing mrt assay data.
#' @param data Data frame containing mrt assay data. Generation number must be in the first column, and the remaining columns must contain percentage of viable plates for a given strain at the specified generations.
#' @export

convert_mrt <- function(gen, count, censor_col){
    
    # Setup dataframe
    data_frame_out <- data.frame("time" = numeric(), "status" = numeric())
    prev_count <- count[1]
    for (i in 1:length(gen)){
        dead <- prev_count - count[i]
        
        # If censored column is available, account for any censored individuals and remove these from dead count
        if (!missing(censor_col)) {
            cen <- censor_col[i]
            
            if (cen > 0){
                cen_samples <- data.frame("time" = rep(gen[i], cen), "status" = (rep(0, cen)))
                data_frame_out <- rbind(data_frame_out, cen_samples)
                dead <- dead - cen
            }
        }
        
        if (dead > 0){
            samples <- data.frame("time" = rep(gen[i], dead), "status" = (rep(1, dead)))
            data_frame_out <- rbind(data_frame_out, samples)
        }
        prev_count <- count[i]
    }
    return(data_frame_out)    
}
