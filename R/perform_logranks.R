#' Perform pairwise logrank comparisons between samples in a mrt_table object
#'
#' @param data mrt_data object
#' @param correct apply bonferroni correction to the p-values
#' @import survival
#' @export


perform_logranks <- function(data, correct = FALSE){
    samples <- unique(data$sample)
    n_comp <- ((length(samples)^2)-length(samples))/2
    print(paste0("performing ", as.character(n_comp), " comparisons between ", as.character(length(samples)), " samples"))
    
    # Set up p-value table
    results_matrix <- matrix(nrow = length(samples), ncol = length(samples), dimnames = list(samples, samples))
    
    for (i in rownames(results_matrix)){
        for (j in colnames(results_matrix)){
            if (i != j){
                result <- survdiff(Surv(time, status) ~ sample, data = data[data$sample %in% c(i, j),])
                results_matrix[i, j] <- pchisq(result$chisq, length(result$n)-1, lower.tail = FALSE)
            }
        }
    }
    
    if (correct){
        # Bonferroni correction for multiple comparisons
        
        results_matrix <- results_matrix * n_comp
        results_matrix[results_matrix>1] <- 1
    }
    return(results_matrix)
}
