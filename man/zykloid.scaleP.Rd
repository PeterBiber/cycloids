\name{zykloid.scaleP}
\alias{zykloid.scaleP}
\title{
Wrapper for \code{\link{zykloid}} which scales a cycloid by the
 circle its peaks are located on and allows free positioning
}
\description{
While \code{\link{zykloid}} provides the basic functionality for
 calculating cycloids, this functions allows to re-size a cycloid
 by freely setting the radius of the circle its peaks are located
 on. In addition, the cycloid can be re-positioned by locating
 the fixed circle's midpoint. This function behaves similarly as
 \code{\link{zykloid.scaleAa}}. See details. See Figures 1, 2, and
 \code{\link{zykloid}} for the geometrical principles of cycloids.
}
\usage{
zykloid.scaleP(A, a, lambda, hypo = TRUE, Cx = 0, Cy = 0,
               RadiusP = 1, steps = 360, start = pi/2)
}
\arguments{
  \item{A}{
The Radius of the fix circle before re-sizing. Must be an integer
 Number > 0. Together with \eqn{a} (see below), \eqn{A} is only
 determining the cycloid's shape and number of peaks (see
 \code{\link{npeaks}}), while its actual size is defined by the
 argument \eqn{RadiusP} (see below).
}
  \item{a}{
The radius of the moving circle before re-sizing. Must be an
 integer Number > 0. Together with \eqn{A}, \eqn{a} only determines
 the cycloid's shape and number of peaks (see \code{\link{npeaks}}),
 while its actual size is defined via the argument \eqn{RadiusP}
 (see below).
}
  \item{lambda}{
The distance of the tracepoint from the moving circle's (\eqn{cmov})
 centre in relative units of its radius \eqn{a}. \eqn{lambda = 1}
 means that the tracepoint is located on \eqn{cmov}'s circumference.
 For \eqn{lambda < 1}, the tracepoint is on \eqn{cmov}'s area, e.g.
 if \eqn{lambda = 0.5}, it is halfway between \eqn{cmov}'s centre
 and its circumference. If \eqn{lambda > 1} the tracepoint is outside
 \eqn{cmov}'s area, you might imagine it being attached to a rod
 which is attached to cmov and crosses its centre. E.g. \eqn{lambda = 2}
 would mean that the tracepoint's distance from \eqn{cmov}'s centre
 equals \eqn{2*a}. \eqn{lambda = 0} produces a circle because the
 tracepoint is identical with \eqn{cmov}'s centre.
}
  \item{hypo}{
logical. If TRUE, the resulting figure is a hypocycloid (\eqn{lambda = 1})
 or a hypotrochoid (\eqn{lambda != 1}), because \eqn{cmov} is rolling
 along the inner side of the fixed circle (\eqn{cfix}). If FALSE,
 an epicycloid (\eqn{lambda = 1}) or an epitrochoid (\eqn{lambda != 1})
 is generated, as \eqn{cmov} is rolling at the outside of
 \eqn{cfix}'s circumference.
}
  \item{Cx}{
x-coordinate of the fix circle's midpoint. Default is 0.
}
  \item{Cy}{
y-coordinate of the fix circle's midpoint. Default is 0.
}
  \item{RadiusP}{
The actual radius of the circle the cycloid's peaks are located
 on. Default is 1.
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
This function scales the radius of the circle the cycloids peaks
 are located on. For hypocycloids and hypotrochoids it will thus
 behave the same way as \code{\link{zykloid.scaleAa}}. For
 epicycloids and epitrochoids the output will be different.
 While \code{\link{zykloid.scaleAa}} scales the outer edge of the
 figure, zykloid.scaleP always scales the circle where the
 peaks of the figure are located on. In the case of epicycloids
 and epitrochoids this is at the inside of the figure (see
 examples below).\cr
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
 \code{\link{zykloid.scaleA}}, \code{\link{zykloid.scaleAa}}
}
\examples{

# Epitrochoids with different lambda scaled to the same radius of
# the peak circle
cycl1 <- zykloid.scaleP(A = 21, a = 11, lambda = 1.2, hypo = FALSE,
                         RadiusP = 10)
cycl2 <- zykloid.scaleP(A = 21, a = 11, lambda = 1.0, hypo = FALSE,
                         RadiusP = 10)
cycl3 <- zykloid.scaleP(A = 21, a = 11, lambda = 0.8, hypo = FALSE,
                         RadiusP = 10)
plot (y ~ x, data = cycl1, col = "red", asp = 1, type = "l",
      main = "A = 21, a = 11, RadiusP = 10")
lines(y ~ x, data = cycl2, col = "green")
lines(y ~ x, data = cycl3, col = "blue")
legend("topleft", c("lambda = 1.2", "lambda =  1.0", "lambda =  0.8"),
       lty = rep("solid", 3), col = c("red", "green", "blue"),
       bty = "n")



# Cool Disk by scaling the start angle with an
# exponential function ...
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
n <- 30
ccol <- topo.colors(n)
for(i in c(1:n)) {
    zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = 6, lambda = 1,
           start = 2*pi/3 * exp(-0.1 * (i - 1)), hypo = FALSE)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# ... the free space in the centre could be filled with
# the corresponding hypocycloid ...
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
n <- 30
ccol <- topo.colors(n)
for(i in c(1:n)) {
    zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = 6, lambda = 1,
           start = 2*pi/3 * exp(-0.1 * (i - 1)), hypo = FALSE)
    lines(y ~ x, data = zzz, col = ccol[i])
    zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = 6, lambda = 1,
           start = 2*pi/3 * exp(-0.1 * (i - 1)), hypo = TRUE)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)



