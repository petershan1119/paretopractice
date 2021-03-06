#' Maximum Likelihood Estimator for gamma dist.
#'
#' mle_gamma function will calculate mle estimate for the shape parameter "k" and the scale parameter "theta"
#' by using given sample. Since there is no closed form of the mle for gamma disttribution, mle_gamma used uniroot function from stats package.
#'
#' @param sample_g the given sample
#' @return A 2 by 1 vector
#' @examples
#' my_sample <- rgamma(50, shape=2, scale=.3)
#' mle_gamma(my_sample)
#' @export
mle_gamma <- function(sample_g) {
  # calculate MOME as an initial value
  x_bar <- mean(sample_g)
  x2_bar <- mean(sample_g^2)
  mom_theta <- (x2_bar - x_bar^2) / x_bar
  mom_k <- x_bar / mom_theta

  # equation for k
  f <- function(k) {
    mean(log(sample_g)) - log(mean(sample_g)/k) - digamma(k)
  }

  # mle
  mle_k <- stats::uniroot(f, mom_k + c(-2, 2))
  mle_theta <- mean(sample_g) * (1 / mle_k$root)

  # result
  c(k_hat = mle_k$root, theta_hat = mle_theta)
}
