#' Create mrt plot
#'
#' Creates a survival curve plot from a mrt_table object.
#' @param data mrt_table object created using make_mrt_table
#' @export
#' @examples
#' mrt_plot()

mrt_plot <- function(data){
    plot <- ggplot(data = data)+
        geom_line(aes(x = generation, y = percent_viable, color = strain), size = 2)+
        theme_bw()+
        xlab("Generation")+
        scale_x_continuous(breaks = seq(min(x$generation), max(x$generation), 2), expand = c(0,0))+
        ylab("Percent Viable")+
        scale_y_continuous(breaks = seq(0, 100, 10), expand = c(0,0))+
        theme(
            text = element_text(size = 20),
            legend.title=element_blank(),
            legend.position = c(0.75, 0.75),
            axis.line.x = element_line(color="black", size = 2),
            axis.line.y = element_line(color="black", size = 2),
            panel.grid.major = element_line(size = 0.5, color = "grey"),
            legend.background = element_rect(colour = "black")
        )
    return(plot)
}
