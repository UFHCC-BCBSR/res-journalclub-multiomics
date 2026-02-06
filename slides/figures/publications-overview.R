library(ggplot2)

# General multi-omics data
general_data <- data.frame(
  Year = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 
           2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026),
  Count = c(2, 2, 2, 2, 5, 10, 18, 42, 56, 95, 
            193, 226, 352, 533, 927, 1626, 2269, 2668, 3856, 8632, 1721)
)

# Integration methods data (add zeros for 2006-2012 to match year range)
methods_data <- data.frame(
  Year = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026),
  Count = c(0, 0, 0, 0, 0, 0, 0, 1, 2, 4, 4, 8, 27, 54, 107, 180, 227, 306, 525, 1360, 244)
)

# Remove 2026 (incomplete year) from both
general_data <- general_data[general_data$Year < 2026, ]
methods_data <- methods_data[methods_data$Year < 2026, ]

# Set common axis limits
year_range <- c(2006, 2025)
count_range <- c(0, max(general_data$Count, methods_data$Count))

# Plot 1: General multi-omics
ggplot(general_data, aes(x = Year, y = Count)) +
  geom_line(color = "#2C3E50", linewidth = 1.2) +
  geom_point(color = "#E74C3C", size = 3) +
  scale_x_continuous(breaks = seq(2006, 2025, 2), limits = year_range) +
  scale_y_continuous(limits = count_range) +
  labs(title = "Growth in Multi-Omics Publications",
       subtitle = 'Search: "multi-omics"[Title/Abstract]',
       x = "Year",
       y = "Number of Publications") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 16),
        panel.grid.minor = element_blank())

ggsave("multiomics_growth_general.png", width = 10, height = 6, dpi = 300)

# Plot 2: Integration methods
ggplot(methods_data, aes(x = Year, y = Count)) +
  geom_line(color = "#2C3E50", linewidth = 1.2) +
  geom_point(color = "#E74C3C", size = 3) +
  scale_x_continuous(breaks = seq(2006, 2025, 2), limits = year_range) +
  scale_y_continuous(limits = count_range) +
  labs(title = "Growth in Multi-Omics Integration Methods",
       subtitle = 'Search: "multi-omics integration" + methods/algorithm/tool terms',
       x = "Year",
       y = "Number of Publications") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 16),
        panel.grid.minor = element_blank())

ggsave("multiomics_growth_methods.png", width = 10, height = 6, dpi = 300)

print("Both plots saved with matching axes!")
