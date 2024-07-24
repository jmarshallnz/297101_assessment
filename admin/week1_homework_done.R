library(tidyverse)
library(readxl)

foo <- read_csv("admin/297101_2024_S2FS-Homework 1-grades.csv")

foo |> print(n=100) |> pull(`Email address`) |> paste(collapse=";")
