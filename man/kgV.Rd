\name{kgV}
\alias{kgV}
\title{
Calculates the least common multiple of two natural numbers a and b
}
\description{
The function kgV calculates the least common multiple of two natural
 numbers. In this package it is used by the function \code{\link{zykloid}}
 and by the function \code{\link{npeaks}} which calculates the
 number of peaks (or loops) a cycloid has. As it might be useful
 for other purposes, it is externally available in this package.
}
\usage{
kgV(a, b)
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
 Mathematik, 5th Edition, Verlag Harri Deutsch, 1186 p. (p. 334)\cr
 \cr
http://en.wikipedia.org/wiki/Least_common_multiple
}
\author{
Peter Biber
}
\seealso{
\code{\link{npeaks}}, \code{\link{ggT}}, \code{\link{zykloid}}
}
\examples{

kgV(18, 6)          #   18
kgV(38, 105)        # 3990
kgV(36, 9)          #   36
kgV(12, 9)          #   36
kgV(9, 12)          #   36
kgV(-5, 12)         # NA - only integer numbers > 0 allowed
kgV(3, 0)           # NA - only integer numbers > 0 allowed
kgV(3.2, 12)        # NA - only integer numbers > 0 allowed

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
