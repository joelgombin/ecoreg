library(ecoreg)
data(agg)
data(indiv)

### Some aggregate categorical data to go with "agg". Numbers of indivs in social classes 1-4. 

soclass <- round(990*cbind(
      seq(0, 0.8, length=100),
      seq(0.5, 0.1, length=100)
))
soclass <- cbind(soclass, 990-rowSums(soclass))
soclass[1:10,]

soclass <- cbind(1 - agg$p.smoke, agg$p.smoke) 

eco(cbind(disease, n) ~ 1, binary = ~ p.smoke, categorical=list(soclass), data=agg)
eco(cbind(disease, n) ~ 1, binary = ~ p.smoke, data=agg)
eco(cbind(disease, n) ~ 1, categorical=list(soclass), data=agg)
