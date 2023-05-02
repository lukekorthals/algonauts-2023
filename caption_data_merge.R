# Script for extracting the relevant captions for the Algonauts Challenge

# Load required libraries
library(tidyverse)
library(tidyjson)
library(jsonlite)

# Set working directory of files "captions_train2017.json", "captions_val2017.json", "nsd_stim_info_merged.csv"
setwd('/Users/lucat/Downloads/')

# Load in CSV with three important columns: COCO ID, NSD ID, and Subject No.
data_id <- read_csv('nsd_stim_info_merged.csv') %>%
  select(c(cocoId, nsdId, subject1:subject8)) %>%
  pivot_longer(cols = subject1:subject8, names_to = 'subject') %>%
  filter(value != 0) %>%
  select(-value) %>%
  mutate(subject = gsub('ect', '0', subject)) 

# Load in caption data and merge into one dataframe
val_cap <- fromJSON('captions_val2017.json')['annotations']$annotations %>%
  select(-id) %>%
  distinct(image_id, .keep_all = TRUE)

train_cap <- fromJSON('captions_train2017.json')['annotations']$annotations %>%
  select(-id) %>%
  distinct(image_id, .keep_all = TRUE)

data_cap <- bind_rows(train_cap, val_cap) %>%
  rename(cocoId = image_id)

rm(list = c("train_cap", "val_cap"))

# Join ID and caption dataframes based on COCO ID (key between both)
final_df <- data_id %>%
  left_join(data_cap, by = 'cocoId') 

# Identify shared images (1 = no, 8 = yes) in separate column
final_df <- final_df %>%
  group_by(nsdId) %>% 
  summarise(n = n()) %>%
  left_join(final_df, by = 'nsdId')

# Write to csv
write_csv(final_df, "algonauts_2023_caption_data.csv")
