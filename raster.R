#http://rspatial.org/spatial/rst/8-rastermanip.html#introduction


library(raster)
# RasterLayer with the default parameters
x <- raster()

x <- raster(ncol=36, nrow=18, xmn=-1000, xmx=1000, ymn=-100, ymx=900)


res(x) <- 100
ncol(x)

projection(x) <- "+proj=utm +zone=48 +datum=WGS84"
x


r <- raster(ncol=10, nrow=10)
ncell(r)

hasValues(r)

values(r) <- 1:ncell(r)
set.seed(0)
values(r) <- runif(ncell(r))

hasValues(r)
inMemory(r)
## [1] TRUE
values(r)[1:10]

plot(r, main='Raster with 100 cells')


filename <- system.file("external/test.grd", package="raster")
filename
r <- raster(filename)
filename(r)
hasValues(r)
inMemory(r)
plot(r, main='RasterLayer from file')


r1 <- r2 <- r3 <- raster(nrow=10, ncol=10)
# Assign random cell values
values(r1) <- runif(ncell(r1))
values(r2) <- runif(ncell(r2))
values(r3) <- runif(ncell(r3))

#Combine three RasterLayer objects into a RasterStack.

s <- stack(r1, r2, r3)
s


