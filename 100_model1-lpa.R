rm(list = setdiff(ls(), lsf.str())[!(setdiff(ls(), lsf.str()) %in% "params")])
source(here::here("001_libraries.R"))
source(here::here("005_folder-paths-and-options.R"))

data <- readRDS(here::here(rds_path, "020_tidy01.RDS"))

mplusdata <- data %>% 
  select(-CESDTOTAL, -ZBITOTAL) %>% 
  filter(CGrel == "1" | CGrel == "2")

fs::dir_create(mplus_path, "100_lpa-1class")
setwd(here::here(mplus_path, "100_lpa-1class"))

LCA1class_mpluscode <- mplusObject(
  usevariables = colnames(mplusdata),
  VARIABLE = "idvariable = CGID;
              classes = c (1);
              categorical are CGrel;",
  OUTPUT = "TECH4;",
  ANALYSIS = "TYPE = MIXTURE;",
  rdata = mplusdata)

LCA1class_output <- mplusModeler(LCA1class_mpluscode, modelout = "LCA1class.inp", run = TRUE)

lca1bic <- round(LCA1class_output$results$summaries$BIC, 0)

# 2 classes

fs::dir_create(mplus_path, "100_lpa-2class")
setwd(here::here(mplus_path, "100_lpa-2class"))

LCA2class_mpluscode <- mplusObject(
  usevariables = colnames(mplusdata),
  VARIABLE = "idvariable = CGID;
              classes = c (2);
              categorical are CGrel;",
  OUTPUT = "TECH4;",
  ANALYSIS = "TYPE = MIXTURE;",
  rdata = mplusdata)

LCA2class_output <- mplusModeler(LCA2class_mpluscode, modelout = "LCA2class.inp", run = TRUE)

lca2bic <- round(LCA2class_output$results$summaries$BIC, 0)

# 3 class

fs::dir_create(mplus_path, "100_lpa-3class")
setwd(here::here(mplus_path, "100_lpa-3class"))

LCA3class_mpluscode <- mplusObject(
  usevariables = colnames(mplusdata),
  VARIABLE = "idvariable = CGID;
              classes = c (3);
              categorical are CGrel;",
  OUTPUT = "TECH4;",
  ANALYSIS = "TYPE = MIXTURE;",
  rdata = mplusdata)

LCA3class_output <- mplusModeler(LCA3class_mpluscode, modelout = "LCA3class.inp", run = TRUE)

lca3bic <- round(LCA3class_output$results$summaries$BIC, 0)

# 4 class

fs::dir_create(mplus_path, "100_lpa-4class")
setwd(here::here(mplus_path, "100_lpa-4class"))

LCA4class_mpluscode <- mplusObject(
  usevariables = colnames(mplusdata),
  VARIABLE = "idvariable = CGID;
              classes = c (4);
              categorical are CGrel;",
  OUTPUT = "TECH4;",
  ANALYSIS = "TYPE = MIXTURE;",
  rdata = mplusdata)

LCA4class_output <- mplusModeler(LCA4class_mpluscode, modelout = "LCA4class.inp", run = TRUE)

lca4bic <- round(LCA4class_output$results$summaries$BIC, 0)

# 5 class

fs::dir_create(mplus_path, "100_lpa-5class")
setwd(here::here(mplus_path, "100_lpa-5class"))

LCA5class_mpluscode <- mplusObject(
  usevariables = colnames(mplusdata),
  VARIABLE = "idvariable = CGID;
              classes = c (5);
              categorical are CGrel;",
  OUTPUT = "TECH4 TECH11 TECH14;",
  ANALYSIS = "TYPE = MIXTURE;",
  rdata = mplusdata)

LCA5class_output <- mplusModeler(LCA5class_mpluscode, modelout = "LCA5class.inp", run = TRUE)

lca5bic <- round(LCA5class_output$results$summaries$BIC, 0)

# 6 class

fs::dir_create(mplus_path, "100_lpa-6class")
setwd(here::here(mplus_path, "100_lpa-6class"))

LCA6class_mpluscode <- mplusObject(
  usevariables = colnames(mplusdata),
  VARIABLE = "idvariable = CGID;
              classes = c (6);
              categorical are CGrel;",
  OUTPUT = "TECH4;",
  ANALYSIS = "TYPE = MIXTURE;",
  rdata = mplusdata)

LCA6class_output <- mplusModeler(LCA6class_mpluscode, modelout = "LCA6class.inp", run = TRUE)

lca6bic <- round(LCA6class_output$results$summaries$BIC, 0)