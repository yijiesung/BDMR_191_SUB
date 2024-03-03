#clump DPW/CPD/191ICA/NODE/FIBERS
#SUB: DPW/CPD
library(TwoSampleMR)
LD_SUB <- list()
LD_191ICA <- list()
LD_Fibers <- list()
LD_Nodes <- list()
LD_EPHA3 <- list()
# read file address -------------------------------------------------------
SUB_path <- c(
  "/YOURADDRESS/GSCAN_DrnkWk_2022_GWAS_SUMMARY_STATS_EUR_without_UKB.txt",
  "/YOURADDRESS/GSCAN_CigDay_2022_GWAS_SUMMARY_STATS_EUR_without_UKB.txt"
)

ICA_addresses <- c(
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno1.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno10.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1126.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1134.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1137.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1142.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1359.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1382.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1697.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1698.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1699.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1701.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno20.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno26.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno34.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno36.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno405.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno42.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno5.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno57.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno593.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno601.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno609.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno65.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno70.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno76.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno810.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno918.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1122.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1161.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1167.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1171.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1205.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1211.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1221.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1225.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1250.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1256.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1257.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1269.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1270.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1276.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1296.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1300.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1302.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1309.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1317.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1322.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1325.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1328.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno135.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno14.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno17.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno21.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno262.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno28.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno288.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno30.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno32.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno33.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno43.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno491.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno597.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno599.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno66.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno67.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno68.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno69.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno812.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno816.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno87.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno9.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno956.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno31.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno40.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno49.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno54.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno64.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno286.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno716.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno815.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1301.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1041.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno574.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno460.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno824.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno932.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1175.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno303.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1293.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1311.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1183.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1141.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1184.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1273.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1319.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno249.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1189.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno621.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno253.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno13.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno7.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno132.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno101.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1013.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno102.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1020.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1022.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno103.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1059.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno11.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno12.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno146.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno147.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno15.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno151.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno16.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno1696.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno18.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno19.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno2.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno22.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno23.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno24.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno25.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno27.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno29.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno3.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno35.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno37.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno38.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno389.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno39.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno4.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno41.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno44.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno447.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno449.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno45.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno46.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno461.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno47.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno48.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno50.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno51.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno52.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno53.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno537.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno55.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno558.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno56.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno58.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno59.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno590.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno60.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno606.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno61.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno62.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno624.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno63.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno636.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno639.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno65.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno58.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno55.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno66.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno674.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno681.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno683.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno695.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno698.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno705.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno71.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno72.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno73.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno74.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno75.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno767.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno777.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno789.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno794.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_node_dec21_2019_pheno8.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno801.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno867.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno869.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno882.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno899.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno903.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno908.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno942.fastGWA",
  "/YOURADDRESS/ukb_phase1to3_fmri_edge_dec21_2019_pheno965.fastGWA"
)

