
rm(list=ls(all=T)) #clear workspace

paste("insult of the day:",bismer::insult())

#use 'locator()' to find x y coordinates on a graphic window
locator() #left click on location(s) on plot then right click 'stop' to display results

for(i in c(1:length(dev.list())))dev.off()  #close all graphics windows


a<-rnorm(1);a
if (a>0) {
  print('big one')
} else {
  print('little one')
}

############read xlx or xlsx
require(gdata)
myDf <- read.xls ("myfile.xlsx"), sheet = 1, header = TRUE)

########error options
  # Immediately enter the browser when an error occurs
    options(error = browser)

  # Call the recover function when an error occurs
    #will print a list of the call stack and allow you to 
      #browse at any point in the stack:
        options(error = recover)
###################simple tryCatch to handle errors
tryErr<-function(x){    #simple tryCatch function returns NA for errors
    tryCatch(log(x),error = function(e) NA)
  }
    tryErr(10) #returns value
    tryErr(-1) #returns value as NaN and warning
    tryErr(0) #returns value as -Inf but no warning
    tryErr('a') #returns NA for the error

tryWarn<-function(x){    #simple tryCatch function returns NA for errors and Warnings
  tryCatch(log(x),warning = function(w) NA,error = function(e) NA)
  }
    tryWarn(10) #returns value
    tryWarn(-1) #returns NA and warning
    tryWarn(0) #returns value as -Inf but no warning
    tryWarn('a') #returns NA for the error
    
    
#the following read.csv command depends on the directory.  When working from the command line the need to use the working directory
#when using knitR it depends on the directory where the .rmd file is found.
#the following code can be used to look in two different directories for the same file.
datasets<-tryCatch(read.csv('../data/NLA2012_data_sources.csv',sep=','),warning = function(e) read.csv('data/NLA2012_data_sources.csv',sep=','))
################end tryCatch

options(scipen=5) #tell r not to use scientific notation on axis labels

########send plotter output to a jpeg file in working directory
jpeg('test.jpg',width=10,height=7.5,units='in',res=72)
plot(rnorm(10),rnorm(10))
dev.off()
########
  
  #########function to install (if needed) and load R packages by list
libs<-c("rgdal","robustbase","spsurvey","maptools") #list of packages to load

installLoad<-function(pck)#user defined function
{
  if(!pck%in%installed.packages()){install.packages(pck,repos="http://rweb.quant.ku.edu/cran/")}
  require(pck, character.only = TRUE)
}
lapply(libs,function(x) installLoad(x))  #Load/Install require packages
#########
oldpar <- par(no.readonly = TRUE) #save default Par settings
par(oldpar)  #reset graphical parameters to default

#save the data
save(DSS,NLA,file='C:/Bryan/EPA/Data/RData/DSS_20120309.rda')
  #load(file='C:/Bryan/EPA/Data/RData/DSS_20120309.rda')
  
#use a data.frame object name as a character string
  a<-data.frame(x=1:10,y=1:10)
  deparse(substitute(a))
  
#use a string to name a data.frame
  a<-'NewObject'
  b<-data.frame(x=rnorm(10),y=rnorm(10))
  assign(a,b)
  NewObject

#use 'get' to call an object from a string (see above)
get(a)
  
##memory management
memory.size()   #memory use
gc() #garbage collection: cleans up temp files
  

  
#####################
require(RColorBrewer)
Colors <- brewer.pal(7, "Set1") #select number of elements (>2) and palette
  #Color Brew Palette
    #Qualitative: Accent, Dark2, Paired, Pastel1, Pastel2, Set1, Set2, Set3
    #Diverging (extremes +/-): BrBG, PiYG, PRGn, PuOr, RdBu, RdGy, RdYlBu, RdYlGn, Spectral
    #Sequential (ordered light to dark): Blues, BuGn, BuPu, GnBu, Greens, Greys, Oranges, OrRd, PuBu, PuBuGn, 
    #                                    PuRd, Purples, RdPu, Reds, YlGn, YlGnBu, YlOrBr, YlOrRd
