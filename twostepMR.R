# tsmr --------------------------------------------------------------------
# Fibers_191_Drnkwk -------------------------------------------------------
#34/83_pheno1256
outcome <- read_outcome_data(
  ICA_addresses[38],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/83_pheno1189
outcome <- read_outcome_data(
  ICA_addresses[98],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/83/91_pheno869
outcome <- read_outcome_data(
  ICA_addresses[185],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[91]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34_pheno767
outcome <- read_outcome_data(
  ICA_addresses[178],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/83/91_pheno590
outcome <- read_outcome_data(
  ICA_addresses[154],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[91]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/83_pheno1205
outcome <- read_outcome_data(
  ICA_addresses[33],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/83_pheno1250
outcome <- read_outcome_data(
  ICA_addresses[37],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/83_pheno956
outcome <- read_outcome_data(
  ICA_addresses[73],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#83_pheno597
outcome <- read_outcome_data(
  ICA_addresses[63],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[83]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34/91_pheno286
outcome <- read_outcome_data(
  ICA_addresses[79],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[91]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34_pheno1301
outcome <- read_outcome_data(
  ICA_addresses[82],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34_pheno601
outcome <- read_outcome_data(
  ICA_addresses[22],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34_pheno593
outcome <- read_outcome_data(
  ICA_addresses[21],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#34_pheno867
outcome <- read_outcome_data(
  ICA_addresses[184],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[34]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

# Drnkwk_nodes_191 --------------------------------------------------------
#52_pheno1205
outcome <- read_outcome_data(
  ICA_addresses[33],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[17]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

# nodes_191 ---------------------------------------------------------------
#28/29_pheno590
outcome <- read_outcome_data(
  ICA_addresses[154],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[51]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Nodes[[52]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

#52_pheno1211
outcome <- read_outcome_data(
  ICA_addresses[34],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[17]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_DPW_tsmr <- c(ivwb_DPW_tsmr,ivwb)
pv_drnkwk_tsmr <- c(pv_drnkwk_tsmr,pv)
rm(outcome)

# nodes_191_cigday --------------------------------------------------------
#33_pheno1189/1175/1167/869
for (i in c(98,88,31,185)) {
  outcome <- read_outcome_data(
    ICA_addresses[i],
    sep = "\t",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF1",
    effect_allele_col = "A1",
    other_allele_col = "A2",
    pval_col = "P",
    units_col = "units",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR"
  )
  dat <- harmonise_data(
    exposure_dat = LD_Nodes[[4]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivwb <- res[3,7]
  ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
  pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
  rm(outcome)
}

#86_pheno461/1205/593/1175
for (i in c(141,33,21,88)) {
  outcome <- read_outcome_data(
    ICA_addresses[i],
    sep = "\t",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF1",
    effect_allele_col = "A1",
    other_allele_col = "A2",
    pval_col = "P",
    units_col = "units",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR"
  )
  dat <- harmonise_data(
    exposure_dat = LD_Nodes[[37]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivwb <- res[3,7]
  ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
  pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
  rm(outcome)
}

# cigday_nodes_191 --------------------------------------------------------
#38_pheno447/777/882/55/102
for(i in c(137,179,186,149,106)){
  outcome <- read_outcome_data(
    ICA_addresses[i],
    sep = "\t",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF1",
    effect_allele_col = "A1",
    other_allele_col = "A2",
    pval_col = "P",
    units_col = "units",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR"
  )
  dat <- harmonise_data(
    exposure_dat = LD_Nodes[[7]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivwb <- res[3,7]
  ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
  pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
  rm(outcome)
}

#38/15/16_pheno147
outcome <- read_outcome_data(
  ICA_addresses[114],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[7]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Nodes[[49]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Nodes[[50]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#194/193_pheno447
outcome <- read_outcome_data(
  ICA_addresses[137],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[62]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Nodes[[61]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#194/193_pheno102
outcome <- read_outcome_data(
  ICA_addresses[106],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[62]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Nodes[[61]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

# cigday_fibers_191 -------------------------------------------------------
#16_pheno447
outcome <- read_outcome_data(
  ICA_addresses[137],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[16]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#16_pheno102
outcome <- read_outcome_data(
  ICA_addresses[106],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[16]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#17/18_pheno882
outcome <- read_outcome_data(
  ICA_addresses[186],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[17]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[18]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#17/18_pheno147
outcome <- read_outcome_data(
  ICA_addresses[114],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[17]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[18]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#43/44_pheno87
outcome <- read_outcome_data(
  ICA_addresses[71],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Fibers[[43]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[44]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

# nodes_191 ---------------------------------------------------------------
#38_pheno461
outcome <- read_outcome_data(
  ICA_addresses[141],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[7]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

#87_pheno1205/593/1175 33/21/88
for (i in c(33,21,88)) {
  outcome <- read_outcome_data(
    ICA_addresses[i],
    sep = "\t",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF1",
    effect_allele_col = "A1",
    other_allele_col = "A2",
    pval_col = "P",
    units_col = "units",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR"
  )
  dat <- harmonise_data(
    exposure_dat = LD_Nodes[[38]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivwb <- res[3,7]
  ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
  pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
  rm(outcome)
  
}
#193/194/16_pheno461
outcome <- read_outcome_data(
  ICA_addresses[141],
  sep = "\t",
  snp_col = "SNP",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF1",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P",
  units_col = "units",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR"
)
dat <- harmonise_data(
  exposure_dat = LD_Nodes[[61]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Nodes[[62]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)

dat <- harmonise_data(
  exposure_dat = LD_Fibers[[16]], 
  outcome_dat = outcome
)
res <- mr(dat)
pv <- res[3,9]
ivwb <- res[3,7]
ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
rm(outcome)

# fibers_191 --------------------------------------------------------------
#43/44_pheno1167/1175/1221/869
for (i in c(31,88,35,185)) {
  outcome <- read_outcome_data(
    ICA_addresses[i],
    sep = "\t",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF1",
    effect_allele_col = "A1",
    other_allele_col = "A2",
    pval_col = "P",
    units_col = "units",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR"
  )
  dat <- harmonise_data(
    exposure_dat = LD_Fibers[[43]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivwb <- res[3,7]
  ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
  pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
  
  dat <- harmonise_data(
    exposure_dat = LD_Fibers[[44]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivwb <- res[3,7]
  ivwb_CPD_tsmr <- c(ivwb_CPD_tsmr,ivwb)
  pv_cigday_tsmr <- c(pv_cigday_tsmr,pv)
  rm(outcome)
}

iv_drnkwk_tsmr <- c()
iv_drnkwk_tsmr$pval <- pv_drnkwk_tsmr
iv_drnkwk_tsmr <- as.data.frame(iv_drnkwk_tsmr)
iv_drnkwk_tsmr$ivwb <- ivwb_DPW_tsmr
iv_drnkwk_tsmr$posi <- row.names(iv_drnkwk_tsmr)

iv_cigday_tsmr <- c()
iv_cigday_tsmr$pval <- pv_cigday_tsmr
iv_cigday_tsmr <- as.data.frame(iv_cigday_tsmr)
iv_cigday_tsmr$ivwb <- ivwb_CPD_tsmr
iv_cigday_tsmr$posi <- row.names(iv_cigday_tsmr)

rm(res,pv,dat,i,nodes_fibers_address,ICA_addresses,drnkwk_path,cigday_path,fiber_address)
