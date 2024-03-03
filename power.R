#calculate the power of the robust results
#perform MR
#change the code according to the specific pairs you are analyzing with
outcome <- read_outcome_data(
  CigDay_path,
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
dat <- harmonise_data(
  exposure_dat = LD_191ICA[[9]],
  outcome_dat = outcome
)
mr_heterogeneity(dat)
mr_pleiotropy_test(dat)
# if need MR PRESSO (Cochran_Q < 0.05 | Rucker_Q < 0.05 | Egger_Intersect < 0.05)
mrpresso <- mr_presso(BetaOutcome = "beta.outcome", BetaExposure = "beta.exposure", SdOutcome = "se.outcome", SdExposure = "se.outcome", 
                      OUTLIERtest = TRUE, DISTORTIONtest = TRUE, data = dat, NbDistribution = 1000,  SignifThreshold = 1)
dat$rssobs <- as.vector(mrpresso[["MR-PRESSO results"]][["Outlier Test"]][["RSSobs"]]) 
dat <- dat[order(-dat$rssobs), ]
#cycle until no significant heterogenity and pleiotropy
dat <- dat[-1,]
mr_heterogeneity(dat)
mr_pleiotropy_test(dat)
#if no exposure samplesize
dat$samplesize.exposure <- 33219
#R^2 of IVs
dat$r2.exposure <- dat$beta.exposure^2/(dat$beta.exposure^2+dat$se.exposure^2*dat$samplesize.exposure)
#F statistics
dat$f <- sum(dat$r2.exposure)*(dat$samplesize.exposure-nrow(dat)-1)/((1-sum(dat$r2.exposure))*nrow(dat))
min(dat$f)
#while min(dat$f) < 10
dat <- dat[order(dat$f),]
dat <- dat[-1,]
min(dat$f)
#perform MR and lm
res <- mr(dat)
model <- lm(dat$beta.outcome ~ dat$beta.exposure, data = dat)

i<-i+1
#sample size
P[i,1]<-min(dat$samplesize.exposure)
#casual estimate
P[i,2]<-res[3,7]
#lm estimate
P[i,3]<-model[["coefficients"]][2]
#R^2 of IVs
P[i,4]<-sum(dat$r2.exposure)
#σ2 of exposure
P[i,5]<-sum((dat$beta.exposure)^2 * dat$eaf.exposure * (1 - dat$eaf.exposure))
#σ2 of outcome
P[i,6]<-sum((dat$beta.outcome)^2 * dat$eaf.outcome * (1 - dat$eaf.outcome))

#calculate power of estimation on https://shiny.cnsgenomics.com/mRnd/ and https://sb452.shinyapps.io/power/.