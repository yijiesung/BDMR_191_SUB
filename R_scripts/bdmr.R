#MR analysis
library(TwoSampleMR)
library(MRPRESSO)
library(readxl)
pv_191ICA_SUB <- c()
ivwb_191_SUB <- c()
pv_SUB_191 <- c()
ivwb_SUB_191 <- c()
pv_node_DPW <- c()
ivwb_node_DPW <- c()
pv_node_CPD <- c()
ivwb_node_CPD <- c()
pv_DPW_node <- c()
ivwb_DPW_node <- c()
pv_CPD_node <- c()
ivwb_CPD_node <- c()
pv_fiber_DPW <- c()
ivwb_fiber_DPW <- c()
pv_fiber_CPD <- c()
ivwb_fiber_CPD <- c()
pv_DPW_fiber <- c()
ivwb_DPW_fiber <- c()
pv_CPD_fiber <- c()
ivwb_CPD_fiber <- c()

# 191_SUB -------------------------------------------------------------

for (i in 1:2) {
  outcome <- read_outcome_data(
    SUB_path[i],
    sep = "\t",
    snp_col = "RSID",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF_1000G",
    effect_allele_col = "EFFECT_ALLELE",
    other_allele_col = "OTHER_ALLELE",
    pval_col = "P",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR",
  )
  for (j in 1:191) {
    dat <- harmonise_data(
      exposure_dat = LD_191ICA[[j]], 
      outcome_dat = outcome
    )
    res <- mr(dat)
    pv <- res[3,9]
    ivw_b <- res[3,7]
    pv_191ICA_SUB <- c(pv_191ICA_SUB,pv)
    ivwb_191_SUB <- c(ivwb_191_SUB,ivw_b)
  }
  rm(outcome)
}
phenoID <- read.table("/phenoidaddress/phenoid.xlsx",header = T)
iv_191ICA_SUB <- c()
iv_191ICA_SUB$pval <- pv_191ICA_SUB
iv_191ICA_SUB <- as.data.frame(iv_191ICA_SUB)
iv_191ICA_SUB$ivwb <- ivwb_191_SUB
iv_191ICA_SUB$posi <- row.names(iv_191ICA_SUB)
iv_191ICA_DPW <- iv_191ICA_SUB[1:190,]
iv_191ICA_CPD <- iv_191ICA_SUB[191:380,]

iv_191ICA_DPW$NAME <- phenoID$NAME
iv_191ICA_DPW$phenoid <- phenoID$phenoid
iv_191ICA_DPW$Location <- phenoID$Location
iv_191ICA_DPW$Network <- phenoID$Network

iv_191ICA_CPD$NAME <- phenoID$NAME
iv_191ICA_CPD$phenoid <- phenoID$phenoid
iv_191ICA_CPD$Location <- phenoID$Location
iv_191ICA_CPD$Network <- phenoID$Network

iv_191ICA_DPW <- iv_191ICA_DPW[complete.cases(iv_191ICA_DPW$pval), ]
iv_191ICA_DPW$fdr1 <- p.adjust(iv_191ICA_DPW$pval,method = "BH",n=length(iv_191ICA_DPW$pval))

iv_191ICA_CPD <- iv_191ICA_CPD[complete.cases(iv_191ICA_CPD$pval), ]
iv_191ICA_CPD$fdr1 <- p.adjust(iv_191ICA_CPD$pval,method = "BH",n=length(iv_191ICA_CPD$pval))


# SUB_191 -----------------------------------------------------------------

for (i in 1:2) {
  for (j in 1:191) {
    outcome <- read_outcome_data(
      ICA_addresses[j],#see clump.R
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
      exposure_dat = LD_SUB[[i]], 
      outcome_dat = outcome
    )
    res <- mr(dat)
    pv <- res[3,9]
    ivw_b <- res[3,7]
    pv_SUB_191 <- c(pv_SUB_191,pv)
    ivwb_SUB_191 <- c(ivwb_SUB_191,ivw_b)
    rm(outcome)
  }
}
iv_SUB_191 <- c()
iv_SUB_191$pval <- pv_SUB_191
iv_SUB_191 <- as.data.frame(iv_SUB_191)
iv_SUB_191$ivwb <- ivwb_SUB_191
iv_SUB_191$posi <- row.names(iv_SUB_191)
iv_fiber_DPW <- iv_SUB_191[1:190,]
iv_CPD_191 <- iv_SUB_191[191:380,]

iv_DPW_191$NAME <- phenoID$NAME
iv_DPW_191$phenoid <- phenoID$phenoid
iv_DPW_191$Location <- phenoID$Location
iv_DPW_191$Network <- phenoID$Network

