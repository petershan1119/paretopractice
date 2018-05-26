dpareto <- function(x, alpha, x_m, log=FALSE) {
  mlength <- max(length(x), length(alpha), length(x_m))

  density <- vector(mode="numeric", length=mlength)
  x <- rep(x, length.out=mlength)
  alpha <- rep(alpha, length.out=mlength)
  x_m <- rep(x_m, length.out=mlength)

  result <- .C("paretodens", as.double(x), as.double(alpha), as.double(x_m), as.integer(mlength), value=as.double(density))$value

  if (any(is.nan(result))) {
    warning("All parameters should be positive.\n NaN is generated.\n")
  }
  if (log) result
  else exp(result)
}
