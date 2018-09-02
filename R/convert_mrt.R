#' Make a mrt_table object from generation, count and censoring data for one sample
#'
#' Creates a mrt
#' @param gen vector of generations
#' @param count vector of counts (number of individuals still alive) at each generation
#' @param censor_col optional vector of number of censored individuals at each generation
#' @export

convert_mrt <- function(gen, count, censor_col = NULL){
    
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
    
    # Account for individuals that are still alive at the end
    if (prev_count > 0){
        samples <- data.frame("time" = rep(gen[length(gen)], prev_count), "status" = (rep(0, prev_count)))
        data_frame_out <- rbind(data_frame_out, samples)
        
    }
    return(data_frame_out)    
}
