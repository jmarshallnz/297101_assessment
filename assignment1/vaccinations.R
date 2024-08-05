library(tidyverse)

vacc <- read_csv(here::here("data/vaccinations_all.csv"))
vacc_total <- vacc %>% filter(DHB != "National", Ethnicity != "Total") %>%
  group_by(DHB, Date, Age) %>% summarise(Eligible = sum(Eligible, na.rm=TRUE), Immunised = sum(Immunised, na.rm=TRUE)) %>%
  ungroup() %>% filter(Immunised > 0, Age != "54 months")
write_csv(vacc_total, here::here("data/vaccinations.csv"))

# 1. Create code that computes the proportion vaccinated for each DHB for each age and each time period.
vacc_perc <- vacc_total %>% mutate(Proportion = Immunised / Eligible)

# 2. The current health target for immunisation is having 95% of 24 month olds immunised. Which DHBs are meeting this?
#  Hint: Use filter to find the rows you want, and then count by DHB.
vacc_perc %>% filter(Age == "24 months") %>% filter(Proportion >= 0.95) %>% count(DHB)

# 3. Do a plot of each DHB through time and the proportion immunised at 24 months.
# 
ggplot(vacc_perc %>% filter(Age == "24 months")) +
  geom_line(aes(x=Date, y=Proportion)) +
  geom_hline(yintercept = 0.95) +
  facet_wrap(vars(DHB))

# 4. The previous health target was having 95% of 2 year olds immunised. Which DHBs at which times are meeting this?
vacc_perc %>% filter(Age == "24 months") %>% filter(Proportion >= 0.95) %>% count(DHB)

# 5. Choose ONE (1) DHB (e.g. perhaps where you grew up, if you did so in NZ, or where a friend or family grew up if not from NZ),
# and demonstrate how that DHB is tracking over time for all age groups. You might want to consider smoothing the data.
ggplot(vacc_perc %>% filter(DHB == "Auckland")) +
  geom_line(aes(x=Date, y=Proportion, col=Age)) +
  geom_hline(yintercept = 0.95) +
  geom_smooth(aes(x=Date, y=Proportion, col=Age))
