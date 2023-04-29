\name{npeaks}
\alias{npeaks}
\title{
Calculates the number of a cycloid's peaks based on the radii A
 (fixed circle) and a (moving circle)
}
\description{
This function may be useful for calculating the number \eqn{n} of peaks
 a cycloid (\code{\link{zykloid}}) based on the radii \eqn{A} (fixed
 circle) and \eqn{a} (moving circle) will have. The equation for \eqn{n} is\cr
 \cr
 \eqn{n = kgV(A, a)/a}\cr
 \cr
 where \eqn{kgV(A, a)} is the least common multiple of \eqn{A} and \eqn{a} as
 implemented in the function \code{\link{kgV}}
}
\usage{
npeaks(A, a)
}
\arguments{
  \item{A}{
A natural number (integer value > 0)
}
  \item{a}{
A natural number (integer value > 0)
}
}
\value{
A natural number if \eqn{A} and \eqn{a} are natural numbers. In any other
 case, the function returns NA.
}
\author{
Peter Biber
}
\seealso{
\code{\link{kgV}}, \code{\link{ggT}}, \code{\link{zykloid}}
}
\examples{

npeaks(18, 6)      #  3
npeaks(38, 105)    # 38
npeaks(36, 9)      #  4
npeaks(12, 9)      #  4
npeaks(9, 12)      #  3
npeaks(-5, 12)     # NA - only integer numbers > 0 allowed
npeaks(3, 0)       # NA - only integer numbers > 0 allowed
npeaks(3.2, 12)    # NA - only integer numbers > 0 allowed

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
