\name{cycloids-package}
\alias{cycloids-package}
\alias{cycloids}
\docType{package}
\title{
Calculating coordinate representations of hypocycloids, epicyloids,
 hypotrochoids, and epitrochoids
}
\description{
Functions for calculating coordinate representations of hypocycloids,
 epicyloids, hypotrochoids, and epitrochoids (altogether called
 'cycloids' here) with different scaling and positioning options.
 The cycloids can be visualised with any appropriate graphics
 function in R.
}
\details{
\tabular{ll}{
Package: \tab cycloids\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-10-24\cr
License: \tab GPL-3\cr
}
This package has been written for calculating cartesian coordinate
 representations of hypocycloids, epicyloids, hypotrochoids, and
 epitrochoids (altogether called 'cycloids' here). These can be
 easily visualized with any R graphic routine that
 handles two-dimensional data. All examples shown here use
 standard R graphics. While there are technical applications, the
 main purpose of this package is to create mathematical artwork.
\cr
 Geometrically, cycloids in the sense of this package are generated as
 follows (Figure 1, 2): Imagine a circle \eqn{cfix}, with radius
 \eqn{A}, which is fixed on a plane. Another circle, \eqn{cmov},
 with radius \eqn{a}, is rolling along \eqn{cfix}'s circumference
 at the outside of \eqn{cfix}. The figure created by the trace of
 a point on \eqn{cmov}'s circumference is called an epicycloid (Figure 1A).
 If \eqn{cmov} is rolling not at the outside but at the inside of
 \eqn{cfix}, the trace of a point on \eqn{cmov}'s circumference
 is called a hypocycloid (Figure 2A).
\cr
 If in both cases the tracepoint is not located on
 \eqn{cmov}'s circumference but at a fixed distance from its midpoint
 either in- or outside cmov, the resulting figure is an epitrochoid (Figure 1B, C)
 or a hypotrochoid (Figure 2B, C), respectively. Hypotrochoids and epitrochoids
 became quite popular through toys like the spirograph.
\cr
 The most important functions of the package are
 \code{\link{zykloid}}, \code{\link{zykloid.scaleA}},
 \code{\link{zykloid.scaleAa}}, and \code{\link{zykloid.scaleP}}.
\cr
 \if{html}{\figure{Figure1.png}{options: width="500" height="500"}}
 \if{latex}{\figure{Figure1.png}}
 \if{html}{\figure{Figure2.png}{options: width="500" height="500"}}
 \if{latex}{\figure{Figure2.png}}
}
\author{
Peter Biber\cr
 Maintainer: Peter Biber <castor.fiber@gmx.de>
}
\references{
Bronstein IN, Semendjaev KA, Musiol G, Muehlig H (2001): Taschenbuch der
 Mathematik, 5th Edition, Verlag Harri Deutsch, 1186 p. (103 -- 105)\cr
\cr
 http://en.wikipedia.org/wiki/Epicycloid\cr
\cr
 http://en.wikipedia.org/wiki/Hypocycloid\cr
\cr
 http://en.wikipedia.org/wiki/Epitrochoid\cr
\cr
 http://en.wikipedia.org/wiki/Hypotrochoid\cr
\cr
 http://en.wikipedia.org/wiki/Spirograph\cr
}
\keyword{ math }
\keyword{ graphs }
\seealso{
\code{\link{zykloid}}, \code{\link{zykloid.scaleA}},
 \code{\link{zykloid.scaleAa}}, \code{\link{zykloid.scaleP}}
}
\note{
Type \code{demo(cycloids)} for seeing some examples.
}
\examples{

library(cycloids)

# Create and plot a hypocycloid, a hypotrochoid, an epicycloid,
# and an epitrochoid, all of them with radii A = 5 and a = 3
npeaks(5, 3)  # The cycloids will have five peaks
# The hypocycloid
cyc <- zykloid(A = 5, a = 3, lambda = 1, hypo = TRUE)
plot(y ~ x, data = cyc, type = "l", asp = 1, xlim = c(-12, 12),
     ylim = c(-12, 12), main = "A = 5, a = 3")
# The hypotrochoid
cyc <- zykloid(A = 5, a = 3, lambda = 1/2, hypo = TRUE)
lines(y ~ x, data = cyc, type = "l", asp = 1, col = "green")
# The epicycloid
cyc <- zykloid(A = 5, a = 3, lambda = 1, hypo = FALSE)
lines(y ~ x, data = cyc, type = "l", col = "red")
# The epitrochoid
cyc <- zykloid(A = 5, a = 3, lambda = 1/2, hypo = FALSE)
lines(y ~ x, data = cyc, type = "l", col = "blue")
legend("topleft", c("hypocycloid", "hypotrochoid", "epicycloid",
       "epitrochoid"), lty = rep("solid", 4),
       col = c("black", "green", "red", "blue"), bty = "n")



# Same Framework, different shape: A = 17, a = 5
npeaks(17, 5)  # The cycloids will have seventeen peaks
# The hypocycloid
cyc <- zykloid(A = 17, a = 5, lambda = 1, hypo = TRUE)
plot(y ~ x, data = cyc, type = "l", asp = 1, xlim = c(-27, 27),
     ylim = c(-27, 27), main = "A = 17, a = 5")
# The hypotrochoid
cyc <- zykloid(A = 17, a = 5, lambda = 1/2, hypo = TRUE)
lines(y ~ x, data = cyc, type = "l", asp = 1, col = "green")
# The epicycloid
cyc <- zykloid(A = 17, a = 5, lambda = 1, hypo = FALSE)
lines(y ~ x, data = cyc, type = "l", col = "red")
# The epitrochoid
cyc <- zykloid(A = 17, a = 5, lambda = 1/2, hypo = FALSE)
lines(y ~ x, data = cyc, type = "l", col = "blue")
legend("topleft", c("hypocycloid", "hypotrochoid", "epicycloid",
       "epitrochoid"), lty = rep("solid", 4),
       col = c("black", "green", "red", "blue"), bty = "n")



# Pretty - a classic Spirograph pattern with the same settings 
# for A (5) and a (3) as in the first example.
# Varying parameters (here: lambda) within a loop often gives
# nice results.
op <- par(mar = c(0,0,0,0)) # no plot margins
lambdax <- seq(0.85, by = -0.05, length.out = 14)
ccol <- rep(c("blue", "blue", "red", "red"), 4)
plot.new()
plot.window(asp = 1, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5))
# draw fourteen hypotrochoids with decreasing lambda
for (i in c(1:14)) {
     z <- zykloid(5, 3, lambdax[i])     
     lines(y ~ x, data = z, type = "l", col = ccol[i])
} # for i
par(op) # set graphics parameters back to original values