iv_CPD_191$NAME <- phenoID$NAME
iv_CPD_191$phenoid <- phenoID$phenoid
iv_CPD_191$Location <- phenoID$Location
iv_CPD_191$Network <- phenoID$Network

iv_DPW_191 <- iv_DPW_191[complete.cases(iv_DPW_191$pval), ]
iv_DPW_191$fdr1 <- p.adjust(iv_DPW_191$pval,method = "BH",n=length(iv_DPW_191$pval))

iv_CPD_191 <- iv_CPD_191[complete.cases(iv_CPD_191$pval), ]
iv_CPD_191$fdr1 <- p.adjust(iv_CPD_191$pval,method = "BH",n=length(iv_CPD_191$pval))

# node_SUB ----------------------------------------------------------------


outcome <- read_outcome_data(
    SUB_path[1],
    sep = "\t",
    snp_col = "RSID",
    beta_col = "BETA",
    se_col = "SE",
    eaf_col = "AF_1000G",
    effect_allele_col = "EFFECT_ALLELE",
    other_allele_col = "OTHER_ALLELE",
    pval_col = "P",
    samplesize_col = "N",
    pos_col = "POS",
    chr_col = "CHR",
)
for (i in 1:50) {
    dat <- harmonise_data(
      exposure_dat = LD_node_DPW[[i]], 
      outcome_dat = outcome
    )
    res <- mr(dat)
    pv <- res[3,9]
    ivw_b <- res[3,7]
    pv_node_DPW <- c(pv_node_DPW,pv)
    ivwb_node_DPW <- c(ivwb_node_DPW,ivw_b)
}
rm(outcome)

