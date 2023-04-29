\name{zykloid.scaleAa}
\alias{zykloid.scaleAa}
\title{
Wrapper for \code{\link{zykloid}} which scales a cycloid by its
 outer radius and allows free positioning
}
\description{
While \code{\link{zykloid}} provides the basic functionality for
 calculating cycloids, this functions allows to re-size a cycloid
 by freely setting the radius of its circumcircle. In addition,
 the cycloid can be re-positioned by locating the fixed circle's
 midpoint. This function behaves similarly as \code{\link{zykloid.scaleP}}.
 See details. Figures 1 and 2 and \code{\link{zykloid}} describe the
 geometrical principles of cycloids.
}
\usage{
zykloid.scaleAa(A, a, lambda, hypo = TRUE, Cx = 0, Cy = 0,
                RadiusAa = 1, steps = 360, start = pi/2)
}
\arguments{
  \item{A}{
The Radius of the fixed circle before re-sizing. Must be an integer
 Number > 0. Together with \eqn{a} (see below), \eqn{A} is only
 determining the cycloid's shape and number of peaks (see
 \code{\link{npeaks}}), while its actual size is defined by the
 argument \eqn{RadiusAa} (see below).
}
  \item{a}{
The radius of the moving circle before re-sizing. Must be an
 integer Number > 0. Together with \eqn{A}, \eqn{a} only determines
 the cycloid's shape and number of peaks (see \code{\link{npeaks}}),
 while its actual size is defined via the argument \eqn{RadiusAa}
 (see below).
}
  \item{lambda}{
The distance of the tracepoint from the moving circle's (\eqn{cmov})
 centre in relative units of its radius \eqn{a}. \eqn{lambda = 1}
 means that the tracepoint is located on \eqn{cmov}'s circumference.
 For \eqn{lambda < 1}, the tracepoint is on \eqn{cmov}'s area, e.g.
 if \eqn{lambda = 0.5}, it is halfway between \eqn{cmov}'s centre
 and its circumference. If \eqn{lambda > 1} the tracepoint is
 outside \eqn{cmov}'s area, you might imagine it being attached to
 a rod which is attached to \eqn{cmov} and crosses its centre.
 E.g. \eqn{lambda = 2} would mean that the tracepoint's distance
 from cmov's centre equals \eqn{2*a}. \eqn{lambda = 0} produces a
 circle because the tracepoint is identical with \eqn{cmov}'s centre.
}
  \item{hypo}{
logical. If TRUE, the resulting figure is a hypocycloid (\eqn{lambda = 1})
 or a hypotrochoid (\eqn{lambda != 1}), because \eqn{cmov} is rolling
 along the inner side of the fixed circle (\eqn{cfix}). If FALSE,
 an epicycloid (\eqn{lambda = 1}) or an epitrochoid \eqn{\lambda != 1}
 is generated, as \eqn{cmov} is rolling at the outside of \eqn{cfix}'s
 circumference.
}
  \item{Cx}{
x-coordinate of the fixed circle's midpoint. Default is 0.
}
  \item{Cy}{
y-coordinate of the fixed circle's midpoint. Default is 0.
}
  \item{RadiusAa}{
The actual radius of the cycloids outer circle. Default is 1.
}
  \item{steps}{
positive integer. The number of steps per circuit of the moving
 circle (cmov) for which tracepoint positions are calculated.
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
This function scales in either case the radius of the whole
 cycloid's circumcircle. Thus, for hypocycloids and hypotrochoids
 it will behave the same way as \code{\link{zykloid.scaleP}}.
 For epicycloids and epitrochoids their output will be different.
 zykloid.scaleAa scales the outer edge of the figure, while
 \code{\link{zykloid.scaleP}} always scales the circle where the
 peaks of the figure are located on. In the case of epicycloids
 and epitrochoids this is at the inside of the figure (see
 examples).\cr
 Figure 1 and 2 show the principle behind cycloid construction:
\cr
 \if{html}{\figure{Figure1.png}{options: width = "500" height = "500"}}
 \if{html}{\figure{Figure2.png}{options: width = "500" height = "500"}}
}
\value{
A dataframe with the columns \eqn{x} and \eqn{y}. Each row represents
 a tracepoint position. The positions are ordered along the trace
 with the last and the first point being identical in order to
 warrant a closed figure when plotting the data.
}
\author{
Peter Biber
}
\seealso{
\code{\link{zykloid}},
 \code{\link{zykloid.scaleA}}, \code{\link{zykloid.scaleP}}
}
\examples{

# Same epicycloid scaled to different maximum radii of the figure
cycl1 <- zykloid.scaleAa(A = 21, a = 11, lambda = 1, hypo = FALSE,
                         RadiusAa = 100)
cycl2 <- zykloid.scaleAa(A = 21, a = 11, lambda = 1, hypo = FALSE,
                         RadiusAa =  70)
cycl3 <- zykloid.scaleAa(A = 21, a = 11, lambda = 1, hypo = FALSE,
                         RadiusAa =  40)
plot (y ~ x, data = cycl1, col = "red", asp = 1, type = "l",
      main = "A = 21, a = 11, lambda = 1")
lines(y ~ x, data = cycl2, col = "green")
lines(y ~ x, data = cycl3, col = "blue")
legend("topleft", c("RadiusAa = 100", "RadiusAa =  70", "RadiusAa =  40"),
       lty = rep("solid", 3), col = c("red", "green", "blue"), bty = "n")
       

# Pentagram by constructing a hypocycloid and an epicycloid
# with the same outer radius and scaling this radius exponentially
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-40, 40), ylim = c(-40, 40))
n <- 20
ccol <- heat.colors(n)
for(i in c(1:n)) {
    zzz <- zykloid.scaleAa(A = 5, a = 2,
           RadiusAa = 38*exp(-0.05*(i-1)), hypo = FALSE, lambda = 1)
    lines(y ~ x, data = zzz, col = ccol[i])
    zzz <- zykloid.scaleAa(A = 5, a = 2,
           RadiusAa = 38*exp(-0.05*(i-1)), hypo = TRUE,  lambda = 1)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# Psychedelic star by modifying lambda while keeping the outer
# radius constant
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-5, 5), ylim = c(-5, 5))
llam <- seq(0, 8, 0.2)
ccol <- terrain.colors(length(llam))
for(i in c(1:length(llam))) {
    zzz <- zykloid.scaleAa(A = 5, a = 1, RadiusAa = 4.5,
           hypo = FALSE, lambda = llam[i])
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
\keyword{ graphs }% __ONLY ONE__ keyword per line
