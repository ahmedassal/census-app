initialize <- function(){
  library(maps)
  library(mapproj)
  source("helpers.R")
  
  
}
downloadData <- function(){
  url = "http://shiny.rstudio.com/tutorial/lesson5/census-app/data/counties.rds"
  setwd(".")
  dataFile <<- "./data/counties.rds"
  if(!file.exists(dataFile)){
    download.file(url,destfile = dataFile, method = "curl")
  }
}

loadData <- function(){
  getwd()
  #   con <- gzfile("./data/counties.rds")
  #   readRDS(con)
  #   close(con)
  counties <<- readRDS(".//data//counties.rds")
}