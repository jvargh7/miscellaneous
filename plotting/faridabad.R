path_maps_master <- "C:/Cloud/OneDrive - Emory University/data/maps-master"

library(sf)
library(ggplot2)

library(rgdal)
census2011_dist <- readOGR(paste0(path_maps_master,"/Districts/Census_2011/2011_Dist.shp"))
faridabad <- subset(census2011_dist,DISTRICT=="Faridabad")
plot(faridabad)