# ... or the same ring again and again.
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-11, 11), ylim = c(-11, 11))
n <- 30
ccol <- topo.colors(n)
rad <- 6
for(g in c(1:7)) {
    for(i in c(1:n)) {
        zzz <- zykloid.scaleP(A = 3, a = 1, RadiusP = rad,
               lambda = 1, start = 2*pi/3 * exp(-0.1 * (i - 1)),
               hypo = FALSE)
        lines(y ~ x, data = zzz, col = ccol[i])
    } # for i
    rad <- rad * 3/5
} # for g
par(op)



# Cauliflower pattern. Here, an exponential function is used
# for scaling the radius of the circle the cycloid's loops
# are on.
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-22, 22), ylim = c(-22, 22))
n <- 15
dcol <- heat.colors(n)
for(i in c(1:n)) {
    lambdax <- seq(2.0, 2.2, 0.1)
    for(j in c(1:length(lambdax))) {
        zzz <- zykloid.scaleP(A = 11, a = 1,
               RadiusP = 15 * exp(-0.3 * (i - 1)),
               lambda = lambdax[j], hypo = FALSE,
               start = pi/2 + (i - 1)*pi/11)
        if(j/2 == floor(j/2)) { colx <- "blue" }
        else                  { colx <- dcol[n + 1 - i] }
        lines(y ~ x, data = zzz, col = colx)
    } # for j
} # for i
par(op)



# Sparkling star
op <- par(mar = c(0,0,0,0), bg = "black")
plot.new()
plot.window(asp = 1, xlim = c(-15, 15), ylim = c(-15, 15))
llam <- seq(0, 8, 0.2)
ccol <- rainbow(length(llam), start = 2/3, end = 1/3)
for(i in c(1:length(llam))) {
    zzz <- zykloid.scaleP(A = 5, a = 1, RadiusP = 2.1,
           hypo = FALSE, lambda = llam[i], start = pi/5)
    lines(y ~ x, data = zzz, col = ccol[i])
} # for i
par(op)


}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ math }
\keyword{ graphs }% __ONLY ONE__ keyword per line
