# ---
# Cameryn Brock
# --- 

library(tidyverse)
library(janitor)
library(here)

# Read in data

db <- read_csv(here::here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)

# Create a subset, then graph
# Personal preference on whether to include a new df or not

db_sub <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days" & sex == "Both")

# Create a basic line graph

ggplot(db_sub, aes(x = year,
                   y = deaths_per_100k)) + 
  geom_line(aes(color = country_name)) + 
  labs(x = "Year",
       y = "Deaths within 0-6 days (per 100,000)")



# %in% c() means "keep anything within"
# CHECK CHARACTER STRINGS unique(db_sub$country_name)  in console
# If want to check variables, use levels

