

##save the census api key:
#cat("CENSUS_API_KEY=eb5e651aa616016f0ab03c0a8154eeec47e8c96d\n",file=file.path(normalizePath("~/"), ".Renviron"),append=TRUE)
##restart R

library(tidycensus)
library(tidyverse)

m90 <- get_decennial(geography = "state", variables = "H043A001", year = 1990,state='02879')

head(m90)

orange <- get_acs(state = "CA", county = "Orange", geography = "tract", 
                  variables = "B19013_001", geometry = TRUE)
wash <- get_acs(state = "RI", county = "Washington", geography = "tract", 
                  variables = "B19013_001", geometry = TRUE)
wakefield <- get_acs(state = "02879", geography = "tract", 
                variables = "B19013_001", geometry = TRUE)

wakefield <- get_decennial(state = "02879", geography = "tract", 
                     variables = "B19013_001", geometry = TRUE)

harris <- get_decennial(geography = "tract", variables = "B19013_001", state = "TX", county = "Harris County", geometry = TRUE,summary_var = "P0010001")

racevars <- c("P0050003", "P0050004", "P0050006", "P0040003")

harris <- get_decennial(geography = "tract", variables = racevars, key = api_key,
                        state = "TX", county = "Harris County", geometry = TRUE,
                        summary_var = "P0010001")

wash <- get_decennial(geography = "tract", variables = "P0070002", key = api_key,
                        state = "RI", county = "Washington County", geometry = TRUE,
                        year=2010) 

ri <- get_decennial(geography = "tract", variables = "P0070002", key = api_key,
                      state = "RI", geometry = TRUE,
                      year=2010) 

wake <- get_decennial(geography = "tract", variables = "P0070002", key = api_key,
                    state = "02879", geometry = TRUE,
                    year=2010) 








v10 <- load_variables(2010, "sf1", cache = FALSE)

View(v10)

plot(orange)
