#http://rspatial.org/spatial/rst/8-rastermanip.html#introduction


library(raster)
# RasterLayer with the default parameters

i <- 3
r <- raster(ncol=i, nrow=i)
ncell(r)

values(r) <- 1:ncell(r)

plot(r)
 # raster cell numbers start at the top left and end at the bottom right


a501 <- raster(ncol = 2, nrow = 3)
values(a501) <- 1:6

a502 <- raster(ncol = 2, nrow = 3)
values(a501) <- 2:7

a503 <- raster(ncol = 2, nrow = 3)
values(a503) <- 3:8

b501 <- raster(ncol = 2, nrow = 3)
values(a501) <- 11:16

b502 <- raster(ncol = 2, nrow = 3)
values(a501) <- 12:17

b503 <- raster(ncol = 2, nrow = 3)
values(a503) <- 13:18



x <- raster()

x <- raster(ncol=36, nrow=18, xmn=-1000, xmx=1000, ymn=-100, ymx=900)


res(x) <- 100
ncol(x)

projection(x) <- "+proj=utm +zone=48 +datum=WGS84"
x


r <- raster(ncol=10, nrow=10)
ncell(r)

values(r) <- 1:ncell(r)

plot(r)

# set.seed(0)
# values(r) <- runif(ncell(r))

plot(r, main='Raster with 100 cells')

hasValues(r)

values(r) <- 1:ncell(r)


hasValues(r)
inMemory(r)
## [1] TRUE
values(r)[1:10]





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


