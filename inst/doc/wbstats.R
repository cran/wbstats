## ---- echo = FALSE------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages("wbstats")

## ---- eval = FALSE------------------------------------------------------------
#  devtools::install_github("nset-ornl/wbstats")

## -----------------------------------------------------------------------------
library(wbstats)

str(wb_cachelist, max.level = 1)

## ---- eval=FALSE--------------------------------------------------------------
#  library(wbstats)
#  
#  # default language is english
#  new_cache <- wb_cache()

## ---- echo=FALSE--------------------------------------------------------------
example_inds <- c("SP.POP.TOTL", "NY.GDP.MKTP.CD")

df <- wbstats::wb_cachelist$indicators[wbstats::wb_cachelist$indicators$indicator_id %in% example_inds, ]

head(df)

## -----------------------------------------------------------------------------
library(wbstats)

unemploy_inds<- wb_search("unemployment")

head(unemploy_inds)


## -----------------------------------------------------------------------------
library(wbstats)

blmbrg_vars <- wb_search("Bloomberg", fields = "source_org")

head(blmbrg_vars)


## -----------------------------------------------------------------------------
library(wbstats)

# 'poverty' OR 'unemployment' OR 'employment'
povemply_inds <- wb_search(pattern = "poverty|unemployment|employment")

head(povemply_inds)


## -----------------------------------------------------------------------------
library(wbstats)

# contains "gdp" and NOT "trade"
gdp_no_trade_inds <- wb_search("^(?=.*gdp)(?!.*trade).*", perl = TRUE)

head(gdp_no_trade_inds)

## -----------------------------------------------------------------------------
library(wbstats)

wb_langs <- wb_languages()

## -----------------------------------------------------------------------------
library(wbstats)

# Population, total
pop_data <- wb_data("SP.POP.TOTL", start_date = 2000, end_date = 2002)

head(pop_data)

## -----------------------------------------------------------------------------
library(wbstats)

# you can mix different ids and they are case insensitive
# you can even use SpOnGeBoB CaSe if that's the kind of thing you're into
# iso3c, iso2c, country, region_iso3c, admin_region_iso3c, admin_region, income_level
example_geos <- c("ABW","AF", "albania", "SSF", "eca", "South Asia", "HiGh InCoMe")
pop_data <- wb_data("SP.POP.TOTL", country = example_geos,
                    start_date = 2012, end_date = 2012)

pop_data

## -----------------------------------------------------------------------------
library(wbstats)

my_indicators = c("pop" = "SP.POP.TOTL", 
                  "gdp" = "NY.GDP.MKTP.CD")

pop_gdp <- wb_data(my_indicators, start_date = 2010, end_date = 2012)

head(pop_gdp)

## -----------------------------------------------------------------------------
library(wbstats)

my_indicators = c("pop" = "SP.POP.TOTL", 
                  "gdp" = "NY.GDP.MKTP.CD")

pop_gdp_long <- wb_data(my_indicators, start_date = 2010, end_date = 2012, return_wide = FALSE)

head(pop_gdp_long)

## -----------------------------------------------------------------------------
library(wbstats)

# most recent gdp per captia estimates
gdp_capita <- wb_data("NY.GDP.PCAP.CD", mrv = 1)

head(gdp_capita)

## -----------------------------------------------------------------------------
library(wbstats)

gdp_capita <- wb_data("NY.GDP.PCAP.CD", mrnev = 1)

head(gdp_capita)

## -----------------------------------------------------------------------------
library(wbstats)

# english
cache_en <- wb_cache()
sum(is.na(cache_en$indicators$indicator))

# spanish
cache_es <- wb_cache(lang = "es")
sum(is.na(cache_es$indicators$indicator))

