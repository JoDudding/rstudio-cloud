#-------------------------------------------------------------------------------
#' hexagons.r
#-------------------------------------------------------------------------------
#' jo dudding
#' apr 21
#' code to create hexagons and and nz hexmap
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' run setup
#-------------------------------------------------------------------------------

source('scripts/setup.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' get my theme
#-------------------------------------------------------------------------------

source('scripts/my_theme.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' hexagon data frame
#-------------------------------------------------------------------------------

hex_r <- 1
hex_R <- hex_r * sqrt(3) / 2

y <- c(
  1.5 * hex_r,
  2.0 * hex_r,
  1.5 * hex_r,
  0.5 * hex_r,
  0.0 * hex_r,
  0.5 * hex_r
)

x <- c(
  2 * hex_R,
  hex_R,
  0,
  0,
  hex_R,
  2 * hex_R
)

hexagon <- as.data.frame(cbind(x, y)) %>%
  mutate(
    val = 1,
    id = 1
  )

#-------------------------------------------------------------------------------
# nz regions
#-------------------------------------------------------------------------------

nz_region <- tibble(
  regc_name = c(
    "Northland Region",
    "Auckland Region",
    "Waikato Region",
    "Bay of Plenty Region",
    "Gisborne Region",
    "Hawke's Bay Region",
    "Taranaki Region",
    "Manawatu-Whanganui Region",
    "Wellington Region",
    "West Coast Region",
    "Canterbury Region",
    "Otago Region",
    "Southland Region",
    "Tasman Region",
    "Nelson Region",
    "Marlborough Region")
) %>%
  mutate(
    regc_name = str_trim(regc_name),
    region = str_remove(regc_name, " Region"),
    order = 1:16,
    regc_code = str_pad(order, width = 2, pad = "0"),
    regc_name_f = reorder(regc_name, order),
    region_f = reorder(region, order),
    code = case_when(
      region == 'Northland' ~ 'NTL',
      region == 'Auckland' ~ 'AUK',
      region == 'Waikato' ~ 'WKO',
      region == 'Bay of Plenty' ~ 'BOP',
      region == 'Gisborne' ~ 'GIS',
      region == "Hawke's Bay" ~ 'HKB',
      region == 'Taranaki' ~ 'TKI',
      region == 'Manawatu-Whanganui' ~ 'MWT',
      region == 'Wellington' ~ 'WGN',
      region == 'West Coast' ~ 'WTC',
      region == 'Canterbury' ~ 'CAN',
      region == 'Otago' ~ 'OTA',
      region == 'Southland' ~ 'STL',
      region == 'Tasman' ~ 'TAS',
      region == 'Nelson' ~ 'NSN',
      region == 'Marlborough' ~ 'MBH'
    ),
    code_f = reorder(code, order),
    hex_x = c(8, 9, 8, 10, 12, 11, 7, 9, 8, 2, 4, 3, 1, 3, 4, 	5) ,
    hex_y = 9 - c(1, 2, 3, 3, 3, 4, 4, 4, 5, 7, 7, 8, 8, 6, 5, 6)
  )

#-------------------------------------------------------------------------------
# nz region hexagons
#-------------------------------------------------------------------------------

nz_region_hex <- nz_region %>%
  mutate(id = 1) %>%
  left_join(hexagon, by = 'id') %>%
  mutate(
    x = x + hex_x * hex_R,
    y = y + hex_y * hex_r * 1.5
  ) %>%
  group_by(code) %>%
  mutate(
    mid_x = (max(x) - min(x)) / 2 + min(x),
    mid_y = (max(y) - min(y)) / 2 + min(y)
  ) %>%
  select(-id) %>% 
  ungroup()

#-------------------------------------------------------------------------------
#' hex map
#-------------------------------------------------------------------------------

xxx <- nz_region %>%
  select(code) %>%
  mutate(
    value = runif(n()),
    label = paste0(code, "\n", percent(value))
  )


nz_region_hex <- nz_region_hex %>%  
  left_join(xxx, by = "code")

ggplot(nz_region_hex, aes(x = x, y = y, label = label)) +
  geom_polygon(aes(fill = value, group = code),
               colour = "white", 
               size = 0.5
  ) +
  geom_text(aes(x = mid_x, y = mid_y),
            colour = "white"
  ) +
  scale_fill_viridis_c(labels = percent_format(accuracy = 1L)) +
  coord_fixed() +
  guides(colour = "none", x = 'none', y = 'none') +
  labs(
    fill = NULL,
    title = "Example of a hex plot for New Zealand"
  ) +
  theme_jo_void() +
  theme(
    legend.position = c(0.95, 0.05),
    legend.justification = c("right", "bottom")
  )

save_chart("nz_hex_map", height = 19, width = 16)


#-------------------------------------------------------------------------------