#####################

# Read data-****Make Sure the Path Is Correct****
require(RODBC)   #Package RODBC must be installed
#con<- odbcConnectAccess("M:/Net MyDocuments/EPA/Data/Sparrow/MRB1Sparrow/MRB1Sparrow.mdb")
#con <- odbcConnectAccess("L:/Public/Milstead_Lakes/Sparrow/MRB1Sparrow/MRB1Sparrow.mdb")
#con <- odbcConnectAccess("L:/Public/Milstead_Lakes/WaterbodyDatabase/BuffersWBID/BuffersWBID.mdb")
#con <- odbcConnectAccess("M:/Net MyDocuments/EPA/Data/WaterbodyDatabase/Rwork.mdb")
con <- odbcConnectAccess("c:/bryan/EPA/Data/WaterbodyDatabase/Rwork.mdb")
A <- sqlQuery(con, "
SELECT tblWBID_SparrowLoads.WB_ID, tblJoinNLAID_WBID.NLA_ID, MRB1_WBIDLakes.HUC_Region, tblOmernikAggregatedEcoregions.WSA_3, tblOmernikAggregatedEcoregions.WSA_9, tblOmernikAggregatedEcoregions.NUTRT_14, NLA2007Sites_DesignInfo.SITE_TYPE, NLA2007Sites_DesignInfo.LAKE_SAMP, NLA2007Sites_DesignInfo.WGT_NLA, tblNLA_VisualAssessment.PRISTINE, tblNLA_VisualAssessment.APPEALING, tblNLA_VisualAssessment.SWIMMABILITY, tblNLA_VisualAssessment.RECREATIONAL_VALUE, tblNLA_VisualAssessment.BIOTIC_INTEGRITY, tblNLA_VisualAssessment.TROPHIC_STATE, MRB1_WBIDLakes.AlbersX, MRB1_WBIDLakes.AlbersY, tblNED_WBID_Elevation.MeanElevationM AS Elevation, MRB1_WBIDLakes.ShorelineAlbersM AS Shoreline, MRB1_WBIDLakes.AlbersAreaM AS Area, MRB1_PredictedVolumeDepth.maxdepth_corrected AS Zmax, MRB1_PredictedVolumeDepth.distvol AS Volume, tblWBID_SparrowLoads.FlowM3_yr AS Flow, tblNLA_WaterQualityData.NTL, tblNLA_Diatom_Inferred_Chem.NTL_INF_TOP AS Ninf, tblWBID_SparrowLoads.Ninput, tblWBID_SparrowLoads.Noutput, [tblWBID_SparrowLoads]![Noutput_CornSoyAlfFert]+[tblWBID_SparrowLoads]![Noutput_AlfSoyFix]+[tblWBID_SparrowLoads]![Noutput_Manure]+[tblWBID_SparrowLoads]![Noutput_OtherFert] AS Nag, [tblWBID_SparrowLoads]![Noutput_Sewer]+[tblWBID_SparrowLoads]![Noutput_Develop] AS Nurban, tblWBID_SparrowLoads.Noutput_TIN AS Nair, tblNLA_WaterQualityData.PTL, tblNLA_Diatom_Inferred_Chem.PTL_INF_TOP AS Pinf, tblWBID_SparrowLoads.Pinput, tblWBID_SparrowLoads.Poutput, [tblWBID_SparrowLoads]![Poutput_CornSoyAlfFert]+[tblWBID_SparrowLoads]![Poutput_Manure]+[tblWBID_SparrowLoads]![Poutput_OtherFert] AS Pag, [tblWBID_SparrowLoads]![Poutput_Sewer]+[tblWBID_SparrowLoads]![Poutput_Develop] AS Purban, tblWBID_SparrowLoads.Poutput_Forest AS Pnatural, tblNLA_WaterQualityData.CHLA AS ChlA, tblNLA_WaterQualityData.SECMEAN, tblNLA_Microcystin.Microcystin_ugl, tblCyanoCounts.SumOfABUND AS CyanoCount, tblLakePopProx50km.LakeProx50km, tblLakePopProx50km.PopProx50km
FROM ((((((((((((tblWBID_SparrowLoads LEFT JOIN tblJoinNLAID_WBID ON tblWBID_SparrowLoads.WB_ID = tblJoinNLAID_WBID.WB_ID) LEFT JOIN tblNLA_VisualAssessment ON tblJoinNLAID_WBID.NLA_ID = tblNLA_VisualAssessment.SITE_ID) INNER JOIN MRB1_WBIDLakes ON tblWBID_SparrowLoads.WB_ID = MRB1_WBIDLakes.WB_ID) INNER JOIN tblNED_WBID_Elevation ON tblWBID_SparrowLoads.WB_ID = tblNED_WBID_Elevation.WB_ID) LEFT JOIN tblNLA_WaterQualityData ON (tblNLA_VisualAssessment.SITE_ID = tblNLA_WaterQualityData.SITE_ID) AND (tblNLA_VisualAssessment.VISIT_NO = tblNLA_WaterQualityData.VISIT_NO)) LEFT JOIN tblNLA_Microcystin ON tblNLA_VisualAssessment.SITE_ID = tblNLA_Microcystin.SITE_ID) LEFT JOIN tblCyanoCounts ON tblNLA_VisualAssessment.SITE_ID = tblCyanoCounts.SITE_ID) LEFT JOIN tblLakePopProx50km ON tblWBID_SparrowLoads.WB_ID = tblLakePopProx50km.WB_ID) LEFT JOIN MRB1_PredictedVolumeDepth ON tblWBID_SparrowLoads.WB_ID = MRB1_PredictedVolumeDepth.WB_ID) INNER JOIN tblWBID_EcoRegions ON tblWBID_SparrowLoads.WB_ID = tblWBID_EcoRegions.WB_ID) INNER JOIN tblOmernikAggregatedEcoregions ON tblWBID_EcoRegions.LEVEL3 = tblOmernikAggregatedEcoregions.CEC_L3) LEFT JOIN NLA2007Sites_DesignInfo ON tblNLA_VisualAssessment.SITE_ID = NLA2007Sites_DesignInfo.SITE_ID) LEFT JOIN tblNLA_Diatom_Inferred_Chem ON (tblNLA_VisualAssessment.SITE_ID = tblNLA_Diatom_Inferred_Chem.SITE_ID) AND (tblNLA_VisualAssessment.VISIT_NO = tblNLA_Diatom_Inferred_Chem.VISIT_NO)
WHERE (((tblWBID_SparrowLoads.WB_ID)<>22302965) AND ((tblWBID_SparrowLoads.Coastal)=0) AND ((tblWBID_SparrowLoads.Diversion)=0) AND ((IsNull([tblJoinNLAID_WBID]![Rank]) Or [tblJoinNLAID_WBID]![Rank]=1)=-1) AND ((IsNull([tblNLA_VisualAssessment]![VISIT_NO]) Or [tblNLA_VisualAssessment]![VISIT_NO]=1)=-1))
ORDER BY tblWBID_SparrowLoads.WB_ID;
")
close(con)
str(A)

# Write data to tblMNKA in fj.mdb
require(RODBC)   #Package RODBC must be installed
con <- odbcConnectAccess("c:/bryan/FJ/Access/FJ.mdb")
FJ <- sqlSave(con,dat=FJpop,tablename='tblMNKA',append=F,rownames=F)
close(con)

 #Use a string to call an object with get()
    x<-rnorm(100)
    y<-rnorm(100)
      Test<-lm(y~x)
        Model<-'Test'
          a<-get(Model)
    c(Model=Model,round(c(adjR2=summary(a)$adj.r.squared,coefficients(a)),2))


win.graph(10,7.5)

with(a[a$Difference<10,],plot(Count,Difference,log='x',pch=19))

write.table(out, file='c:/temp/temp.csv',row.names=F,sep=',')
write.table(out, file='//AA.AD.EPA.GOV/ORD/NAR/USERS/EC2/wmilstea/Net MyDocuments/tempMD/temp.csv',row.names=F,sep=',')

write.table(Resid, file="c:/temp/temp.csv",row.names=F,sep=',')
temp<- read.csv("c:/temp/temp.csv")

MRB1<- read.csv("M:/Net MyDocuments/EPA/Data/Sparrow/MRB1Sparrow/NLA_MRB1 NP predictions.csv")
write.table(out, file='//AA.AD.EPA.GOV/ORD/NAR/USERS/EC2/wmilstea/Net MyDocuments/EPA/Data/Sparrow/MRB1Sparrow/MRB1_NPEstimates.csv',row.names=F,sep=',')

a<-read.csv(paste(kali,m$filename[i],sep=''),sep=',',na.strings = c(""," "))  #to change the NA string(s)

sessionInfo() #information on version and packages installed

Sys.setenv(MYSQL_HOME="C:\\xampp\\mysql") #set MYSQL_HOME

Count number of nonNA values

colSums(!is.na(tVARS))
rowSums(!is.na(dia))

number of rows=nrows()
number of cols.=ncol()

Number of elements in a vector
length(count)

ls.str() #list structure of all objects

stderr <- function(x) sqrt(var(x)/length(x)) #standard error function



#replace all the NA's in dataframe x with zeroes.

x[is.na(x)] <- 0 

#to replace values in columns a and b

x$a[is.na(x$a)] <- 0
x$c[is.na(x$c)] <- 0
#or a group of columns
xsub<-x[,1:2]
xsub[is.na(xsub)]<-0
x[,1:2]<-xsub

# Read data from website   
NLA<-data.frame(read.csv(url("http://willbmisled.com/lakes/nla_test.csv")))
names(NLA)

#get Sparrow data

rm(list=ls(all=T)) #clear workspace



#get NLA data

rm(list=ls(all=T)) #clear workspace
# Read data-****Make Sure the Path Is Correct****
require(RODBC)   #Package RODBC must be installed
con <- odbcConnectAccess("C:/Bryan/EPA/Data/WaterbodyDatabase/WaterbodyDatabase.mdb")
#con <- odbcConnectAccess("L:/Public/Milstead_Lakes/WaterbodyDatabase/WaterbodyDatabase.mdb")
get <- sqlQuery(con, "
SELECT tblJoinNLAID_WBID.WB_ID, tblJoinNLAID_WBID.NLA_ID, tblNLA_WaterQualityData.NTL, tblNLA_WaterQualityData.PTL, tblNLA_WaterQualityData.CHLA, tblNLA_WaterQualityData.SECMEAN, tblNLA_VisualAssessment.PRISTINE, tblNLA_VisualAssessment.APPEALNG, tblNLA_VisualAssessment.BIOTIC_INTEGRITY, tblNLA_VisualAssessment.TROPHIC_STATE, tblNLA_VisualAssessment.RECREATIONAL_VALUE, tblNLA_VisualAssessment.SWIMMABILITY
FROM ((tblJoinNLAID_WBID INNER JOIN NLA2007Sites_DesignInfo ON tblJoinNLAID_WBID.NLA_ID = NLA2007Sites_DesignInfo.SITE_ID) INNER JOIN tblNLA_VisualAssessment ON NLA2007Sites_DesignInfo.SITE_ID = tblNLA_VisualAssessment.SITE_ID) INNER JOIN tblNLA_WaterQualityData ON NLA2007Sites_DesignInfo.SITE_ID = tblNLA_WaterQualityData.SITE_ID
WHERE (((tblNLA_VisualAssessment.VISIT_NO)=1));
")
NLA<-data.frame(get)
close(con)
names(NLA)

#boxplot with whiskers=to the .975 quantile.
x=rnorm(1000)
boxplot(x,range=(quantile(x,.975)-quantile(x,.75))/(quantile(x,.75)-quantile(x,.25)))
abline(h=quantile(x,.025))

oldpar <- par(no.readonly = TRUE) #save default par settings
par(oldpar) #reset default par

#great way to assign colors in a plot
library(maptools) 
library(sp)
nc <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], proj4string=CRS("+proj=longlat +datum=NAD27"))
rrt <- nc$SID74/nc$BIR74  #I'm guessing this is the ratio of SID cases to births in 1974
brks <- quantile(rrt, seq(0,1,1/5)) #Breaks rrt into 6 intervals based on quantiles
cols <- grey.colors(length(brks)-1, 0.95, 0.55, 2.2) #define a grey scale color palette 
                                                     #with 'length(brks)-1' (5) shades
                                                     #.95 is the start color (~white); .55 is the end color (~black)
                                                     #2.2 is the gamma correction
