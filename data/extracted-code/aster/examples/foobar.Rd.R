library(aster)


### Name: foobar
### Title: Toy Life History Data having Directions of Recession
### Aliases: foobar
### Keywords: datasets

### ** Examples

data(foobar)
library(aster)
aout <- aster(resp ~ varb + fit : (trt * blk), pred,
    fam, varb, id, root, data = redata)
foo <- try(summary(aout))
# gives an error about directions of recession
# get directions of recession
dor <- attr(foo, "condition")$dor
dor
# found one apparent direction of recession
# from regular pattern
# it looks like a true direction of recession
dor <- dor / max(abs(dor))
dor
# but what does it do?  For that need to map to saturated model
# parameter space
modmat <- aout$modmat
dim(modmat)
# oof!  modmat is three-dimensional.  Need an actual matrix here.
modmat <- matrix(as.vector(modmat), ncol = length(dor))
dor.phi <- drop(modmat %*% dor)
names(dor.phi) <- with(redata, paste(id, as.character(varb), sep = "."))
dor.phi[dor.phi != 0]
fam.default()[fam[vars == "seeds"]]
# since the support of the Poisson distribution is bounded above,
# actually this must be minus the DOR (if it is a DOR at all).
# check that all components of response vector for which dor.phi == 1 are zero
# (lower bound of Poisson range)
all(redata$resp[dor.phi == 1] == 0)
# so minus dor.phi is a true direction of recession in the saturated model
# canonical parameter space, and minus dor is a true direction of recession
# in the submodel canonical parameter space
#
# try to get more info
trt.blk <- with(redata,
    paste(as.character(trt), as.character(blk), sep = "."))
unique(trt.blk[dor.phi == 1])
# the reason for the direction of recession is that every individual getting
# treatment a in block A had zero seeds.
#
# the reason the submodel DOR, R object dor, was so hard to interpret was
# because fit:trta:blkA is not in the model.  So let's force it in
redata <- transform(redata, trt = relevel(trt, ref = "b"),
    blk = relevel(blk, ref = "B"))
# Note: following code is copied exactly from above.  Only difference
# is releveling in the immediately preceding statement
aout <- aster(resp ~ varb + fit : (trt * blk), pred,
    fam, varb, id, root, data = redata)
foo <- try(summary(aout))
dor <- attr(foo, "condition")$dor
dor <- dor / max(abs(dor))
dor
# now it is obvious from looking at this dor that all individuals in trt a
# and blk A are at the lower end (zero) of the Poisson range.
# maybe the other dor we had previously would be "obvious" to someone
# sufficiently skilled in understanding the meaning of regression coefficients
# but not "obvious" to your humble author
#
# as for what to do about this, see the course slides cited in the reference
# section.  There is no single Right Thing to do.



