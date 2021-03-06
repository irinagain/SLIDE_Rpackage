% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Models.R
\name{generateModel2}
\alias{generateModel2}
\title{Generate data from SLIDE model for three views.}
\usage{
generateModel2(n = 100, pvec = c(100, 100, 100), snr = 1, orthogonalV = T)
}
\arguments{
\item{n}{An integer specifying the number of matched samples, the default value is 100.}

\item{pvec}{A vector of integer values p_1, p_2, p_3 corresponding to the number of measurements within each data view. The default value is \code{pvec = c(100,100,100)}.}

\item{snr}{A non-negative value specifying the ratio between the Frobenius norm of the signal matrix and the Frobenius norm of the noise matrix. This value determines the variance of the elements in the noise matrix. The default value is 1.}

\item{orthogonalV}{A logical indicating whether the loading vectors should be generated orthogonal to each other, the default value is TRUE.}
}
\value{
A list with the elements
  \item{X}{A n x (p_1 + p_2 + p_3) concatenated data matrix of views X_1, X_2, X_3.}
  \item{pvec}{The supplied values of \code{pvec}.}
  \item{sigmavec}{A vector of values s_1, s_2, s_3 corresponding to standard deviations of the elements of noise matrix for each data view.}
  \item{U}{The score matrix from the SLIDE model.}
  \item{V}{The loadings matrix from the SLIDE model.}
  \item{snr}{The supplied value of \code{snr}.}
}
\description{
Generates three matched datasets from SLIDE model with rank 2 for each type of structure (shared, partially-shared and individual).
}
\details{
Generates X_1 (n x p_1), X_2 (n x p_2) and X_3 (n x p_3) according to the additive noise model \deqn{X_1 = Z_1 + E_1, X_2 = Z_2 + E_2, X_3 = Z_3 + E_3,} where noise matrices \eqn{E_1, E_2, E_3} have independent entries from normal distribution with mean zero, and standard deviations according to \code{sigmavec}, and signal matrix \eqn{Z=[Z_1, Z_2, Z_3]} is generated using SLIDE decomposition
\deqn{Z = UV',}
where U (n x 14) is generated using uniform distribution on [0,1] with subsequent centering and standardization, and V (p x 14) is generated as a block-sparse matrix with orthogonal columns so that the rank of each structure (shared, partially-shared, individual) is two.
}
\examples{
data <- generateModel2(n = 100, pvec = c(100,100,100), snr = 1)
data <- generateModel2(n = 50, pvec = c(25,100,40), snr = 2)
}
