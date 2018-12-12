# Raster Packages
# December 4 2018
# JSC

library(rgdal)
library(raster)
library(sp)

#http://www.worldclim.com/version2

set.seed(802)
long <- runif(10,-72.85, -72.78)
lat <- runif(10,44.5, 44.6)
ID <- 1:10
# bind them 
coords <- data.frame(long,lat)

library(leaflet)
library(maps)
leaflet(data=coords) %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  addCircleMarkers(~long,~lat,label=as.character(ID))

r <- getData("worldclim",var="bio",res=.5,lon=72, lat=44)
alt <- getData("worldclim",var="alt",res=.5,lon=72,lat=44)

class(r)
nlayers(r)
nlayers(alt)
unlist(r)
unlist(alt)

plot(alt)

leaflet(data=coords) %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
  addCircleMarkers(~long,~lat,label=as.character(ID)) %>%
  addRectangles(
    lng1=min(long),lat1=min(lat),
    lng2=max(long),lat2=max(lat))

plot(alt, xlab="Longitude", ylab="Latitude", 
     ylim=c(min(lat), max(lat)),
     xlim=c(min(long), max(long)))

# choose the layers we are interested in
r <- r[[c(1,12)]]
# name the layers
names(r) <- c("Tmean","Precip")

# steps to extract data from raster
points <- SpatialPoints(coords,proj4string = r$crs)
clim <- extract(r, points)
altS <- extract(alt, points)

climate <- cbind.data.frame(coords,altS, clim)
climate

# format to read a file in using raster
 # f <- system.file("folder//filename.shp",package="raster")

x <- writeRaster(r$Precip,"preciptile.tif")

# getting the SRTM tile
irl.srtm <- getData('SRTM', lon=-7.6, lat=53)
plot(irl.srtm)
# getting the ireland boundary data
ireland <- getData('GADM', country='IRL', level=0)
plot(ireland, add=TRUE)


# another tile from Ireland
ireland2 <- getData('SRTM', lon=-7.6, lat=56)
#Mosaic/merge srtm tiles
srtmMosaic <- mosaic(irl.srtm, ireland2, fun=mean)
plot(srtmMosaic, xlim=c(-12,-5), ylim=c(51, 56))
plot(ireland, add=TRUE)
