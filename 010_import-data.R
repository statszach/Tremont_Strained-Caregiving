rm(list = setdiff(ls(), lsf.str())[!(setdiff(ls(), lsf.str()) %in% "params")])
source(here::here("005_folder-paths-and-options.R"))

data <- haven::read_sav(fs::path(data_path, "Baseline data 11-4-12.sav"))


saveRDS(data, here::here(rds_path, "010_data.RDS"))