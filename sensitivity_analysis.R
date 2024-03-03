#sensitivity analysis

#for each exposure_outcome pairs
#cochran Q and Rucker Q
het <- mr_heterogeneity(dat)
Cochran_Q <- het[2,6]
Rucker_Q <- het[1,6]
#pleiotropy Egger's regression intersect
ple <- mr_pleiotropy_test(dat)
Egger_Intersect <- ple[1,5]
#if need MRPRESSO
if (Cochran_Q < 0.05 | Rucker_Q < 0.05 | Egger_Intersect < 0.05) {
  mrpresso <- mr_presso(BetaOutcome = "beta.outcome", BetaExposure = "beta.exposure", SdOutcome = "se.outcome", SdExposure = "se.outcome", 
                        OUTLIERtest = TRUE, DISTORTIONtest = TRUE, data = dat, NbDistribution = 1000,  SignifThreshold = 1)
  dat$rssobs <- as.vector(mrpresso[["MR-PRESSO results"]][["Outlier Test"]][["RSSobs"]]) 
  dat <- dat[order(-dat$rssobs), ]
  while (Cochran_Q < 0.05 | Rucker_Q < 0.05 | Egger_Intersect < 0.05) {
    dat <- dat[-1,]
    het <- mr_heterogeneity(dat)
    Cochran_Q <- het[2,6]
    Rucker_Q <- het[1,6]
    ple <- mr_pleiotropy_test(dat)
    Egger_Intersect <- ple[1,5]
  }
} 

#direction test
if (dat$samplesize.exposure != 0 ) {
  out <- directionality_test(dat)
  if (out$steiger_pval[1] < 0.05) {
    dat$r2.exposure <- dat$beta.exposure^2/(dat$beta.exposure^2+dat$se.exposure^2*dat$samplesize.exposure)
    dat$f <- sum(dat$r2.exposure)*(dat$samplesize.exposure-nrow(dat)-1)/((1-sum(dat$r2.exposure))*nrow(dat))
    while (min(dat$f) < 10) {
      dat <- dat[order(dat$f),]
      dat <- dat[-1,]
    }
  }
}else{
  dat$samplesize.exposure <- 31357#change it with specific exposure samplesize
}

res <- res(dat)
#check if IVW/EGGER/WEIGHTED MODE/WEIGHTED MEDIAN/SIMPLE MODE are the same direction
all_positive <- res[1,7] > 0 & res[2,7] > 0 $ res[3,7] > 0 & res[4,7] > 0 & res[5,7] > 0
all_negative <- res[1,7] < 0 & res[2,7] < 0 $ res[3,7] < 0 & res[4,7] < 0 & res[5,7] < 0
same_sign <- all_positive | all_negative
if (same_sign) {
  print("All values have the same sign.")
  #save the MR outcome and 
  
  iv_exp_out_fdr$nsnp[a] <- res[3,6]
  iv_exp_out_fdr$ivwb[a] <- res[3,7]
  iv_exp_out_fdr$ivwse[a] <- res[3,8]
  iv_exp_out_fdr$ivwpval[a] <- res[3,9]
  iv_exp_out_fdr$eggerb[a] <- res[1,7]
  iv_exp_out_fdr$eggerse[a] <- res[1,8]
  iv_exp_out_fdr$eggerpval[a] <- res[1,9]
  iv_exp_out_fdr$medianb[a] <- res[2,7]
  iv_exp_out_fdr$medianse[a] <- res[2,8]
  iv_exp_out_fdr$medianpval[a] <- res[2,9]
  iv_exp_out_fdr$simpleb[a] <- res[4,7]
  iv_exp_out_fdr$simplese[a] <- res[4,8]
  iv_exp_out_fdr$simplepval[a] <- res[4,9]
  iv_exp_out_fdr$weightedb[a] <- res[5,7]
  iv_exp_out_fdr$weightedse[a] <- res[5,8]
  iv_exp_out_fdr$weightedpval[a] <- res[5,9]
  iv_exp_out_fdr$causal_dir[a] <- out$correct_causal_direction[1]
  iv_exp_out_fdr$steiger_p[a] <- out$steiger_pval[1]
  iv_exp_out_fdr$f[a] <- min(dat$f)
  iv_exp_out_fdr$CQDF[i] <- het[2,7]
  iv_exp_out_fdr$CQP[i] <- het[2,8]
  iv_exp_out_fdr$RQ[i] <- het[1,6]
  iv_exp_out_fdr$RQDF[i] <- het[1,7]
  iv_exp_out_fdr$RQP[i] <- het[1,8]
  iv_exp_out_fdr$EI[i] <- ple[1,5]
  iv_exp_out_fdr$EISE[i] <- ple[1,6]
  iv_exp_out_fdr$EIP[i] <- ple[1,7]
} else {
  print("Values do not all have the same sign.")
}

#leave one out analysis
res_loo <- mr_leaveoneout(dat)
mr_leaveoneout_plot(res_loo)