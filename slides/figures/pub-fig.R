library(ggplot2)

# Your data
data <- data.frame(
  Year = c(2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026),
  Count = c(1, 2, 4, 4, 8, 27, 54, 107, 180, 227, 306, 525, 1360, 244)
)

# Remove 2026 (incomplete year)
data <- data[data$Year < 2026, ]

# Plot with integer years
ggplot(data, aes(x = Year, y = Count)) +
  geom_line(color = "#2C3E50", size = 1.2) +
  geom_point(color = "#E74C3C", size = 3) +
  scale_x_continuous(breaks = seq(2013, 2025, 1)) +  # Force integer years
  labs(title = "Growth in Multi-Omics Integration Methods",
       subtitle = "Number of publications per year",
       x = "Year",
       y = "Number of Publications") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 16),
        panel.grid.minor = element_blank())

ggsave("multiomics_growth.png", width = 8, height = 5, dpi = 300)
