rm(list = setdiff(ls(), lsf.str())[!(setdiff(ls(), lsf.str()) %in% "params")])
source(here::here("001_libraries.R"))
source(here::here("005_folder-paths-and-options.R"))

data <- readRDS(here::here(rds_path, "010_data.RDS"))

# Key variables:
#
# Self-efficacy for symptom management (SEQ-SM)            - SEQSM (took SEQSS too)
# Care recipient behavior problems
# Positive aspects of caregiving
# ADL performance                                          - ADL/IADL
# Dementia severity (CDR)                                  - CDRTotal
# 
# The possible variables are:
#   
# Caregiver age                                            - CGage
# Caregiver relationship                                   - CGrel
# Length of time spent caregiving                          - CGlength
# Caregiver health                                         - EQ5D6
# Relationship satisfaction                                - Burns
#
# Outcome variables:
# Caregiver Burden                                         - ZBITOTAL
# Depression                                               - CESDTOTAL

tidy01 <- data %>% 
  dplyr::select(SEQSM, SEQSS, ADL, IADL, CDRTotal, CGage, CGrel, CGlength, EQ5D6, Burns, ZBITOTAL, CESDTOTAL)