outcome <- read_outcome_data(
  SUB_path[2],
  sep = "\t",
  snp_col = "RSID",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF_1000G",
  effect_allele_col = "EFFECT_ALLELE",
  other_allele_col = "OTHER_ALLELE",
  pval_col = "P",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR",
)
for (i in 1:44) {
  dat <- harmonise_data(
    exposure_dat = LD_node_CPD[[i]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_node_CPD <- c(pv_node_CPD,pv)
  ivwb_node_CPD <- c(ivwb_node_CPD,ivw_b)
}
rm(outcome)

node_id <- read_excel("/address of supplementary_table_2_1")
iv_node_DPW <- c()
iv_node_DPW$pval <- pv_node_DPW
iv_node_DPW <- as.data.frame(iv_node_DPW)
iv_node_DPW$ivwb <- ivwb_node_DPW
iv_node_DPW$posi <- row.names(iv_node_DPW)
iv_node_DPW$UKB_ID <- node_id[node_DPW,1]
iv_node_DPW$IDP_NAME <- node_id[node_DPW,2]
iv_node_DPW$IDP_DESCRIPTION <- node_id[node_DPW,3]
iv_node_DPW <- iv_node_DPW[complete.cases(iv_node_DPW$pval), ]
iv_node_DPW$fdr1 <- p.adjust(iv_node_DPW$pval,method = "BH",n=length(iv_node_DPW$pval))

iv_node_CPD <- c()
iv_node_CPD$pval <- pv_node_CPD
iv_node_CPD <- as.data.frame(iv_node_CPD)
iv_node_CPD$ivwb <- ivwb_node_CPD
iv_node_CPD$posi <- row.names(iv_node_CPD)
iv_node_CPD$UKB_ID <- node_id[node_CPD,1]
iv_node_CPD$IDP_NAME <- node_id[node_CPD,2]
iv_node_CPD$IDP_DESCRIPTION <- node_id[node_CPD,3]
iv_node_CPD <- iv_node_CPD[complete.cases(iv_node_CPD$pval), ]
iv_node_CPD$fdr1 <- p.adjust(iv_node_CPD$pval,method = "BH",n=length(iv_node_CPD$pval))

# SUB_node ----------------------------------------------------------------

DPW_node <- c(1:38,49:60,67,68)
CPD_node <- c(1:48,67,68)
freqall <- read.table("/YOURADDRESS/variants.txt", header = TRUE)#https://open.win.ox.ac.uk/ukbiobank/big40/release2/variants.txt.gz

for (i in DPW_node) {
  outcome <- read_outcome_data(
    Node_addresses[i],
    sep = " ",
    snp_col = "rsid",
    beta_col = "beta",
    se_col = "se",
    effect_allele_col = "a1",
    other_allele_col = "a2",
    pos_col = "pos",
    chr_col = "chr"
  )
  match <- match(outcome$SNP, freqall$rsid)
  outcome$eaf.outcome <- freqall$af[match]
  outcome <- outcome[complete.cases(outcome$eaf.outcome), ]
  dat <- harmonise_data(
    exposure_dat = LD_SUB[[1]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_DPW_node <- c(pv_DPW_node,pv)
  ivwb_DPW_node <- c(ivwb_DPW_node,ivw_b)
}

for (i in CPD_node) {
  outcome <- read_outcome_data(
    Node_addresses[i],
    sep = " ",
    snp_col = "rsid",
    beta_col = "beta",
    se_col = "se",
    effect_allele_col = "a1",
    other_allele_col = "a2",
    pos_col = "pos",
    chr_col = "chr"
  )
  match <- match(outcome$SNP, freqall$rsid)
  outcome$eaf.outcome <- freqall$af[match]
  outcome <- outcome[complete.cases(outcome$eaf.outcome), ]
  dat <- harmonise_data(
    exposure_dat = LD_SUB[[2]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_CPD_node <- c(pv_CPD_node,pv)
  ivwb_CPD_node <- c(ivwb_CPD_node,ivw_b)
}

iv_DPW_node <- c()
iv_DPW_node$pval <- pv_DPW_node
iv_DPW_node <- as.data.frame(iv_DPW_node)
iv_DPW_node$ivwb <- ivwb_DPW_node
iv_DPW_node$posi <- row.names(iv_DPW_node)
iv_DPW_node$UKB_ID <- node_id[DPW_node,1]
iv_DPW_node$IDP_NAME <- node_id[DPW_node,2]
iv_DPW_node$IDP_DESCRIPTION <- node_id[DPW_node,3]
iv_DPW_node <- iv_DPW_node[complete.cases(iv_DPW_node$pval), ]
iv_DPW_node$fdr1 <- p.adjust(iv_DPW_node$pval,method = "BH",n=length(iv_DPW_node$pval))

iv_CPD_node <- c()
iv_CPD_node$pval <- pv_CPD_node
iv_CPD_node <- as.data.frame(iv_CPD_node)
iv_CPD_node$ivwb <- ivwb_CPD_node
iv_CPD_node$posi <- row.names(iv_CPD_node)
iv_CPD_node$UKB_ID <- node_id[CPD_node,1]
iv_CPD_node$IDP_NAME <- node_id[CPD_node,2]
iv_CPD_node$IDP_DESCRIPTION <- node_id[CPD_node,3]
iv_CPD_node <- iv_CPD_node[complete.cases(iv_CPD_node$pval), ]
iv_CPD_node$fdr1 <- p.adjust(iv_CPD_node$pval,method = "BH",n=length(iv_CPD_node$pval))

rm(freqall)

# fiber_SUB ---------------------------------------------------------------

outcome <- read_outcome_data(
  SUB_path[1],
  sep = "\t",
  snp_col = "RSID",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF_1000G",
  effect_allele_col = "EFFECT_ALLELE",
  other_allele_col = "OTHER_ALLELE",
  pval_col = "P",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR",
)
for (i in 1:98) {
  dat <- harmonise_data(
    exposure_dat = LD_Fibers[[i]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_fiber_DPW <- c(pv_fiber_DPW,pv)
  ivwb_fiber_DPW <- c(ivwb_fiber_DPW,ivw_b)
}
rm(outcome)

outcome <- read_outcome_data(
  SUB_path[2],
  sep = "\t",
  snp_col = "RSID",
  beta_col = "BETA",
  se_col = "SE",
  eaf_col = "AF_1000G",
  effect_allele_col = "EFFECT_ALLELE",
  other_allele_col = "OTHER_ALLELE",
  pval_col = "P",
  samplesize_col = "N",
  pos_col = "POS",
  chr_col = "CHR",
)
for (i in 1:98) {
  dat <- harmonise_data(
    exposure_dat = LD_Fibers[[i]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_fiber_CPD <- c(pv_fiber_CPD,pv)
  ivwb_fiber_CPD <- c(ivwb_fiber_CPD,ivw_b)
}
rm(outcome)

fiber_id <- read_excel("/address of supplementary_table_3_1")
iv_fiber_DPW <- c()
iv_fiber_DPW$pval <- pv_fiber_DPW
iv_fiber_DPW <- as.data.frame(iv_fiber_DPW)
iv_fiber_DPW$ivwb <- ivwb_fiber_DPW
iv_fiber_DPW$posi <- row.names(iv_fiber_DPW)
iv_fiber_DPW$UKB_ID <- fiber_id[,1]
iv_fiber_DPW$IDP_NAME <- fiber_id[,2]
iv_fiber_DPW$IDP_DESCRIPTION <- fiber_id[,3]
iv_fiber_DPW <- iv_fiber_DPW[complete.cases(iv_fiber_DPW$pval), ]
iv_fiber_DPW$fdr1 <- p.adjust(iv_fiber_DPW$pval,method = "BH",n=length(iv_fiber_DPW$pval))

iv_fiber_CPD <- c()
iv_fiber_CPD$pval <- pv_fiber_CPD
iv_fiber_CPD <- as.data.frame(iv_fiber_CPD)
iv_fiber_CPD$ivwb <- ivwb_fiber_CPD
iv_fiber_CPD$posi <- row.names(iv_fiber_CPD)
iv_fiber_CPD$UKB_ID <- fiber_id[,1]
iv_fiber_CPD$IDP_NAME <- fiber_id[,2]
iv_fiber_CPD$IDP_DESCRIPTION <- fiber_id[,3]
iv_fiber_CPD <- iv_fiber_CPD[complete.cases(iv_fiber_CPD$pval), ]
iv_fiber_CPD$fdr1 <- p.adjust(iv_fiber_CPD$pval,method = "BH",n=length(iv_fiber_CPD$pval))

# SUB_fiber ---------------------------------------------------------------
freqall <- read.table("/YOURADDRESS/variants.txt", header = TRUE)#https://open.win.ox.ac.uk/ukbiobank/big40/release2/variants.txt.gz
for (i in 1:98) {
  outcome <- read_outcome_data(
    Fiber_addresses[i],
    sep = " ",
    snp_col = "rsid",
    beta_col = "beta",
    se_col = "se",
    effect_allele_col = "a1",
    other_allele_col = "a2",
    pos_col = "pos",
    chr_col = "chr"
  )
  match <- match(outcome$SNP, freqall$rsid)
  outcome$eaf.outcome <- freqall$af[match]
  outcome <- outcome[complete.cases(outcome$eaf.outcome), ]
  dat <- harmonise_data(
    exposure_dat = LD_SUB[[1]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_DPW_fiber <- c(pv_DPW_fiber,pv)
  ivwb_DPW_fiber <- c(ivwb_DPW_fiber,ivw_b)
  rm(outcome)
}

for (i in 1:98) {
  outcome <- read_outcome_data(
    Fiber_addresses[i],
    sep = " ",
    snp_col = "rsid",
    beta_col = "beta",
    se_col = "se",
    effect_allele_col = "a1",
    other_allele_col = "a2",
    pos_col = "pos",
    chr_col = "chr"
  )
  match <- match(outcome$SNP, freqall$rsid)
  outcome$eaf.outcome <- freqall$af[match]
  outcome <- outcome[complete.cases(outcome$eaf.outcome), ]
  dat <- harmonise_data(
    exposure_dat = LD_SUB[[2]], 
    outcome_dat = outcome
  )
  res <- mr(dat)
  pv <- res[3,9]
  ivw_b <- res[3,7]
  pv_CPD_fiber <- c(pv_CPD_fiber,pv)
  ivwb_CPD_fiber <- c(ivwb_CPD_fiber,ivw_b)
  rm(outcome)
}

iv_DPW_fiber <- c()
iv_DPW_fiber$pval <- pv_DPW_fiber
iv_DPW_fiber <- as.data.frame(iv_DPW_fiber)
iv_DPW_fiber$ivwb <- ivwb_DPW_fiber
iv_DPW_fiber$posi <- row.names(iv_DPW_fiber)
iv_DPW_fiber$UKB_ID <- fiber_id[,1]
iv_DPW_fiber$IDP_NAME <- fiber_id[,2]
iv_DPW_fiber$IDP_DESCRIPTION <- fiber_id[,3]
iv_DPW_fiber <- iv_DPW_fiber[complete.cases(iv_DPW_fiber$pval), ]
iv_DPW_fiber$fdr1 <- p.adjust(iv_DPW_fiber$pval,method = "BH",n=length(iv_DPW_fiber$pval))

iv_CPD_fiber <- c()
iv_CPD_fiber$pval <- pv_CPD_fiber
iv_CPD_fiber <- as.data.frame(iv_CPD_fiber)
iv_CPD_fiber$ivwb <- ivwb_CPD_fiber
iv_CPD_fiber$posi <- row.names(iv_CPD_fiber)
iv_CPD_fiber$UKB_ID <- fiber_id[,1]
iv_CPD_fiber$IDP_NAME <- fiber_id[,2]
iv_CPD_fiber$IDP_DESCRIPTION <- fiber_id[,3]
iv_CPD_fiber <- iv_CPD_fiber[complete.cases(iv_CPD_fiber$pval), ]
iv_CPD_fiber$fdr1 <- p.adjust(iv_CPD_fiber$pval,method = "BH",n=length(iv_CPD_fiber$pval))
