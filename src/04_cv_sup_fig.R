library(tidyverse)

# Read in cv results
pepo <- read_delim("data/03_geno/data/admix/cpepo/cv_error.txt", col_names=F)
mos <- read_delim("data/03_geno/data/admix/cmoschata/cv_error.txt", col_names=F)
maxima <- read_delim("data/03_geno/data/admix/cmaxima/cv_error.txt", col_names=F)

# Combine and format
pepo$species <- rep("C. pepo", nrow(pepo))
mos$species <- rep("C. moschata", nrow(pepo))
maxima$species <- rep("C. maxima", nrow(pepo))
all <- rbind(pepo, mos, maxima)
colnames(all) <-c("k", "error", "species") 
all <- arrange(all, species, k)


# Create figure
anno <- data.frame(x=c(6,6,10),
		   y=c(0.62228, 0.63824, 0.64416),
                   species=c("C. maxima", "C. moschata", "C. pepo"))
cv.plt <- ggplot(all, aes(x=k,y=error)) +
	         geom_point(size=3) +
		 geom_point(data=anno,aes(x=x,y=y),size=4,color="red") +
		 geom_line() +
		 ylab("CV error") + xlab("K") +
		 facet_wrap(~species, ncol=3, scales="free") +
		 theme_bw(base_size=18) +
		 theme(panel.grid=element_blank(),
		       strip.text=element_text(face="italic"))
ggsave("final_figures/04_fig.jpeg", cv.plt, "jpeg", width=12)