Fiber_addresses <- c(
  "/YOURADDRESS/1452.txt.gz",
  "/YOURADDRESS/1453.txt.gz",
  "/YOURADDRESS/1454.txt.gz",
  "/YOURADDRESS/1455.txt.gz",
  "/YOURADDRESS/1456.txt.gz",
  "/YOURADDRESS/1457.txt.gz",
  "/YOURADDRESS/1458.txt.gz",
  "/YOURADDRESS/1459.txt.gz",
  "/YOURADDRESS/1460.txt.gz",
  "/YOURADDRESS/1461.txt.gz",
  "/YOURADDRESS/1462.txt.gz",
  "/YOURADDRESS/1463.txt.gz",
  "/YOURADDRESS/1464.txt.gz",
  "/YOURADDRESS/1465.txt.gz",
  "/YOURADDRESS/1466.txt.gz",
  "/YOURADDRESS/1467.txt.gz",
  "/YOURADDRESS/1468.txt.gz",
  "/YOURADDRESS/1469.txt.gz",
  "/YOURADDRESS/1470.txt.gz",
  "/YOURADDRESS/1471.txt.gz",
  "/YOURADDRESS/1472.txt.gz",
  "/YOURADDRESS/1473.txt.gz",
  "/YOURADDRESS/1474.txt.gz",
  "/YOURADDRESS/1475.txt.gz",
  "/YOURADDRESS/1476.txt.gz",
  "/YOURADDRESS/1477.txt.gz",
  "/YOURADDRESS/1478.txt.gz",
  "/YOURADDRESS/1479.txt.gz",
  "/YOURADDRESS/1480.txt.gz",
  "/YOURADDRESS/1481.txt.gz",
  "/YOURADDRESS/1482.txt.gz",
  "/YOURADDRESS/1483.txt.gz",
  "/YOURADDRESS/1484.txt.gz",
  "/YOURADDRESS/1485.txt.gz",
  "/YOURADDRESS/1486.txt.gz",
  "/YOURADDRESS/1487.txt.gz",
  "/YOURADDRESS/1488.txt.gz",
  "/YOURADDRESS/1489.txt.gz",
  "/YOURADDRESS/1490.txt.gz",
  "/YOURADDRESS/1491.txt.gz",
  "/YOURADDRESS/1492.txt.gz",
  "/YOURADDRESS/1493.txt.gz",
  "/YOURADDRESS/1494.txt.gz",
  "/YOURADDRESS/1495.txt.gz",
  "/YOURADDRESS/1496.txt.gz",
  "/YOURADDRESS/1497.txt.gz",
  "/YOURADDRESS/1498.txt.gz",
  "/YOURADDRESS/1499.txt.gz",
  "/YOURADDRESS/1602.txt.gz",
  "/YOURADDRESS/1603.txt.gz",
  "/YOURADDRESS/1604.txt.gz",
  "/YOURADDRESS/1605.txt.gz",
  "/YOURADDRESS/1606.txt.gz",
  "/YOURADDRESS/1607.txt.gz",
  "/YOURADDRESS/1608.txt.gz",
  "/YOURADDRESS/1609.txt.gz",
  "/YOURADDRESS/1610.txt.gz",
  "/YOURADDRESS/1611.txt.gz",
  "/YOURADDRESS/1612.txt.gz",
  "/YOURADDRESS/1613.txt.gz",
  "/YOURADDRESS/1614.txt.gz",
  "/YOURADDRESS/1615.txt.gz",
  "/YOURADDRESS/1616.txt.gz",
  "/YOURADDRESS/1617.txt.gz",
  "/YOURADDRESS/1618.txt.gz",
  "/YOURADDRESS/1619.txt.gz",
  "/YOURADDRESS/1620.txt.gz",
  "/YOURADDRESS/1621.txt.gz",
  "/YOURADDRESS/1622.txt.gz",
  "/YOURADDRESS/1623.txt.gz",
  "/YOURADDRESS/1624.txt.gz",
  "/YOURADDRESS/1625.txt.gz",
  "/YOURADDRESS/1626.txt.gz",
  "/YOURADDRESS/1627.txt.gz",
  "/YOURADDRESS/1628.txt.gz",
  "/YOURADDRESS/1629.txt.gz",
  "/YOURADDRESS/1630.txt.gz",
  "/YOURADDRESS/1631.txt.gz",
  "/YOURADDRESS/1632.txt.gz",
  "/YOURADDRESS/1633.txt.gz",
  "/YOURADDRESS/1634.txt.gz",
  "/YOURADDRESS/1635.txt.gz",
  "/YOURADDRESS/1636.txt.gz",
  "/YOURADDRESS/1637.txt.gz",
  "/YOURADDRESS/1638.txt.gz",
  "/YOURADDRESS/1639.txt.gz",
  "/YOURADDRESS/1640.txt.gz",
  "/YOURADDRESS/1641.txt.gz",
  "/YOURADDRESS/1642.txt.gz",
  "/YOURADDRESS/1643.txt.gz",
  "/YOURADDRESS/1644.txt.gz",
  "/YOURADDRESS/1645.txt.gz",
  "/YOURADDRESS/1646.txt.gz",
  "/YOURADDRESS/1647.txt.gz",
  "/YOURADDRESS/1648.txt.gz",
  "/YOURADDRESS/1649.txt.gz",
  "/YOURADDRESS/0007.txt.gz",
  "/YOURADDRESS/0008.txt.gz"
)

