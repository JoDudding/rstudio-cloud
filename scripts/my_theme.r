#-------------------------------------------------------------------------------
#' my_theme.r
#-------------------------------------------------------------------------------
#' jo dudding
#' april 2021
#' custom theme for ggplot2
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' run setup
#-------------------------------------------------------------------------------

source('scripts/setup.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' colour theme
#-------------------------------------------------------------------------------

pal_jo <- c(viridisLite::magma(8)[2:8], "#4C4C53", "#9B9BA8")

names(pal_jo) <- c(
  'dark_purple', 'purple', 'orchid', 'pink', 'orange', 'light_orange', 
  'light_yellow', 'charcoal', 'light_charcoal'
)

#pal_jo %>%
#  show_col()

#pal_jo['light_orange']

#-------------------------------------------------------------------------------
#' ggplot theme
#-------------------------------------------------------------------------------

theme_jo <- function(
  add_colour = "#5F187FFF",
  base_family = "Fira Sans",
  base_size = 15,
  x_grid_colour = "grey92",
  y_grid_colour = "grey92",
  ...
) {
  
  theme_bw(...) %+replace%
    theme(
      # default font
      text = element_text(family = base_family, size = base_size),
      # align title and caption to the plot not the panel
      plot.title.position = 'plot',
      plot.caption.position = 'plot',
      # change the title and caption to markdown and move them futher from the plot
      plot.title = element_markdown(
        hjust = 0, 
        margin = margin(c(0, 0, 10, 0)),
        colour = add_colour
      ),
      plot.subtitle = element_markdown(
        hjust = 0, 
        margin = margin(c(0, 0, 15, 0))
      ),
      plot.caption = element_markdown(
        hjust = 1, 
        margin = margin(c(10, 0, 0, 0))
      ),
      # move axis titles to the left/top and change them to markdown
      axis.title = element_markdown(hjust = 1),
      # allow the axis values to the markdown as well
      axis.text = element_markdown(),
      # remove the panel border
      panel.border = element_blank(),
      # put in the axis lines with a slightly thicker line than the gridlines
      axis.line = element_line(colour = "grey92", size = rel(1.5)),
      # make the tickmarks the same colour
      axis.ticks = element_line(colour = "grey92"),
      # facet strip text left aligned with extra space above
      strip.text = element_markdown(
        hjust = 0, margin = margin(c(10, 0, 0, 0)), colour = add_colour
      ),
      # clear colour and fill for strip
      strip.background = element_rect(colour = NA, fill = NA),
      # dotted gridlines
      panel.grid = element_line(linetype = 'dotted'),
      # ability to use a different colour for the gridlines
      panel.grid.major.x = element_line(colour = x_grid_colour),
      panel.grid.major.y = element_line(colour = y_grid_colour)
    )
}

#-------------------------------------------------------------------------------
#' 'set theme
#-------------------------------------------------------------------------------

theme_set(theme_jo())

#-------------------------------------------------------------------------------
#' void version of theme
#-------------------------------------------------------------------------------

theme_jo_void <- function(
  add_colour = "#5F187FFF",
  base_family = "Fira Sans",
  base_size = 15,
  ...
) {
  
  theme_void(...) %+replace%
    theme(
      # default font
      text = element_text(family = base_family, size = base_size),
      # align title and caption to the plot not the panel
      plot.title.position = 'plot',
      plot.caption.position = 'plot',
      # change the title and caption to markdown and move them futher from the plot
      plot.title = element_markdown(
        hjust = 0, 
        margin = margin(c(0, 0, 10, 0)),
        colour = add_colour
      ),
      plot.subtitle = element_markdown(
        hjust = 0, 
        margin = margin(c(0, 0, 15, 0))
      ),
      plot.caption = element_markdown(
        hjust = 1, 
        margin = margin(c(10, 0, 0, 0))
      ),
      # set axis stuff to blank
      axis.title = element_blank(),
      axis.text = element_blank(),
      panel.border = element_blank(),
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank(),
      strip.text = element_markdown(
        hjust = 0, margin = margin(c(10, 0, 0, 0)), colour = add_colour
      ),
      # clear colour and fill for strip
      strip.background = element_rect(colour = NA, fill = NA)
    )
}


#-------------------------------------------------------------------------------
