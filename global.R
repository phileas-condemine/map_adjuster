library(shiny)
library(shinydashboard)
library(data.table)
library(leaflet)
library(sf)

source('prep_contours.R',encoding='UTF-8',local = T)

m = leaflet()%>%addTiles()%>%addPolygons(data=contours)
