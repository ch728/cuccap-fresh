library(CMplot)

# Read in files
pepo <- read.csv("data/03_geno/data/maps/cpepo_filt.map", header=F)
mos <- read.csv("data/03_geno/data/maps/cmoschata_filt.map", header=F)
max <- read.csv("data/03_geno/data/maps/cmaxima_filt.map", header=F)

pepo_stub <- read.csv("data/01_meta/data/cpepo_stubs.csv", header=F)
mos_stub <- read.csv("data/01_meta/data/cmoschata_stubs.csv", header=F)
max_stub <- read.csv("data/01_meta/data/cmaxima_stubs.csv", header=F)

pepo <- rbind(pepo, pepo_stub)
mos <- rbind(mos, mos_stub)
max <- rbind(max, max_stub)

# Make plot
jpeg("final_figures/02_fig.jpeg", width=800, height=800)
par(mfrow=c(2,2))
CMplot(pepo, type="p", plot.type="d", main=expression(paste(italic("C. pepo"))),main.cex=2, file.output=F)
mtext("a.",3, cex=2, at=c(0,3), font=2, line=2) 
CMplot(mos, type="p", plot.type="d", main=expression(paste(italic("C. moschata"))), main.cex=2, cex.lab=2, file.output=F)
mtext("b.",3, cex=2, at=c(0,3), line=2, font=2) 
CMplot(max, type="p", plot.type="d", main=expression(paste(italic("C. maxima"))), main.cex=2, file.output=F)
mtext("c.",3, cex=2, at=c(0,3), line=2, font=2) 
dev.off()


