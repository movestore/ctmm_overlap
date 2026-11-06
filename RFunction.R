library(ctmm)
library(dplyr)
library(tidyr)
library(tibble)

rFunction <- function(data, method = "Bhattacharyya") {
  if (length(data[[2]]) < 2) {
    stop(
      "The input must contain at least 2 individuals to ",
      "measure home range overlap."
    )
  }

  ov <- overlap(data[[2]], method = method)

  # Round to 4 digits to make output more legible.
  ov$CI <- round(ov$CI, 4)

  # Matrix of the overlap estimates between each pair of individuals
  est <- ov$CI[, , 2]
  res <- data.frame(individual = rownames(est), est, check.names = FALSE)
  write.csv(
    res,
    file = appArtifactPath("overlap_summary_matrix.csv"),
    row.names = FALSE
  )

  # Long-format table of overlap estimates and CIs for each pair of animals
  ids <- rownames(ov$CI)
  
  res <- bind_cols(
    ov$CI[, , 1] |> 
      as.data.frame() |> 
      rownames_to_column(var = "from") |> 
      pivot_longer(-from, names_to = "to", values_to = "low"),
    ov$CI[, , 2] |> 
      as.data.frame() |> 
      rownames_to_column(var = "from") |> 
      pivot_longer(-from, names_to = "to", values_to = "est") |> 
      select(est),
    ov$CI[, , 3] |> 
      as.data.frame() |> 
      rownames_to_column(var = "from") |> 
      pivot_longer(-from, names_to = "to", values_to = "high") |> 
      select(high)
  )
  
  # Remove duplicated combinations of animals so each pair appears once
  res <- res |>
    filter(match(from, ids) < match(to, ids))
  
  write.csv(
    res,
    file = appArtifactPath("overlap_summary_long.csv"),
    row.names = FALSE
  )

  return(data)
}