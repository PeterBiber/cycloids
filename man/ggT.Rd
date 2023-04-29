\name{ggT}
\alias{ggT}
\title{
Calculates the greatest common divisor of two natural numbers a
 and b based on the Euclidean Algorithm
}
\description{
The function ggT calculates the greatest common divisor of two
 natural numbers. In this package it is called by the function
 \code{\link{kgV}} which calculates the least common multiple of
 two natural numbers. The latter is needed by the function
 \code{\link{zykloid}} and by the function \code{\link{npeaks}}
 which calculates the number of peaks (or loops) a cycloid has.
 As the greatest common divisor might be useful for other
 purposes, the function ggT is accessible to external use in this
 package.
}
\usage{
ggT(a, b)
}
\arguments{
  \item{a}{
A natural number (integer value > 0)
}
  \item{b}{
A natural number (integer value > 0)
}
}
\value{
A natural number if \eqn{a} and \eqn{b} are natural numbers. In any other
 case, the function returns NA.
}
\references{
Bronstein IN, Semendjaev KA, Musiol G, Muehlig H (2001): Taschenbuch der
 Mathematik, 5th Edition, Verlag Harri Deutsch, 1186 p. (p. 333)\cr
\cr
http://en.wikipedia.org/wiki/Euclidean_algorithm
}
\author{
Peter Biber
}
\seealso{
\code{\link{kgV}}, \code{\link{npeaks}}
}
\examples{

ggT(18, 6)        # 6
ggT(38, 105)      # 1
ggT(36, 9)        # 9
ggT(12, 9)        # 3
ggT(9, 12)        # 3
ggT(-5, 12)       # NA - only integer numbers > 0 allowed
ggT(3, 0)         # NA - only integer numbers > 0 allowed
ggT(3.2, 12)      # NA - only integer numbers > 0 allowed

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
