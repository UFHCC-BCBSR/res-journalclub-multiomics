library(ggplot2)

# Updated data
data <- data.frame(
  Year = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 
           2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026),
  Count = c(2, 2, 2, 2, 5, 10, 18, 42, 56, 95, 
            193, 226, 352, 533, 927, 1626, 2269, 2668, 3856, 8632, 1721)
)

# Remove 2026 (incomplete year)
data <- data[data$Year < 2026, ]

# Plot with integer years
ggplot(data, aes(x = Year, y = Count)) +
  geom_line(color = "#2C3E50", size = 1.2) +
  geom_point(color = "#E74C3C", size = 3) +
  scale_x_continuous(breaks = seq(2006, 2025, 2)) +  # Every 2 years for readability
labs(title = "Growth in Multi-Omics Publications",
     subtitle = 'Number of publications per year | Search: "multi-omics"[Title/Abstract]',
     x = "Year",
     y = "Number of Publications") +  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 16),
        panel.grid.minor = element_blank())

ggsave("multiomics_growth.png", width = 10, height = 6, dpi = 300)
