
#cheat sheet: http://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

#http://cran.rstudio.com/web/packages/dplyr/vignettes/

#http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html

library(dplyr)
library(nycflights13)
  dim(flights)
  head(flights)

#big table wrapper
  ds<-tbl_df(flights)
  ds
  as.data.frame(ds)

#Filter rows with filter()
  filter(flights,month==1,day==1)
  filter(flights,month!=1,day==1)
  filter(flights,month==1|month==2)

#To select rows by position, use slice():
  slice(flights,1:10)

#Arrange rows with arrange()
  arrange(flights,year,month,day)
    #Use desc() to order a column in descending order:
      arrange(flights,desc(arr_delay))

#Select columns with select()
  # Select columns by name
    select(flights, year, month, day)

``# Select all columns between year and day (inclusive)
    select(flights, year:day)

  # Select all columns except those from year to day (inclusive)
    select(flights, -(year:day))

  #rename variables with select() by using named arguments:
    select(flights, tail_num = tailnum)

# rename columns
  rename(flights, tail_num = tailnum)

# Extract distinct (unique) rows
  distinct(select(flights, tailnum))
  distinct(select(flights, origin, dest))

#Add new columns with mutate()
  mutate(flights,
         gain = arr_delay - dep_delay,
         speed = distance / air_time * 60)

#If you only want to keep the new variables, use transmute():
  transmute(flights,
            gain = arr_delay - dep_delay,
            gain_per_hour = gain / (air_time / 60))

#Summarise values with summarise()
  summarise(flights,
            delay = mean(dep_delay, na.rm = TRUE))

#Randomly sample rows with sample_n() and sample_frac()
  sample_n(flights, 10)
  sample_frac(flights, 0.01)

##############Grouped operations
  by_tailnum <- group_by(flights, tailnum)
  delay <- summarise(by_tailnum,
                     count = n(),
                     dist = mean(distance, na.rm = TRUE),
                     delay = mean(arr_delay, na.rm = TRUE))
  delay <- filter(delay, count > 20, dist < 2000)

##### joins
inner_join (similar to merge with all.x=F and all.y=F)
left_join (similar to merge with all.x=T and all.y=F)
semi_join (not really an equivalent in merge() unless y only includes join fields)
anti_join (no equivalent in merge(), this is all x without a match in y)


###############
#replace a value the base way
a<-data.frame(x=c(1:5,NA),y=c(6:1))
a
a$y[a$x==3]<-23
a

#replace a value the dplyr way
library(dplyr)
a<-data.frame(x=c(1:5,NA),y=c(6:1))
a
a<-mutate(a,y=ifelse(y==3,23,y))
a


