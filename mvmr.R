###MVMR for ROBUST TWO STEP MR RESULTS###
#load required packages
library(TwoSampleMR)
library(MRPRESSO)
library(MVMR)
library(MendelianRandomization)
# load the required data --------------------------------------------------
#for nodes or for fibers
LD1 <- LD_191ICA[[185]]#load your MVMR_exposure1
LD2 <- LD_Fibers[[65]]#load your MVMR_exposure2
PHENOTYPE <- c("EXP_ICA_185","EXP_R_AIC","OUT_DPW")#name your exposures and outcome
outcome_path <- "/your address of outcome/"
#read outcome
DrnkWk_path <- "/YOURADDRESS/GSCAN_DrnkWk_2022_GWAS_SUMMARY_STATS_EUR_without_UKB.txt"
CigDay_path <- "/YOURADDRESS/GSCAN_CigDay_2022_GWAS_SUMMARY_STATS_EUR_without_UKB.txt"

#read outcome change the code according to the specific outcome you are analyzing with
outcome <- read_outcome_data(
  DrnkWk_path,
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
#exp1_out
dat1 <- harmonise_data(
  exposure_dat = LD1,
  outcome_dat = outcome)
#cochran Q and Rucker Q
mr_heterogeneity(dat1)
#pleiotropy
#Egger's regression intersect
mr_pleiotropy_test(dat1)
# if need MR PRESSO: if (Cochran_Q < 0.05 | Rucker_Q < 0.05 | Egger_Intersect < 0.05)-------------------------------------------------------
mrpresso <- mr_presso(BetaOutcome = "beta.outcome", BetaExposure = "beta.exposure", SdOutcome = "se.outcome", SdExposure = "se.outcome", 
                      OUTLIERtest = TRUE, DISTORTIONtest = TRUE, data = dat1, NbDistribution = 1000,  SignifThreshold = 1)
mrpresso[["MR-PRESSO results"]][["Outlier Test"]][["RSSobs"]]
dat1$rssobs <- as.vector(mrpresso[["MR-PRESSO results"]][["Outlier Test"]][["RSSobs"]]) 
dat1 <- dat1[order(-dat1$rssobs), ]
#cycle until Cochran_Q > 0.05 & Rucker_Q > 0.05 & Egger_Intersect > 0.05
dat1 <- dat1[-1,]
mr_heterogeneity(dat1)
mr_pleiotropy_test(dat1)
#SNP1
SNP_LD1 <- dat1$SNP

#exp2_out
dat2 <- harmonise_data(
  exposure_dat = LD2,
  outcome_dat = outcome)
#cochran Q and Rucker Q
mr_heterogeneity(dat2)
#pleiotropy
#Egger's regression intersect
mr_pleiotropy_test(dat2)
# if need MR PRESSO: if (Cochran_Q < 0.05 | Rucker_Q < 0.05 | Egger_Intersect < 0.05) -------------------------------------------------------
mrpresso <- mr_presso(BetaOutcome = "beta.outcome", BetaExposure = "beta.exposure", SdOutcome = "se.outcome", SdExposure = "se.outcome", 
                      OUTLIERtest = TRUE, DISTORTIONtest = TRUE, data = dat2, NbDistribution = 1000,  SignifThreshold = 1)
mrpresso[["MR-PRESSO results"]][["Outlier Test"]][["RSSobs"]]
dat2$rssobs <- as.vector(mrpresso[["MR-PRESSO results"]][["Outlier Test"]][["RSSobs"]]) 
dat2 <- dat2[order(-dat2$rssobs), ]
#cycle until Cochran_Q > 0.05 & Rucker_Q > 0.05 & Egger_Intersect > 0.05
dat2 <- dat2[-1,]
mr_heterogeneity(dat2)
mr_pleiotropy_test(dat2)
#SNP2
SNP_LD2 <- dat2$SNP

#format data
M1 <- match(SNP_LD1, LD1$SNP)
M2 <- match(SNP_LD2, LD2$SNP)
#LD_1 <- LD1[M1,c(1,2,3,4,5,8,9,11,12,10,13,14,7,15)] #exposure_ICA
LD_1 <- LD1[M1,c(1,3,2,4,5,7,8,11,12,9,13,14,6,15)]#exposure_CPD
#LD_1 <- LD1[M1,]
LD_2 <- LD2[M2,]
combined_LD <- rbind(LD_1,LD_2)
#delete NA rows
combined_LD <- combined_LD[complete.cases(combined_LD[,1]), ]
#format exposure_dat
id_exposure <- unique(combined_LD$id.exposure)
temp <- combined_LD
temp$id.exposure <- 1
temp <- temp[order(temp$pval.exposure, decreasing=FALSE), ]
temp <- subset(temp, !duplicated(SNP))
temp <- clump_data(temp, clump_p1=1e-6, clump_r2=0.01, clump_kb=100)
exposure_dat <- subset(combined_LD, SNP %in% temp$SNP)


# extract SNPs from both exposures ----------------------------------------

#read exposure1 as outcome1
outcome1 <- read_outcome_data(
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
outcome1$id.outcome <- LD1$id.exposure[1]
#read exposure2 as outcome2
freqall <- read.table("/YOURADDRESS of reference_EAF/variants.txt.gz", header = TRUE)
outcome2 <- read_outcome_data(
  fiber_addresses[65],
  sep = " ",
  snp_col = "rsid",
  beta_col = "beta",
  se_col = "se",
  effect_allele_col = "a1",
  other_allele_col = "a2",
  pos_col = "pos",
  chr_col = "chr"
)
match <- match(outcome2$SNP, freqall$rsid)
outcome2$eaf.outcome <- freqall$af[match]
outcome2 <- outcome2[complete.cases(outcome2$eaf.outcome), ]
outcome2$id.outcome <- LD2$id.exposure[1]
rm(freqall)

# format exposure dataset -------------------------------------------------

#d1 d2
o1 <- subset(outcome1, SNP %in% exposure_dat$SNP)
o2 <- subset(outcome2, SNP %in% exposure_dat$SNP)
rm(outcome1,outcome2)
o1 <- o1[,c(1,3,2,4,5,7,8,11,12,9,13,14,6,15)]#exposure_CPD
#o1 <- o1[,c(1,2,3,4,5,8,9,11,12,10,13,14,7,15)]#exposure_ICA
d1 <- rbind(o1,o2)
d1 <- subset(d1, mr_keep.outcome)
d2 <- subset(d1, id.outcome != id_exposure[1])
d1 <- convert_outcome_to_exposure(subset(d1, id.outcome == id_exposure[1]))
# Harmonise against the first id
d <- harmonise_data(d1, d2, action=2)
# Only keep SNPs that are present in all
tab <- table(d$SNP)
keepsnps <- names(tab)[tab == length(id_exposure)-1]
d <- subset(d, SNP %in% keepsnps)
# Reshape exposures
dh1 <- subset(d, id.outcome == id.outcome[1], select=c(SNP, exposure, id.exposure, effect_allele.exposure, other_allele.exposure, eaf.exposure, beta.exposure, se.exposure, pval.exposure))
dh2 <- subset(d, select=c(SNP, outcome, id.outcome, effect_allele.outcome, other_allele.outcome, eaf.outcome, beta.outcome, se.outcome, pval.outcome))
names(dh2) <- gsub("outcome", "exposure", names(dh2))
dh <- rbind(dh1, dh2)


# harmonize exp and outcome -----------------------------------------------

SNP <- levels(factor(dh$SNP))
M <- match(SNP, outcome$SNP)
outcome <- outcome[M,]
outcome$outcome <- "DPW"
mvdat <- mv_harmonise_data(dh, outcome)

rm(outcome)

F.data <- format_mvmr(BXGs = mvdat[["exposure_beta"]],
                      BYG = mvdat[["outcome_beta"]],
                      seBXGs = mvdat[["exposure_se"]],
                      seBYG = mvdat[["outcome_se"]],
                      RSID = 1:nrow(mvdat[["exposure_beta"]]))
#generate a covariance matrix
# Install and load the MASS package if not already installed
# install.packages("MASS")
library(MASS)
# Set the number of variables
num_variables <- 2
#Step 1: Generate a random correlation matrix
cor_matrix <- matrix(runif(num_variables^2), nrow = num_variables)
cor_matrix[lower.tri(cor_matrix)] <- cor_matrix[upper.tri(cor_matrix)]
diag(cor_matrix) <- 1  # Set diagonal elements to 1
# Step 2: Specify standard deviations for each variable
std_deviations <- runif(num_variables)
# Step 3: Construct the covariance matrix
cov_matrix <- cor_matrix * (std_deviations %*% t(std_deviations))


#calculate F statistics
rm(Xcovmat)
Xcovmat<-phenocov_mvmr(cov_matrix,F.data[,6:7])
#sres <- strength_mvmr(r_input = F.data, gencov = 0)
sres2 <- strength_mvmr(r_input = F.data, gencov = Xcovmat)
#Test for horizontal pleiotropy
#pres <- pleiotropy_mvmr(r_input = F.data, gencov = 0)
pres <- pleiotropy_mvmr(r_input = F.data, gencov = Xcovmat)
#Estimate causal effects
res <- ivw_mvmr(r_input = F.data)
#Robust causal effect estimation
res1 <- qhet_mvmr(F.data, cov_matrix, CI = F, iterations = 100)
#other supplemental analysis
MRMVInputObject <- mr_mvinput(bx = cbind(mvdat[["exposure_beta"]][,1],mvdat[["exposure_beta"]][,2]),
                              bxse = cbind(mvdat[["exposure_se"]][,1],mvdat[["exposure_se"]][,2]),
                              by = mvdat[["outcome_beta"]], 
                              byse = mvdat[["outcome_se"]])
Ivw <- mr_mvivw(MRMVInputObject,
                model = "default",
                correl = FALSE,
                distribution = "normal",
                alpha = 0.05)
Egger <- mr_mvegger(
  MRMVInputObject,
  orientate = 1,
  correl = FALSE,
  distribution = "normal",
  alpha = 0.05)
Median <-mr_mvmedian(
  MRMVInputObject,
  distribution = "normal",
  alpha = 0.05,
  iterations = 10000,
  seed = 314159265
)
MR_IVW <- c()
MR_EGGER <- c()
MR_MEDIAN <- c()
MR_IVW$exposure <- Ivw@Exposure
MR_IVW <- as.data.frame(MR_IVW)
MR_IVW$Estimate <- Ivw@Estimate
MR_IVW$std_error <- Ivw@StdError
MR_IVW$up_lim <- Ivw@CIUpper
MR_IVW$low_lim <- Ivw@CILower
MR_IVW$p_value <- Ivw@Pvalue

MR_EGGER$exposure <- Egger@Exposure
MR_EGGER <- as.data.frame(MR_EGGER)
MR_EGGER$Estimate <- Egger@Estimate
MR_EGGER$std_error <- Egger@StdError.Est
MR_EGGER$up_lim <- Egger@CIUpper.Est
MR_EGGER$low_lim <- Egger@CILower.Est
MR_EGGER$p_value <- Egger@Pvalue.Est
MR_EGGER[3,1] <- "inercept"
MR_EGGER[3,2] <- Egger@Intercept
MR_EGGER[3,3] <- Egger@StdError.Int
MR_EGGER[3,4] <- Egger@CIUpper.Int
MR_EGGER[3,5] <- Egger@CILower.Int
MR_EGGER[3,6] <- Egger@Pvalue.Int
MR_MEDIAN$exposure <- Median@Exposure
MR_MEDIAN <- as.data.frame(MR_MEDIAN)
MR_MEDIAN$Estimate <- Median@Estimate
MR_MEDIAN$std_error <- Median@StdError
MR_MEDIAN$up_lim <- Median@CIUpper
MR_MEDIAN$low_lim <- Median@CILower
MR_MEDIAN$p_value <- Median@Pvalue

#then save the file in the format you prefer

# two step MR -------------------------------------------------------------
#load the robust tsmr results which contain the ivw estimates and s.d. of step1 and step2
#then calculate the estimate of step3 and proporation of mediation with delta method
for (i in 1:7) {
  med_asym <- RMediation::medci(mu.x = tsmr$b0[i],mu.y = tsmr$b1[i],
                                se.x = tsmr$se0[i],se.y = tsmr$se1[i],type = "asymp")
  tsmr$b3[i] <- med_asym$Estimate[1]
  tsmr$se3[i] <- med_asym$SE[1]
  tsmr$p3[i] <-2*pnorm (abs (tsmr$b3[i]/tsmr$se3[i]),lower.tail=FALSE)
  
  tsmr$proportiones[i] <- tsmr$b3[i]/tsmr$b2[i]
  tsmr$proportionse[i] <- tsmr$b3[i]*sqrt((tsmr$se3[i]/tsmr$b3[i])^2+(tsmr$b2[i]/tsmr$se2[i])^2)
  tsmr$proportionpval[i] <-2*pnorm (abs (tsmr$proportiones[i]/tsmr$proportionse[i]),lower.tail=FALSE)
  
}
med_asym <- RMediation::medci(mu.x = tsmr$b0[i],mu.y = tsmr$b1[i],
                              se.x = tsmr$se0[i],se.y = tsmr$se1[i],type = "asymp")
tsmr$b3[i] <- med_asym$Estimate[1]
tsmr$se3[i] <- med_asym$SE[1]
tsmr$p3[i] <-2*pnorm (abs (tsmr$b3[i]/tsmr$se3[i]),lower.tail=FALSE)

tsmr$proportiones[i] <- tsmr$b3[i]/tsmr$b2[i]
tsmr$proportionse[i] <- tsmr$b3[i]*sqrt((tsmr$se3[i]/tsmr$b3[i])^2+(tsmr$b2[i]/tsmr$se2[i])^2)
tsmr$proportionpval[i] <-2*pnorm (abs (tsmr$proportiones[i]/tsmr$proportionse[i]),lower.tail=FALSE)