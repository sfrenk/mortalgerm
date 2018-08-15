context("mark_mrt_table")

test_that("make_mrt_table_works", {
    
    input_df <- data.frame("Generation" = c("F1", "F2", "F3", "F4", "F5"), "WT" = c(10, 10, 9, 5, 0))
    exp_output <- data.frame("time" = factor(c("F3", rep("F4", 4), rep("F5", 5)), levels = c("F1", "F2", "F3", "F4", "F5")), "status" = 1, "sample" = "WT", stringsAsFactors = FALSE)
    output <- make_mrt_table(input_df)
    
    expect_true(identical(exp_output, output))
})