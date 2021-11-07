# K2
## Background
K2 is an approximation of Kolmogorov-Sinai (KS) Entropy developed by (Peter Grassberger and Itamar Procaccia in 1983)[https://journals.aps.org/pra/pdf/10.1103/PhysRevA.28.2591]. The significant contribution of this paper is that it provides a realitivly acurate approximation of KS entropy from a set of time series data. 

## Notes
`Cd.m` calculates the corrleation integral for a measure `d` and a box of size `epsilon`. `K2.m` then calculates the correlation integral for a range of measures and box sizes which by examining the limit of their convergence the value of K2 may be derived. Further, from examing the slope of ln(Cd(epsilon)) vs ln(epsilon) the strange attractor characteristic, `v` may be derived.
