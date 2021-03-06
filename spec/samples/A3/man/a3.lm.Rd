% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/A3.R
\name{a3.lm}
\alias{a3.lm}
\title{A3 for Linear Regressions}
\usage{
a3.lm(formula, data, family = gaussian, ...)
}
\arguments{
\item{formula}{the regression formula.}

\item{data}{a data frame containing the data to be used in the model fit.}

\item{family}{the regression family. Typically 'gaussian' for linear regressions.}

\item{...}{additional arguments passed to \code{\link{a3.base}}.}
}
\value{
S3 \code{A3} object; see \code{\link{a3.base}} for details
}
\description{
This convenience function calculates the A3 results specifically for linear regressions. It uses R's \code{\link{glm}} function and so supports logistic regressions and other link functions using the \code{family} argument. For other forms of models you may use the more general \code{\link{a3}} function.
}
\examples{
\donttest{
 ## Standard linear regression results:

 summary(lm(rating ~ ., attitude))

 ## A3 linear regression results:

 # In practice, p.acc should be <= 0.01 in order
 # to obtain fine grained p values.

 a3.lm(rating ~ ., attitude, p.acc = 0.1)

 # This is equivalent both to:

 a3(rating ~ ., attitude, glm, model.args = list(family = gaussian), p.acc = 0.1)

 # and also to:

 a3(rating ~ ., attitude, lm, p.acc = 0.1)
 }
}

