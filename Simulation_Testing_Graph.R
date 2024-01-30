install.packages("tidyverse")
library(tidyverse)

###simulation of the height data###

set.seed(853)
mean_hu = 175
sd_hu = 2
logmean_hu = log(mean_hu^2/sqrt(mean_hu^2+sd_hu^2))
logsd_hu = sqrt(log(1+sd_hu^2/mean_hu^2))
height_hugo <- tibble(height = rlnorm(n=20, logmean_hu, logsd_hu), measurer = "Hugo")


set.seed(854)
mean_ed = 172
sd_ed = 1
logmean_ed = log(mean_ed^2/sqrt(mean_ed^2+sd_ed^2))
logsd_ed = sqrt(log(1+sd_ed^2/mean_ed^2))
height_edward <- tibble(height = rlnorm(n=20, logmean_ed, logsd_ed), measurer = "Edward")


set.seed(855)
mean_lu = 171
sd_lu = 0.9
logmean_lu = log(mean_lu^2/sqrt(mean_lu^2+sd_lu^2))
logsd_lu = sqrt(log(1+sd_lu^2/mean_lu^2))
height_lucy <- tibble(height = rlnorm(n=20, logmean_lu, logsd_lu), measurer = "Lucy")

heightdata <- rbind(height_edward, height_hugo, height_lucy)

###Test the simulation codes###
heightdata$measurer |> unique() == c("Lucy", "Hugo", "Edward") 
heightdata$height |> min() > 0
heightdata$height |> class() == "numeric"

head(heightdata)

###Plot with the simulated data###

combined_plot <- ggplot(heightdata, mapping = aes(x = height, fill = measurer)) +
  geom_histogram(alpha = 0.5, position = "identity", bins = 50) +
  theme_bw()+
  labs(x = "Height(cm)",
       y = "Number of occurrences", fill = "Measurer",
       caption = "Figure 1. Distribution of student heights as measured by Edward, Hugo and Lucy."
  )+
  scale_color_brewer(palette = "Set1")

combined_plot

install.packages("usethis")
library(usethis)
install.packages("gitcreds")
create_github_token()
library(gitcreds)
gitcreds_set()


