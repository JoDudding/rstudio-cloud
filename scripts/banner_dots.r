#-------------------------------------------------------------------------------
#' banner_dots.r
#-------------------------------------------------------------------------------
#' jo dudding
#' apr 21
#'  code to create a banner to use in the readme
#-------------------------------------------------------------------------------

project_title <- 'Learning and Exploration'

#-------------------------------------------------------------------------------
#' run setup
#-------------------------------------------------------------------------------

source('scripts/setup.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' colour palette
#-------------------------------------------------------------------------------

source('scripts/my_theme.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' helper functions
#-------------------------------------------------------------------------------

source('scripts/helper_functions.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' pick colours for banner
#-------------------------------------------------------------------------------

lightest <- pal_jo['light_yellow']
darkest <- pal_jo['dark_purple']
grey <- pal_jo['charcoal']

#-------------------------------------------------------------------------------
#' create data
#-------------------------------------------------------------------------------

tmp <- tibble(
  x = runif(77) * 35,
  y = runif(77) * 2,
  col = c(1, rep(2:6, 15), 7)
)

#-------------------------------------------------------------------------------
#' create plot
#-------------------------------------------------------------------------------

ggplot(tmp, aes(x, y)) +
  annotate('rect', xmin = -50, xmax = 50, ymin = -50, ymax = 50, 
           fill = grey) +
  geom_point(aes(colour = col, fill = col), alpha = 0.5, size = 3) +
  geom_point(aes(colour = col, fill = col), size = 2.5) +
  annotate('text', x = 0.5, y = 1, label = project_title,
           colour = lightest, size = 6, fontface = 'bold', hjust = 'left') +
  annotate('rect', xmin = 0.25, xmax = 34.75, ymin = 0.25, ymax = 1.75, 
           colour = lightest, fill = NA, size = 1) +  
  scale_fill_viridis_c(option = 'magma') +
  scale_colour_viridis_c(option = 'magma') +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  guides(colour = 'none', fill = 'none') + 
  coord_cartesian(xlim = c(0, 35), ylim = c(0, 2)) +
  theme_void()

#-------------------------------------------------------------------------------
#' save banner
#-------------------------------------------------------------------------------

save_banner()

#------------------------------------------------------------------------------