Node_addresses <- c(
  "/YOURADDRESS/0030.txt.gz",
  "/YOURADDRESS/0031.txt.gz",
  "/YOURADDRESS/0032.txt.gz",
  "/YOURADDRESS/0033.txt.gz",
  "/YOURADDRESS/0036.txt.gz",
  "/YOURADDRESS/0037.txt.gz",
  "/YOURADDRESS/0038.txt.gz",
  "/YOURADDRESS/0039.txt.gz",
  "/YOURADDRESS/0040.txt.gz",
  "/YOURADDRESS/0041.txt.gz",
  "/YOURADDRESS/0046.txt.gz",
  "/YOURADDRESS/0047.txt.gz",
  "/YOURADDRESS/0048.txt.gz",
  "/YOURADDRESS/0049.txt.gz",
  "/YOURADDRESS/0050.txt.gz",
  "/YOURADDRESS/0051.txt.gz",
  "/YOURADDRESS/0052.txt.gz",
  "/YOURADDRESS/0053.txt.gz",
  "/YOURADDRESS/0054.txt.gz",
  "/YOURADDRESS/0055.txt.gz",
  "/YOURADDRESS/0056.txt.gz",
  "/YOURADDRESS/0057.txt.gz",
  "/YOURADDRESS/0060.txt.gz",
  "/YOURADDRESS/0061.txt.gz",
  "/YOURADDRESS/0062.txt.gz",
  "/YOURADDRESS/0063.txt.gz",
  "/YOURADDRESS/0064.txt.gz",
  "/YOURADDRESS/0065.txt.gz",
  "/YOURADDRESS/0066.txt.gz",
  "/YOURADDRESS/0067.txt.gz",
  "/YOURADDRESS/0072.txt.gz",
  "/YOURADDRESS/0073.txt.gz",
  "/YOURADDRESS/0082.txt.gz",
  "/YOURADDRESS/0083.txt.gz",
  "/YOURADDRESS/0084.txt.gz",
  "/YOURADDRESS/0085.txt.gz",
  "/YOURADDRESS/0086.txt.gz",
  "/YOURADDRESS/0087.txt.gz",
  "/YOURADDRESS/0350.txt.gz",
  "/YOURADDRESS/0383.txt.gz",
  "/YOURADDRESS/0518.txt.gz",
  "/YOURADDRESS/0592.txt.gz",
  "/YOURADDRESS/0096.txt.gz",
  "/YOURADDRESS/0097.txt.gz",
  "/YOURADDRESS/0442.txt.gz",
  "/YOURADDRESS/0473.txt.gz",
  "/YOURADDRESS/0013.txt.gz",
  "/YOURADDRESS/0014.txt.gz",
  "/YOURADDRESS/0015.txt.gz",
  "/YOURADDRESS/0016.txt.gz",
  "/YOURADDRESS/0028.txt.gz",
  "/YOURADDRESS/0029.txt.gz",
  "/YOURADDRESS/0058.txt.gz",
  "/YOURADDRESS/0059.txt.gz",
  "/YOURADDRESS/0076.txt.gz",
  "/YOURADDRESS/0077.txt.gz",
  "/YOURADDRESS/0088.txt.gz",
  "/YOURADDRESS/0089.txt.gz",
  "/YOURADDRESS/0108.txt.gz",
  "/YOURADDRESS/0109.txt.gz",
  "/YOURADDRESS/0193.txt.gz",
  "/YOURADDRESS/0194.txt.gz",
  "/YOURADDRESS/0210.txt.gz",
  "/YOURADDRESS/0211.txt.gz",
  "/YOURADDRESS/0873.txt.gz",
  "/YOURADDRESS/0947.txt.gz",
  "/YOURADDRESS/0005.txt.gz",
  "/YOURADDRESS/0006.txt.gz"
)

# clump for SUB -----------------------------------------------------------

