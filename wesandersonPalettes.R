
#install and load wesanderson palettes.
  library("devtools")
  devtools::install_github("wesanderson","karthik")
  library(wesanderson)
  
  
#view the palettes
  wes_palette('GrandBudapest')
  wes_palette('Moonrise1')
  wes_palette('Royal1')
  wes_palette('Moonrise2')
  wes_palette('Cavalcanti')
  wes_palette('Royal2')
  wes_palette('Moonrise3')
  wes_palette('Chevalier')
  wes_palette('Zissou')
  wes_palette('FantasticFox')
  wes_palette('Darjeeling')
  wes_palette('Rushmore')
  wes_palette('BottleRocket')
  wes_palette('Darjeeling2')
  
  
  #choose number of colors per palette
  
  i<-3
  
  wes_palette('GrandBudapest',i)  	
  wes_palette('Moonrise1',i)		
  wes_palette('Royal1',i)		
  wes_palette('Moonrise2',i)		
  wes_palette('Cavalcanti',i)		
  wes_palette('Royal2',i)		
  wes_palette('Moonrise3',i)		
  wes_palette('Chevalier',i)		
  wes_palette('Zissou',i)		
  wes_palette('FantasticFox',i)		
  wes_palette('Darjeeling',i)		
  wes_palette('Rushmore',i)		
  wes_palette('BottleRocket',i)		
  
Pal<-c('GrandBudapest','Moonrise1','Royal1','Moonrise2','Cavalcanti','Royal2','Moonrise3','Chevalier','Zissou','FantasticFox','Darjeeling','Rushmore','BottleRocket','Darjeeling2')
  
#view palettes:
 j<-3 #number of colors
i<-1 #choose palette
wes_palette(Pal[i],j)
 
  
  
  #use in ggplot
  
  j<-3 #number of colors
  i<-1 #palette
  

  scale_fill_manual(values = wes_palette(Pal[i],j))+
  
  
  