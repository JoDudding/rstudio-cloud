#-------------------------------------------------------------------------------
#' helper_functions.r
#-------------------------------------------------------------------------------
#' jo dudding
#' april 21
#' helper functions i use often
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' run setup
#-------------------------------------------------------------------------------

source('scripts/setup.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' scales
#-------------------------------------------------------------------------------

percent <- function(x, accuracy = 0.1, ...) {
  scales::percent(x, accuracy = accuracy, big.mark = ",", ...)
}

comma <- function(x, accuracy = 1L, ...) {
  scales::comma(x, accuracy = accuracy, ...)
}

dollar <- function(x, accuracy = 1L, ...) {
  scales::dollar(x, accuracy = accuracy, ...)
}

#-------------------------------------------------------------------------------
#' ggplot text
#-------------------------------------------------------------------------------

geom_text_stack <- function(size = 3, colour = 'white', ...) {
  geom_text(
    size = size, 
    colour = colour,
    position = position_stack(vjust = 0.5), 
    ...
  )
}

geom_text_above <- function(size = 3, colour = 'black', ...){
  geom_text(
    size = size, 
    colour = colour,
    vjust = -0.2, 
    ...
  )
}

#-------------------------------------------------------------------------------
#' ggplot scale_*
#-------------------------------------------------------------------------------

scale_colour_bnz <- function(...) {
  scale_colour_manual(values = .pal.bnzfull, ...)
}

scale_fill_bnz <- function(...) {
  scale_fill_manual(values = .pal.bnzfull, ...)
}

scale_colour_bnz_grad <- function(...) {
  scale_colour_gradient(high = .bnzblue, low = .bnzpaleblue, ...)
}

scale_fill_bnz_grad <- function(...) {
  scale_fill_gradient(high = .bnzblue, low = .bnzpaleblue, ...)
}

scale_colour_discrete <- scale_colour_bnz
scale_fill_discrete <- scale_fill_bnz


scale_y_pct <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_y_continuous(
    labels = scales::percent_format(accuracy = accuracy, big.mark = ","),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_y_comma <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_y_continuous(
    labels = scales::comma_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_y_dollar <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_y_continuous(
    labels = scales::dollar_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_x_pct <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_x_continuous(
    labels = scales::percent_format(accuracy = accuracy, big.mark = ","),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_x_comma <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_x_continuous(
    labels = scales::comma_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_x_dollar <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_x_continuous(
    labels = scales::dollar_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_fill_pct <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_fill_continuous(
    labels = scales::percent_format(accuracy = accuracy, big.mark = ","),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_fill_comma <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_fill_continuous(
    labels = scales::comma_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_fill_dollar <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_fill_continuous(
    labels = scales::dollar_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_colour_pct <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_colour_continuous(
    labels = scales::percent_format(accuracy = accuracy, big.mark = ","),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_colour_comma <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_colour_continuous(
    labels = scales::comma_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

scale_colour_dollar <- function(
  accuracy = 1L, 
  breaks = pretty_breaks(),
  expand = expansion(mult = c(0, .05)),
  ...
) {
  scale_colour_continuous(
    labels = scales::dollar_format(accuracy = accuracy),
    breaks = breaks,
    expand = expand,
    ...
  )
}

#-------------------------------------------------------------------------------
#' geom_point options
#-------------------------------------------------------------------------------

geom_filled <- function(pch = 21, colour = 'white', stroke = 0.6, 
                        size = 3, ...) {
  geom_point(pch = pch, colour = colour, stroke = stroke, size = size, ...)
}

geom_hollow <- function(pch = 21, fill = NA, stroke = 0.6, size = 3, ...) {
  geom_point(pch = pch, fill = fill, stroke = stroke, size = size, ...)
}

#-------------------------------------------------------------------------------
#' age bands
#-------------------------------------------------------------------------------

age_ten <- function(age_var) {
  cut(age_var, 
      c(-Inf, seq(10, 80, by = 10), Inf), 
      labels = c('<= 10',
                 glue("{seq(11, 71, by = 10)} - {seq(20, 80, by = 10)}"), 
                 '> 80')
  )
}

age_five <- function(age_var) {
  cut(age_var, 
      c(-Inf, seq(6, 81, by = 5), Inf), 
      labels = c('< 5',
                 glue("{seq(5, 75, by = 5)} - {seq(9, 79, by = 5)}"), 
                 '>= 80')
  )
}

age_band <- function(age_var) {
  cut(age_var,
      c(-Inf, 14, 29, 49, 64, Inf),
      labels = c('< 15', '15 - 29', '30 - 49', '50 - 64', '65 +')
      
  )
}

#-------------------------------------------------------------------------------
#' summarisation
#-------------------------------------------------------------------------------

mean_last <- function(x) {
  if(is.numeric(x)) mean(x, na.rm = TRUE) else last(x)
}  

sum_last <- function(x) {
  if(is.numeric(x)) sum(x, na.rm = TRUE) else last(x)
}  

#-------------------------------------------------------------------------------
#' stringr and factors
#-------------------------------------------------------------------------------


#' use str_sub on a factor
str_sub_factor <- function(x, start = 1L, end = -1L, ...) {
  levels(x) = stringr::str_sub(levels(x), start = start, end = end, ...)
  x
}

#' use str_wrap on a factor
str_wrap_factor <- function(x, ...) {
  levels(x) <- stringr::str_wrap(levels(x), ...)
  x
}

#-------------------------------------------------------------------------------
#' ggsave
#-------------------------------------------------------------------------------

save_chart <- function(
  chart_name, device = "png", units = "cm", width = 19, height = 13.4,
  dpi = 150, retina = 3, ...
) {
  ggsave(paste0(
    "outputs/",
    chart_name,
    ".png"
  ),
  device = device,
  units = units,
  width = width,
  height = height,
  dpi = dpi
  )
}

save_twitter <- function(
  chart_name, device = "png", units = "in", width = 9.877, height = 5.556,
  dpi = 72, retina = 3, ...
) {
  ggsave(paste0(
    "outputs/",
    chart_name,
    ".png"
  ),
  device = device,
  units = units,
  width = width,
  height = height,
  dpi = dpi
  )
}


save_banner <- function(
  chart_name = 'banner', device = "png", units = "cm", width = 35, height = 2,
  dpi = 150, retina = 3, ...
  
) {
  ggsave(paste0(
    "img/",
    chart_name,
    ".png"
  ),
  device = device,
  units = units,
  width = width,
  height = height,
  dpi = dpi
  )  
}  


#-------------------------------------------------------------------------------
