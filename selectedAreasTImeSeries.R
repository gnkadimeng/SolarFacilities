library(timetk)
library(dplyr)

solarData_long %>% 
  group_by(Areas)  %>%
  plot_time_series(DAT, value, 
                   .facet_ncol = 2, .facet_scales = "free",
                   .interactive = interactive)


# Convert DATE to Date type
solarData_long <- solarData_long %>%
  mutate(DATE = as.Date(DATE))

# Plotting the time series with timetk
solarData_long %>%
  plot_time_series(
    .date_var = DATE,
    .value = Units,
    .color_var = Areas,
    .facet_ncol = 2,
    .facet_scales = "free",
    .interactive = interactive)
  )

library(dplyr)
library(plotly)

# Select 6 random areas
set.seed(123)  # Setting seed for reproducibility
selected_areas <- solarData_long %>%
  distinct(Areas) %>%
  sample_n(6) %>%
  pull(Areas)

# Filter the dataset for the selected areas
filtered_data <- solarData_long %>%
  filter(Areas %in% selected_areas)

# Create a faceted time series plot
plot_list <- lapply(unique(filtered_data$Areas), function(area) {
  plot_ly(
    data = filtered_data %>% filter(Areas == area),
    x = ~DATE,
    y = ~Units,
    type = 'scatter',
    mode = 'lines',
    name = area
  ) %>% layout(title = area, showlegend = FALSE)
})

subplot(plot_list, nrows = 3, shareX = TRUE, shareY = TRUE, titleX = TRUE, titleY = TRUE) %>%
  layout(title = "Time Series of Selected Areas",
         xaxis = list(title = "Date"),
         yaxis = list(title = "Units"))

m4_daily %>%
  group_by(id) %>%
  plot_time_series(date, value, 
                   .facet_ncol = 2, .facet_scales = "free",
                   .interactive = interactive)