#' dpareto1 function for pareto distribution
#'
#' dpareto1 function for pareto distribution is developed.
#'
#' @param x x
#' @param alpha alpha
#' @param x_m x_m
#' @param log log
#'
#' @examples
#' dpareto1(1, 1, 1, log=TRUE)
#'
#' @export
dpareto1 <- function(x, alpha, x_m, log=FALSE) {
  input <- paste(x, alpha, x_m)
  input <- as.numeric(unlist(strsplit(input, " ")))
  input <- matrix(input, ncol=3, byrow=T)
  density <- apply(input, 1, paretodens2)
  if (any(is.nan(density))) {
    warning("All parameters should be positive.\n Nan is generated.\n")
  }
  if (log) density
  else exp(density)
}

paretodens2 <- function(input) {
  x <- input[1]
  alpha <- input[2]
  x_m <- input[3]

 if (alpha <= 0 || x_m <= 0) {
   value <- NaN
 } else if (x < x_m) {
   value <- -Inf
 } else {
   value <- log(alpha) + alpha * log(x_m) - (alpha + 1) * log(x)
 }
  value
}
