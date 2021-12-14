rm(list = setdiff(ls(), lsf.str())[!(setdiff(ls(), lsf.str()) %in% "params")])
source(here::here("001_libraries.R"))
source(here::here("005_folder-paths-and-options.R"))

data <- readRDS(here::here(rds_path, "010_data.RDS"))

# Key variables:
#
# Self-efficacy for symptom management (SEQ-SM)            - SEQSM (took SEQSS too)
# Care recipient behavior problems                         - RMBPCFT
# Positive aspects of caregiving                           - PACTOT
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
  dplyr::mutate(CGID = as.numeric(CGID),
                CDR1 = as.numeric(CDR1),
                CDR2 = as.numeric(CDR2),
                CDR3 = as.numeric(CDR3),
                CDR4 = as.numeric(CDR4),
                CDR5 = as.numeric(CDR5),
                CDR6 = as.numeric(CDR6),
                CDRSum = CDR1 + CDR2 + CDR3 + CDR4 + CDR5 + CDR6,
                CGrel = as.factor(CGrel)) %>% 
  dplyr::select(CGID, SEQSM, SEQSS, ADL, IADL, CDRSum, CGage, CGrel, CGlength, EQ5D6, Burns, RMBPCFT, PACtot,
                ZBITOTAL, CESDTOTAL)


saveRDS(tidy01, here::here(rds_path, "020_tidy01.RDS"))