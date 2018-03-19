#' Create mrt plot
#'
#' Creates a survival curve plot from a mrt_table object.
#' @param data mrt_table object created using make_mrt_table
#' @import survminer
#' @export

mrt_plot <- function(data){
    fit<-survfit(Surv(time, status) ~ sample, data = data, conf.type = "log-log")
    mplot <- ggsurvplot(fit, data = st_mrt)$plot
    return(mplot)
}
