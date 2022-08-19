#Alpha-diversity

library(ggplot2)
library(dplyr)

library(biomformat)
mydata <-read_biom("/Users/hadiyakhan/Research_Project/stat_data/newest_data/all_sample.biom")
otutable<-as.data.frame(as.matrix(biom_data(mydata)), header = TRUE)
taxonomy <- observation_metadata(mydata, header = TRUE)

library(phyloseq)
OTU = otu_table(as.matrix(otutable), taxa_are_rows = TRUE)
TAX = tax_table(as.matrix(taxonomy))

sample <- read.csv("/Users/hadiyakhan/Research_Project/stat_data/newest_data/metadata_all.csv", row.names=1)
SAM = sample_data(sample, errorIfNULL = T)

phylob <- phyloseq(OTU,TAX, SAM)

ps_rare <- phyloseq::rarefy_even_depth(phylob, rngseed = 123, replace = FALSE)
head(phyloseq::sample_sums(phylob_rare))

adiv <- data.frame(
  "Observed" = phyloseq::estimate_richness(phylob, measures = "Observed"),
  "Shannon" = phyloseq::estimate_richness(phylob, measures = "Shannon"),
  "Chao1" = phyloseq::estimate_richness(phylob, measures = "Chao1"),
  "Time_Period" = phyloseq::sample_data(phylob)$timeperiod)

adiv <- rename(adiv, Chao1 = Chao1.Chao1)

adiv %>%
  gather(key = metric, value = value, c("Observed", "Shannon", "Chao1")) %>%
  mutate(metric = factor(metric, levels = c("Observed", "Shannon", "Chao1"))) %>%
  ggplot(aes(x = Time_Period, y = value)) +
  geom_boxplot(outlier.color = NA) +
  geom_jitter(aes(color = Time_Period), height = 0, width = .2) +
  labs(x = "", y = "") +
  facet_wrap(~ metric, scales = "free") +
  theme(legend.position="none")


wc_ob <- wilcox.test(Observed ~ Time_Period, data = adiv, exact = FALSE, conf.int = TRUE)
wc_sh <- wilcox.test(Shannon ~ Time_Period, data = adiv, conf.int = TRUE)
wc_ch <- wilcox.test(Chao1 ~ Time_Period, data = adiv, conf.int = TRUE)

#Beta-diversity

library(vegan)
library(phyloseq)
library(ggplot2)

data_phylo_filt = filter_taxa(phylob, function(x) sum(x > 2) > (0.11 * length(x)), TRUE)
set.seed(123)
OTU_filt_rar = rarefy_even_depth(otu_table(data_phylo_filt), rngseed = TRUE, replace = FALSE)
data_otu_filt_rar = data.frame(otu_table(OTU_filt_rar))
data_phylo_filt_rar <- phyloseq(OTU_filt_rar, TAX, SAM)

dist_bc <- as.matrix(vegdist(data_otu_filt_rar, method = "bray")) 
dist_bc[1:5, 1:5]
pcoa_bc = ordinate(data_phylo_filt_rar, "PCoA", "bray") 
plot_ordination(data_phylo_filt_rar, pcoa_bc, color = "timeperiod") + 
  geom_point(size = 3) +
  stat_ellipse(aes(group = timeperiod), linetype = 2)

