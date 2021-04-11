#-------------------------------------------------------------------------------
#' setup.r
#-------------------------------------------------------------------------------
#' jo dudding
#' april 21
#' common set up steps
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' libraries
#-------------------------------------------------------------------------------

# basics
library(tidyverse)
library(scales)
library(lubridate)
library(glue)
library(rmarkdown)
library(knitr)
library(yaml)
library(here)

# clean and check
library(janitor)
library(skimr)

# tables
library(gt)
library(kableExtra)
library(DT)

# ggplot extensions
library(patchwork)
library(ggtext)
library(GGally)
library(ggiraph)
library(ggrepel)
library(ggforce)
library(ggbeeswarm)
library(ggExtra)
library(ggalluvial)
library(geofacet)
#library(ggfx)

# animation
library(gganimate)
library(magick)

# modelling
library(tidymodels)
library(tidytext)

# colours and fonts
library(colorspace)
library(gfonts)
#library(ragg)
library(thematic)
library(emo)

# slides
library(xaringan)
library(xaringanthemer)
library(xaringanExtra)

# learning
library(tidytuesdayR)

# maps
library(leaflet)

#-------------------------------------------------------------------------------
#' options
#-------------------------------------------------------------------------------

options(
  dplyr.width = Inf,
  papersize = "a4",
  tab.width = 2,
  width = 80,
  max.print = 100,
  stringsAsFactors = FALSE,
  lubridate.week.start = 6,
  tibble.print_max = 100,
  tibble.print_min = 100,
  tibble.width = Inf
)

#-------------------------------------------------------------------------------
#' 
#-------------------------------------------------------------------------------
