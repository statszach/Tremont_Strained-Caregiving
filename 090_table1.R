rm(list = setdiff(ls(), lsf.str())[!(setdiff(ls(), lsf.str()) %in% "params")])
source(here::here("001_libraries.R"))
source(here::here("005_folder-paths-and-options.R"))

data <- readRDS(here::here(rds_path, "020_tidy01.RDS"))

t1data <- data %>% 
  filter(CGrel == "1" | CGrel == "2")

t1 <- t1data %>% 
      select(-CGID) %>% 
      gtsummary::tbl_summary(statistic = list(c("SEQSM", "SEQSS", "ADL", "IADL", "CDRSum", "CGage",
                                            "CGlength", "EQ5D6", "Burns", "RMBPCFT", "PACtot",
                                            "ZBITOTAL", "CESDTOTAL") ~ "{mean} ({sd})",
                                            c("CGrel") ~ "{n} ({p}%)"),
                             missing_text = "(Missing)")


saveRDS(t1, here::here(rds_path, "090_table1.RDS"))