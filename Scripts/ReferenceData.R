# MSc thesis
# Shoyo Nakamura
# This script is for creating input data for models.

# Set working directory
setwd("C:/Users/Shoyo Nakamura/Desktop/WUR/Thesis")

# Import libraries
library(rgdal)
library(raster)
library(terra)
library(sf)
library(rgeos)


# 0-1. Preparation using ArcGIS Pro
# Manually create polygons with same projection and cell size as the Capella image's 
# Convert polygon to raster (tool: polygon to raster)
# Create mask raster and 3 types of reference label raster (tool: reclassify)

# 0-2. Preparation using SNAP toolbox
# Refined lee speckle filtering on the Capella image


### 1. Data loading
label <- raster("TestSub/TestSubFinal.tif")
label[is.na(label)] = 0
label[label < 0] = 0
# label <- raster("TestMulti/TestMultiLblFinal.tif")
# label <- raster("TestBin/TestBinLblFinal.tif")
# label <- raster("TrainSub/TrainSubLblFinal.tif")
# label <- raster("TrainMulti/TrainMultiLblFinal.tif")
# label <- raster("TrainBin/TrainBinLblFinal.tif")

## Plot reference label raster
# color <- c("blue", "red", "light green", "dark green", "darkgoldenrod2", "yellow")
# plot(label, col=color)
# legend("bottomleft", legend=c("water", "bare soil", "regrowth forest", "dense forest", "mature plantation", "young plantation"),
       # fill=color, bg="white")

mask <- raster("TestSub/TestMsk.tif")
mask[is.na(mask)] = 0
mask[mask < 0] = 0
# mask <- raster("TrainSub/TrainMskFinal.tif")

## Plot mask raster
# color2 <- c("gray", "pink")
# plot(iw, col=color2)
# legend("bottomleft", legend=c("background", "land covers"),
       # fill=color2, bg="white")

imgRL <- raster("CAPELLA_C02_SP_GEO_HH_20210304214924_20210304214952/CAPELLA_C02_SP_GEO_HH_20210304214924_20210304214952_Spk.tif")
imgRL[is.na(imgRL)] = 0
imgRL[imgRL < 0] = 0
# img <- raster("CAPELLA_C02_SP_GEO_HH_20210304214924_20210304214952/CAPELLA_C02_SP_GEO_HH_20210304214924_20210304214952.tif")

## Plot image
# plot(imgRL, col=grey(0:10000/10000))


### 2. Define extent and crop
#Train
# e <- extent(627535.655812059, 630140.355812059, -240816.194179079, -238563.944179079)
#Test
e <- extent(629015.006555378, 629950.906555378, -241892.730862807, -240955.780862807)

label <- crop(label, e)
mask <- crop(mask, e)
imgRL <- crop(imgRL, e)
# img <- crop(img, e)

### 3. Adjust the extent of the image
ext(label)
ext(mask)
ext(imgRL) 
# ext(img)
extent(imgRL) <- extent(629015.006555378, 629950.906555378, -241892.730862807, -240955.780862807)
# extent(imgRL) <- extent(627535.655812059, 630140.355812059, -240816.194179079, -238563.944179079)
ext(imgRL)


### 4. Normalization of the image
imgRL <- (imgRL - minValue(imgRL)) / (maxValue(imgRL) - minValue(imgRL))
# mm <- minmax(imgRL)
# imgRL <- (imgRL - mm[1,]) / (mm[2,] - mm[1,])


### 5. create a raster stack to confirm the same cell size and extent
stack <- c(imgRL, label, mask)

### 6. Save the raster stack
writeRaster(label, "FinalData/TestBinLbl.tif", overwrite=TRUE)
writeRaster(mask, "FinalData/TestMsk.tif", overwrite=TRUE)
writeRaster(imgRL, "FinalData/TestImg_spk.tif", overwrite=TRUE)