# A bit more of the same kind to get the big picture...
op <- par(mar = c(0,0,0,0)) # no plot margins
lambdax <- seq(1, by = -0.05, length.out = 16)
ccol <- rep(c("blue", "blue", "red", "red"), 4)
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
# first loop: sixteen epitrochoids with decreasing lambda
for (i in 1:16) {
     z <- zykloid(5, 3, lambdax[i], hypo = FALSE) 
     lines(y ~ x, data = z, type = "l", col = ccol[i])
} # for i - first loop
# first loop: sixteen epitrochoids with decreasing lambda
for (i in 1:16) {
     z <- zykloid(5, 3, lambdax[i], hypo = TRUE)     
     lines(y ~ x, data = z, type = "l", col = ccol[i])
} # for i - second loop
par(op) # set graphics parameters back to original values



# Show off with an example for zykloid.scaleP
#    No plot margins, and ... paint it black
op <- par(mar = c(0,0,0,0), bg = "black")
lambdax <- seq(2, 0.0, -0.05) # Note: some lambdas are greater than 1
ccol <- rep(c("lightblue", "lightblue", "yellow", "yellow", "yellow"), 9)
plot.new()
plot.window(asp = 1, xlim = c(-1, 1), ylim = c(-1, 1))
for (ll in c(1:length(lambdax))) {
     z <- zykloid.scaleP(A = 7, a = 5, hypo = TRUE, lambda = lambdax[ll]) 
     lines(y ~ x, data = z, col = ccol[ll])
} # for ll
par(op) # set graphics parameters back to original values



# Spiky Flower with zykloid.scaleA and zykloid
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-150, 150), ylim = c(-150, 150))
z <- zykloid.scaleA(A = 90, a = 32, lambda = 1, Radius = 150, hypo = TRUE)
lines(y ~ x, data = z, col = "lightblue")
for (ll in seq(2, 0.8, -0.4)) {
     if (ll == 2) ccol <- "royalblue"
     else         ccol <- "plum"
     z <- zykloid(A = 90, a = 32, lambda = ll, hypo = TRUE, steps = 360, start = pi/2)
     lines(y ~ x, data = z, col = ccol)
} # for ll
par(op)



}
