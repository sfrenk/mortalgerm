context("perform_logranks")

test_that("test_logrank_test", {
    input_df <- data.frame(time = seq(1, 10,1), status =  c(rep(1,5), c(1,1,0,0,0)), sample = c(rep("WT", 5), rep("mrt", 5)))
    pval <- perform_logranks(input_df)
    
    expect_equal(round(as.data.frame(pval)$mrt[1],3), 0.002)
})