library(castor)


### Name: spline_coefficients
### Title: Get the polynomial coefficients of a spline.
### Aliases: spline_coefficients

### ** Examples

# The following code defines a quadratic spline on 20 grid points
# The curve's polynomial coefficients are then determined
# and used to evaluate the spline on a fine grid for plotting.
Xgrid = seq(0,10,length.out=20)
Ygrid = sin(Xgrid)
splines_degree = 2

Ycoeff = castor::spline_coefficients(Xgrid, Ygrid, splines_degree)

plot(Xgrid, Ygrid, type='p')

for(g in seq_len(length(Xgrid)-1)){
  Xtarget = seq(Xgrid[g], Xgrid[g+1], length.out=100)
  Ytarget = rep(Ycoeff[g,1], length(Xtarget))
  for(p in seq_len(splines_degree)){
    Ytarget = Ytarget + (Xtarget^p) * Ycoeff[g,p+1];
  }
  lines(Xtarget, Ytarget, type='l', col='red')
}