for (i in 1:2) {
  exposure <- read_exposure_data(
    SUB_path,
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
  exposure <- subset(exposure, pval.exposure < 1e-6)
  LD_SUB[[i]] <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
  rm(exposure)
  
}

# clump for CPD -----------------------------------------------------------

exposure <- read_exposure_data(
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
exposure <- subset(exposure, pval.exposure < 1e-6)
LD_CPD <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
rm(exposure)

# clump for 191_ICA -------------------------------------------------------

for (i in 1:191) {
  exposure <- read_exposure_data(
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
  exposure <- subset(exposure, pval.exposure < 1e-6)
  LD_191ICA[[i]] <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
  rm(exposure)
}

# clump for fibers ---------------------------------------------------------

freqall <- read.table("/YOURADDRESS/variants.txt", header = TRUE)#https://open.win.ox.ac.uk/ukbiobank/big40/release2/variants.txt.gz
for (i in 1:98) {
  exposure <- read_exposure_data(
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
  match <- match(exposure$SNP, freqall$rsid)
  exposure$eaf.exposure <- freqall$af[match]
  exposure <- exposure[complete.cases(exposure$eaf.exposure), ]
  #select effective SNPs
  exposure <- subset(exposure, pval.exposure < 1e-6)
  #correct for LD
  LD_Fibers[[i]] <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
  rm(exposure)
}
rm(freqall)
# clump for nodes ---------------------------------------------------------

for (i in 1:68) {
  exposure <- read_exposure_data(
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
  match <- match(exposure$SNP, freqall$rsid)
  exposure$eaf.exposure <- freqall$af[match]
  exposure <- exposure[complete.cases(exposure$eaf.exposure), ]
  #select effective SNPs
  exposure <- subset(exposure, pval.exposure < 1e-6)
  #correct for LD
  LD_Nodes[[i]] <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
  rm(exposure)
}

# re_clump for less than 10 IVs at 5e-6 level-------------------------------------------

for (i in c("Plz Fill in the Number of Phenotypes That Less than 10 IVs")) {
  exposure <- read_exposure_data(
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
  match <- match(exposure$SNP, freqall$rsid)
  exposure$eaf.exposure <- freqall$af[match]
  exposure <- exposure[complete.cases(exposure$eaf.exposure), ]
  #select effective SNPs
  exposure <- subset(exposure, pval.exposure < 5e-6)
  #correct for LD
  LD_Fibers[[i]] <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
  rm(exposure)
}

for (i in c("Plz Fill in the Number of Phenotypes That Less than 10 IVs")) {
  exposure <- read_exposure_data(
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
  match <- match(exposure$SNP, freqall$rsid)
  exposure$eaf.exposure <- freqall$af[match]
  exposure <- exposure[complete.cases(exposure$eaf.exposure), ]
  #select effective SNPs
  exposure <- subset(exposure, pval.exposure < 5e-6)
  #correct for LD
  LD_Nodes[[i]] <- clump_data(exposure, clump_r2=0.01, pop = "EUR", clump_kb=100)
  rm(exposure)
}

# clump for EPHA3 ---------------------------------------------------------

chr3 <- read.table("/YOURADDRESS/cS2G_1000GEUR/cS2G.3.SGscore.gz", header = T)
EPHA3 <- subset(chr3, chr3$GENE == "EPHA3")
j <- 1
for (i in c(21,22,33,37,63,73,154,178,185,190)) {
  exposure <- read_exposure_data(
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
  m <- match(EPHA3$SNP,exposure$SNP)
  m <- m[complete.cases(m)]
  LD_EPHA3[[j]] <- exposure[m,]
  LD_EPHA3[[j]] <- subset(LD_EPHA3[[j]], pval.exposure < 1e-6)
  LD_EPHA3[[j]] <- clump_data(LD_EPHA3[[j]], clump_kb = 100, clump_r2 = 0.01)
  j <- j+1
}

# LD_nodes_DPW ------------------------------------------------------------
node_DPW <- c(1,2,3,4,5,6,7,8,11,12,13,14,15,16,17,18,19,20,21,22,25,26,27,28,29,30,
              33,34,35,36,37,38,39,40,53,54,55,56,51,52,9,10,23,24,31,32,59,60,41,42,67,68)
for (i in   node_DPW) {
  LD_node_DPW <- LD_Nodes[[i]]
}

# LD_nodes_CPD ------------------------------------------------------------
node_CPD <- c(1,2,3,4,5,6,7,8,11,12,13,14,15,16,17,18,19,20,21,22,25,26,27,28,29,30,
              33,34,35,36,37,38,39,40,53,54,55,56,57,58,61,62,63,64,67,68)
for (i in   node_CPD) {
  LD_node_CPD <- LD_Nodes[[i]]
}