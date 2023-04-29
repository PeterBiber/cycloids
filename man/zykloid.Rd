\name{zykloid}
\alias{zykloid}
\title{
Core function for calculating coordinate representations of
 hypocycloids, epicyloids, hypotrochoids, and epitrochoids
 (altogether called 'cycloids' here)
}
\description{
This is the package's core function for calculating cycloids.
 These are represented by a set of two-dimensional point
 coordinates. Although this function provides the essential
 mathematics, you may want to use the wrappers \code{\link{zykloid.scaleA}},
 \code{\link{zykloid.scaleAa}}, and \code{\link{zykloid.scaleP}}
 due to their convenient scaling and positioning options.
}
\usage{
zykloid(A, a, lambda, hypo = TRUE, steps = 360, start = pi/2)
}
\arguments{
  \item{A}{
The Radius of the fixed circle \eqn{cfix}. Must be an integer Number > 0.
}
  \item{a}{
The radius of the moving circle \eqn{cmov}. Must be an integer Number > 0.
 Together with \eqn{A}, \eqn{a} determines the resulting cycloid's shape and
 number of peaks which can be calculated with \code{\link{npeaks}}.
}
  \item{lambda}{
The distance of the tracepoint from the moving circle's (\eqn{cmov})
 centre in relative units of its radius \eqn{a}. \eqn{lambda = 1} means that
 the tracepoint is located on \eqn{cmov}'s circumference. For \eqn{lambda < 1},
 the tracepoint is on \eqn{cmov}'s area, e.g. if \eqn{lambda = 0.5}, it is
 halfway between \eqn{cmov}'s centre and its circumference. If \eqn{lambda > 1}
 the tracepoint is outside \eqn{cmov}'s area, you might imagine it
 being attached to a rod which is attached to \eqn{cmov} and crosses
 its centre. E.g. \eqn{lambda = 2} would mean that the tracepoint's
 distance from cmov's centre equals \eqn{2*a}. \eqn{lambda = 0} produces a
 circle because the tracepoint is identical with \eqn{cmov}'s centre.
}
  \item{hypo}{
logical. If TRUE, the resulting figure is a hypocycloid (\eqn{lambda = 1})
 or a hypotrochoid (\eqn{lambda != 1}), because \eqn{cmov} is rolling
 along the inner side of the fixed circle (\eqn{cfix}). If FALSE,
 an epicycloid (\eqn{lambda = 1}) or an epitrochoid \eqn{lambda != 1}
 is generated, as \eqn{cmov} is rolling at the outside of \eqn{cfix}'s
 circumference.
}
  \item{steps}{
positive integer. The number of steps per circuit of the moving
 circle (\eqn{cmov}) for which tracepoint positions are calculated.
 The default, 360, means steps of 1 degree for the movement of
 \eqn{cmov}. Analogously, steps = 720 would mean steps of 0.5 degrees.
}
  \item{start}{
Start angle (radians) of the moving circle's (\eqn{cmov}) centre
 counterclockwise to the horizontal with the fixed circle's (\eqn{cfix})
 centre as the pivot. The tracepoint will start at a peak.
}
}
\details{
Geometrically, cycloids in the sense of this package are generated as
 follows (Figure 1, 2): Imagine a circle \eqn{cfix}, with radius \eqn{A},
 which is fixed on a plane. Another circle, \eqn{cmov}, with radius
 \eqn{a}, is rolling along \eqn{cfix}'s circumference at the outside
 of \eqn{cfix}. The figure created by the trace of a point on
 \eqn{cmov}'s circumference is called an epicycloid (Figure 1A).
 If \eqn{cmov} is rolling not at the outside but at the inside of
 \eqn{cfix}, the trace of a point on \eqn{cmov}'s circumference
 is called an hypocycloid (Figure 2A).
\cr
 If in both cases the tracepoint is not located on \eqn{cmov}'s
 circumference but at a fixed distance from its midpoint
 either in- or outside \eqn{cmov}, the resulting figure is an
 epitrochoid (Figure 1B, C) or a hypotrochoid (Figure 2B, C),
 respectively.
\cr
 With the arguments of zykloid as defined above, the centre of \eqn{cfix}
 in the origin, and \eqn{phi} being the counterclockwise angle of
 \eqn{cmov}'s midpoint against the start position with \eqn{cfix}'
 centre as the pivot, the cartesian coordinates of a point on the
 cycloid are calculated as follows:
\cr
\cr
 \eqn{x = (A + a) * cos(phi + start) - lambda * a * cos((A + a)/a * phi + start)}
\cr
 \eqn{y = (A + a) * sin(phi + start) - lambda * a * sin((A + a)/a * phi + start)}
\cr
\cr
 \if{html}{\figure{Figure1.png}{options: width = "500" height = "500"}}
 \if{html}{\figure{Figure2.png}{options: width = "500" height = "500"}}
}
\value{
A dataframe with the columns \eqn{x} and \eqn{y}. Each row
 represents a tracepoint position. The positions are ordered along
 the trace with the last and the first point being identical in
 order to warrant a closed figure when plotting the data.
}
\references{
Bronstein IN, Semendjaev KA, Musiol G, Muehlig H (2001): Taschenbuch
 der Mathematik, 5th Edition, Verlag Harri Deutsch, 1186 p.
 (103 - 105)\cr
\cr
 http://en.wikipedia.org/wiki/Epicycloid\cr
\cr
 http://en.wikipedia.org/wiki/Hypocycloid\cr
\cr
 http://en.wikipedia.org/wiki/Epitrochoid\cr
\cr
 http://en.wikipedia.org/wiki/Hypotrochoid
}
\author{
Peter Biber
}
\seealso{
\code{\link{zykloid.scaleA}},
 \code{\link{zykloid.scaleAa}}, \code{\link{zykloid.scaleP}}
}
\examples{

# Very simple example
cycl <- zykloid(A = 17, a = 9, lambda = 0.9, hypo = TRUE)
plot(y ~ x, data = cycl, asp = 1, type = "l")


# More complex: Looks like a passion flower
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-23, 23), ylim = c(-23, 23))
ll   <- seq(2, 0, -0.2)
ccol <- rep(c("lightblue", "lightgreen", "yellow", "yellow",
              "yellow"), 2)
for (i in c(1:length(ll))) {
     z <- zykloid(A = 15, a = 7, lambda = ll[i], hypo = TRUE)
     lines(y ~ x, data = z, col = ccol[i])
} # for i
par(op)


# Dense hypotrochoids
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5))
m <- zykloid(A = 90, a = 89, lambda = 0.01)
lines(y ~ x, data = m, col = "grey")
m <- zykloid(A = 90, a = 89, lambda = 0.02)
lines(y ~ x, data = m, col = "red")
m <- zykloid(A = 90, a = 89, lambda = 0.015)
lines(y ~ x, data = m, col = "blue")
par(op)


# Fragile star
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-14, 14), ylim = c(-14, 14))
l.max <- 1.6
l.min <- 0.1
ll <- seq(l.max, l.min, by = -1 * (l.max - l.min)/30)
n  <- length(ll)
ccol <- rainbow(n, start = 2/3, end = 1)
for (i in c(1:n)) {
    m <- zykloid(A = 9, a = 8, lambda = ll[i])
    lines(y ~ x, data = m, type = "l", col = ccol[i])
}  # for i
par(op)


}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
\keyword{ graphs }% __ONLY ONE__ keyword per line
