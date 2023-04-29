\name{zykloid.scaleA}
\alias{zykloid.scaleA}
\title{
Wrapper for \code{\link{zykloid}} which allows to scale and position
 a cycloid by the radius A of the fixed circle and its midpoint
}
\description{
While \code{\link{zykloid}} provides the basic functionality for
 calculating cycloids, this functions allows to re-size a cycloid
 by freely setting the radius on the fixed circle. In addition,
 the cycloid can be re-positioned by locating the fix circle's
 midpoint. See Figures 1 and 2 and \code{\link{zykloid}} for the
 geometrical principles of cycloids.
}
\usage{
zykloid.scaleA(A, a, lambda, hypo = TRUE, Cx = 0, Cy = 0,
               RadiusA = 1, steps = 360, start = pi/2)
}
\arguments{
  \item{A}{
The Radius of the fixed circle before re-sizing. Must be an integer
 Number > 0. Together with \eqn{a} (see below), \eqn{A} is only
 determining the cycloid's shape and number of peaks (see
 \code{\link{npeaks}}), while its actual size is defined by the
 argument \eqn{RadiusA} (see below).
}
  \item{a}{
The radius of the moving circle before re-sizing. Must be an
 integer Number > 0. Together with \eqn{A}, \eqn{a} only determines the
 cycloid's shape and number of peaks (see \code{\link{npeaks}}),
 while its actual size is defined via the argument \eqn{RadiusA}
 (see below).
}
  \item{lambda}{
The distance of the tracepoint from the moving circle's (c\eqn{mov})
 centre in relative units of its radius \eqn{a}. \eqn{lambda = 1}
 means that the tracepoint is located on \eqn{cmov}'s circumference.
 For \eqn{lambda < 1}, the tracepoint is on \eqn{cmov}'s area, e.g.
 if \eqn{lambda = 0.5}, it is halfway between \eqn{cmov}'s centre
 and its circumference. If \eqn{lambda > 1} the tracepoint is outside
 \eqn{cmov}'s area, you might imagine it being attached to a rod
 which is attached to \eqn{cmov} and originates from its centre.
 E.g. \eqn{lambda = 2} would mean that the tracepoint's distance
 from cmov's centre equals \eqn{2*a}. \eqn{lambda = 0} produces a
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
  \item{Cx}{
x-coordinate of the fixed circle's midpoint. Default is 0.
}
  \item{Cy}{
y-coordinate of the fixed circle's midpoint. Default is 0.
}
  \item{RadiusA}{
The actual radius of the fixed circle. Default is 1.
}
  \item{steps}{
positive integer. The number of steps per circuit of the moving
 circle (\eqn{cmov}) for which tracepoint positions are calculated.
 The default, 360, means steps of 1 degree for the movement of
 cmov. Analogously, steps = 720 would mean steps of 0.5 degrees.
}
  \item{start}{
Start angle (radians) of the moving circle's (\eqn{cmov}) centre
 counterclockwise to the horizontal with the fixed circle's (\eqn{cfix})
 centre as the pivot. The tracepoint will start at a peak.
}
}
\details{
 \if{html}{\figure{Figure1.png}{options: width = "500" height = "500"}}
 \if{html}{\figure{Figure2.png}{options: width = "500" height = "500"}}
}
\value{
A dataframe with the columns \eqn{x} and \eqn{y}. Each row represents a
 tracepoint position. The positions are ordered along the trace
 with the last and the first point being identical in order to
 warrant a closed figure when plotting the data.
}
\author{
Peter Biber
}
\seealso{
\code{\link{zykloid}},
 \code{\link{zykloid.scaleAa}}, \code{\link{zykloid.scaleP}}
}
\examples{

# Same hypotrochoid scaled to different radii of the fix circle
cycl1 <- zykloid.scaleA(A = 7, a = 3, lambda = 2/3, RadiusA = 1.3)
cycl2 <- zykloid.scaleA(A = 7, a = 3, lambda = 2/3, RadiusA = 1.0)
cycl3 <- zykloid.scaleA(A = 7, a = 3, lambda = 2/3, RadiusA = 0.7)
plot (y ~ x, data = cycl1, asp = 1, col = "red", type = "l",
      main = "A = 7, a = 3, lambda = 2/3")
lines(y ~ x, data = cycl2, asp = 1, col = "green")
lines(y ~ x, data = cycl3, asp = 1, col = "blue")
legend("topleft", c("RadiusA = 1.3", "RadiusA = 1.0", "RadiusA = 0.7"),
       lty = rep("solid", 3), col = c("red", "green", "blue"), bty = "n")
       


# In this example, RadiusA depends on the cosine of the x-coordinate
# of the fixed circle's centre
op <- par(mar = c(0,0,0,0), bg = "black")
ctrx <- seq(-2*pi, 2*pi, pi/10)
ccol <- rainbow(length(ctrx))
plot.new()
plot.window(asp = 1, xlim = c(-8, 8), ylim = c(-0.5, 0.5))
for(i in c(1:length(ctrx))) {
    zzz <- zykloid.scaleA(A = 9, a = 7, hypo = TRUE, Cx = ctrx[i],
                          Cy = -ctrx[i], lambda = 0.9,
                          RadiusA = 1.5 + cos(ctrx[i]), start = -pi/4)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# Geometric degression of RadiusA makes a nice star
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-10, 10), ylim = c(-10, 10))
rad <- 10
n <- 60
ccol <- heat.colors(n)
for(i in c(1:n)) {
    if (i/2 != floor(i/2)) { sstart = pi/2 }
    else                   { sstart = pi/4 }
    zzz <- zykloid.scaleA(A = 4, a = 3, RadiusA = rad, lambda = 1,
                          start = sstart)
    lines(y ~ x, data = zzz, col = ccol[i])
    rad <- rad * 0.9
} # for i
par(op)



# A windmill
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-1.4, 1.4), ylim = c(-1.4, 1.4))
rrad <- sqrt(seq(0.1, 2, 0.1))
n    <- length(rrad)
ccol <- rainbow(n, start = 0, end = 0.3)
for(i in c(1:n)) {
    zzz <- zykloid.scaleA(A = 7, a = 3, RadiusA = rrad[i],
           hypo = TRUE, lambda = 1.1,
           start = pi/2 - (1*pi/7 - (i - 1) * 2*pi/(7 * n)))
    lines(y ~ x, data = zzz, col = ccol[n + 1 - i])
} # for i
par(op)



# Advanced Example: A series of cycloids with their centres
# located on a logarithmic spiral
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-50, 50), ylim = c(-50, 50))
a     <- 1/32     # spiral's scaling constant
alpha <- pi/20    # spiral's slope angle
sphi  <- seq(0, 18 * pi, pi/25)   # series of angles for cycloid centres
rad  <- a * exp(tan(alpha)*sphi)  # corresponding spiral radii
spx  <- rad * cos(sphi)           # corresponding x-coordinates
spy  <- rad *sin(sphi)            # corresponding y-coordinates
n    <- length(sphi)
ccol <- rainbow(n, start = 2/3, end = 1/2)
for (i in c(1:n)) {
     czc <- zykloid.scaleA(A = 3, a = 1, lambda = 1.5,
            Cx = spx[i], Cy = spy[i],
            RadiusA = rad[i]/2.5, # cycloid radii depends on spiral radii
            start = pi + sphi[i]) # angle cycloid towards spiral centre
     lines(y ~ x, data = czc, col = ccol[i])
} # for i
par(op)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
\keyword{ graphs }% __ONLY ONE__ keyword per line