plot(nc, col=cols[findInterval(rrt, brks, all.inside=TRUE)], axes = TRUE)

#find matches in a list 
a<-c(1:10)
b<-c(3,7)
a%in%b
!a%in%b  #note to get the opposite use the "!" 
b%in%a
match(b,a)
b%in%a & b>5


###Function to append new objects to a saved .rda file
#https://stat.ethz.ch/pipermail/r-help/2006-March/101282.html
## Function to append an object to an R data file.
append.Rda <- function(x, file) {
  old.objects <- load(file, new.env())
  save(list = c(old.objects, deparse(substitute(x))), file = file)
}


## Example:
x <- 1:10
y <- letters[1:10]
save(list = c("x", "y"), file = "temp.Rda")
z <- "fred"
append.Rda(z, "temp.Rda")



# Mathematical Annotation in R = ?plotmath or demo(plotmath)
# Symbols: http://www.stat.auckland.ac.nz/~paul/R/CM/AdobeSym.html.
# e.g., Chla micrograms/l: paste('Chla (',expression('\U03BC'),'g/l)',sep=)
# plus or minus: expression("\261") 
x<-c(1:3);y=c(3,6,9)
r<-summary(lm(y~x))
plot(x,y)
R2 <- bquote(paste(adjR^2==.(round(r$adj.r.squared,2))))
slope<- paste('Slope =',round(r$coefficients[2],2))
legend('topleft', do.call("expression",list(R2,slope)), bty = 'n',title='title')

