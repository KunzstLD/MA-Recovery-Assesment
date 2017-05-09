##########################################################################
#------------------------------- Read in data and modification --------------------------------------------#
##########################################################################

#------------------------------- Data directory and out put directory -------------------------------------#

datadir = "D:/Studium/Documents/Master Thesis"
outputdir = "C:/Users/kunz/Documents/Master Thesis/Output"# needs to be adjusted
prj = "D:/Studium/Documents/Master Thesis/R skripte"

source (file.path(prj,"Functions.R"))
# -------------------------------------------------------------------------------------------------------------------#

#### Load packages ####
require(ggplot2)
require(data.table)
#require(MASS)
require(tidyr)
require(dplyr)
# -------------------------------------------------------------------------------------------------------------------#

#### Read in data ####
Treatment = read.table(file.path(datadir,"eVole","eVole_Treatment_Okt_EMF5_single.txt"),header=T)
Control = read.table(file.path(datadir,"eVole","eVole_Control_21years.txt"),header=T)

#### Preparing the dataset ####

# Adding days as numbers
# 365*21
Day = c(1:7665)
Day = rep(Day,100)

head(Treatment)
head(Control)
# Subset to remove columns we don't need in the beginning
Treatment = Treatment[,c(-3,-6,-7,-8,-9,-10,-11,-12)]
Treatment[,"density.control"] = Control[,4]
Treatment[,"pop.size.control"] = Control [,5]
Treatment[,"day"]= Day

# Change to data table
dt = data.table(Treatment)

# change order of columns 
setcolorder(dt,c("iteration","year","day","density","pop.size","density.control","pop.size.control"))
dt

# Cut first 10 years 
dt = dt[year >= 10,]

# # Plotting????
# ggplot(dt[iteration==1,], aes(year,density))+
# geom_line()+
# theme_bw()