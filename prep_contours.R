library(data.table)
library(sf)
library(leaflet)
# setwd('..')

contours = readRDS('data/gadm36_FRA_2_sf.rds')
contours$GID_0=contours$CC_2
contours$NAME_0=contours$NAME_2
contours= contours[,c('GID_0','NAME_0')]
transfo_myt = data.table(scale=1,shift_lon=0,shift_lat=0)
transfo_glp = data.table(scale=1,shift_lon=0,shift_lat=0)
transfo_mtq = data.table(scale=1,shift_lon=0,shift_lat=0)
transfo_guf = data.table(scale=1,shift_lon=0,shift_lat=0)
transfo_reu = data.table(scale=1,shift_lon=0,shift_lat=0)

fwrite(transfo_myt,"transfo/transfo_myt.csv")
fwrite(transfo_glp,"transfo/transfo_glp.csv")
fwrite(transfo_mtq,"transfo/transfo_mtq.csv")
fwrite(transfo_guf,"transfo/transfo_guf.csv")
fwrite(transfo_reu,"transfo/transfo_reu.csv")

myt = readRDS('data/gadm36_MYT_0_sf.rds')
reu = readRDS('data/gadm36_REU_0_sf.rds')
glp = readRDS('data/gadm36_GLP_0_sf.rds')
guf = readRDS('data/gadm36_GUF_0_sf.rds')
mtq = readRDS('data/gadm36_MTQ_0_sf.rds')
glp$GID_0="971"
mtq$GID_0="972"
guf$GID_0="973"
reu$GID_0 = "974"
myt$GID_0 = "976"

drom_list = list(myt=myt,reu=reu,glp=glp,guf=guf,mtq=mtq)
one_drom = sample(c('glp','mtq','guf','reu','myt'),1)
shift_drom = function(drom_list,one_drom='reu',shift_lon=0,shift_lat=0,scaling=1){
  my_drom = drom_list[[one_drom]]
  my_drom$geometry = my_drom$geometry*scaling + c(shift_lon,shift_lat)
  my_drom
}


# 
# 
# contours_drom = do.call('rbind',drom_list)
# contours= rbind(contours,contours_drom)
# contours$nom = toupper(iconv(contours$NAME_2,from="UTF-8",to="ASCII//TRANSLIT"))
# 
# contours = rmapshaper::ms_simplify(contours,keep=.05,keep_shapes =T,drop_null_geometries =F)
# contours



# leaflet()%>%addTiles()%>%addPolygons(data=contours)
# save(contours,file='data/contours.RData')