xlab=paste('Total Nitrogen (',expression('\U03BC'),'g/l)',sep=''))

#micrograms/liter
  paste('\u03BC','g/l',sep='')



#specify axes exactly:
plot(0:100,0:100,pch="+",xaxs='i',yaxs='i') 


############## get data
library(RODBC)
#odbcConnectExcel2007() for xls 2007
con<-odbcConnectExcel('C:/Bryan/EPA/Data/DMRPollutantLoadingToolData/DMRPollutantLoadsEPA_Region1_20120131.xls',readOnly = TRUE)
#sqlTables(con)
N<-sqlFetch(con,'Nitrogen',rownames=F,colnames=F)
##########

#############
#sort dataframe
#http://stackoverflow.com/questions/1296646/how-to-sort-a-dataframe-by-columns-in-r
dd <- data.frame(b = factor(c("Hi", "Med", "Hi", "Low"),
      levels = c("Low", "Med", "Hi"), ordered = TRUE),
      x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
      z = c(1, 1, 1, 2))
  dd
a<-dd[with(dd, order(-z, b)), ]  
#a<-dd[order(-dd$z,dd$b), ]  #alternative without "with"
  a
#############

##############cool way to specify a model
Test<-data.frame(first=rnorm(100),second=rnorm(100),third=rnorm(100),fourth=rnorm(100)) #test data.frame
y<-names(Test)[1] #select dependent variable
x<-names(Test)[c(2,3,4)] #select explanatory variables
Formula <- formula(paste(y,'~',paste(x, collapse="+")))  #cool way to specify the model
summary(lm(Formula,data=Test))
##############

How to write an R package: http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
  
