##RA plots for Roman samples
#Bacteria
glom.rom <- tax_glom(percentages_rom, taxrank = 'Phylum')
View(glom.rom@tax_table@.Data)
percentages_rom_glom <- psmelt(glom.rom)
str(percentages_rom_glom)
raw_rom <- tax_glom(physeq = merged_metagenomes_roman_bact, taxrank = "Phylum")
raw.data.rom <- psmelt(raw_rom)
str(raw.data.rom)
raw.plot.rom.bact  <- ggplot(data=raw.data.rom, aes(x=Sample, y=Abundance, fill=Phylum)) + 
  geom_bar(aes(), stat="identity", position="stack")
raw.plot.rom.bact <- raw.plot.rom.bact + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
raw.plot.rom.bact

rel.plot.rom.bact <- ggplot(data=percentages_rom_glom, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")
rel.plot.rom.bact <- rel.plot.rom.bact + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
rel.plot.rom.bact

View(percentages_rom_glom)
View(percentages_med_glom)

percentages_rom_glom$Phylum <- as.character(percentages_rom_glom$Phylum)
percentages_rom_glom$Phylum[percentages_rom_glom$Abundance < 1.0] <- "Phyla < 1.0% abund."
unique(percentages_rom_glom$Phylum)
View(percentages_rom_glom$Phylum)

rel.plot.rom.phyl <- ggplot(data=percentages_rom_glom, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")
rel.plot.rom.phyl <- rel.plot.rom.phyl + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
rel.plot.rom.phyl +
  xlab("Roman Samples") +
  ylab("Relative Abundance (%)")


##RA plots for Medeival samples
#Bacteria
glom.med <- tax_glom(percentages_med, taxrank = 'Phylum')
View(glom.med@tax_table@.Data)
percentages_med_glom <- psmelt(glom.med)
str(percentages_med_glom)
raw_med <- tax_glom(physeq = merged_metagenomes_medieval_bact, taxrank = "Phylum")
raw.data.med <- psmelt(raw_med)
str(raw.data.med)
raw.plot.med.bact  <- ggplot(data=raw.data.med, aes(x=Sample, y=Abundance, fill=Phylum)) + 
  geom_bar(aes(), stat="identity", position="stack")
raw.plot.med.bact <- raw.plot.med.bact + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
raw.plot.med.bact

rel.plot.med.bact <- ggplot(data=percentages_med_glom, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")
rel.plot.med.bact <- rel.plot.med.bact + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
rel.plot.med.bact

percentages_med_glom$Phylum <- as.character(percentages_med_glom$Phylum)
percentages_med_glom$Phylum[percentages_med_glom$Abundance < 1.0] <- "Phyla < 1.0% abund."
unique(percentages_med_glom$Phylum)

rel.plot.med.phyl <- ggplot(data=percentages_med_glom, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")
rel.plot.med.phyl <- rel.plot.med.phyl + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
rel.plot.med.phyl +
  xlab("Medieval Samples") +
  ylab("Relative Abundance (%)")

####

##RA plots for Roman samples
#Bacteria

glom.genus.rom <- tax_glom(percentages_rom, taxrank = 'Genus')
percentages.genus.rom <- psmelt(glom.genus.rom)
str(percentages.genus.rom)

raw.genus.rom <- tax_glom(physeq = merged_metagenomes_roman_bact, taxrank = "Genus")
raw.data.genus.rom <- psmelt(raw.genus.rom)
str(raw.data.genus.rom)

raw.plot.genus.rom <- ggplot(data=raw.data.genus.rom, aes(x=Sample, y=Abundance, fill=Genus))+ 
  geom_bar(aes(), stat="identity", position="stack")

View(raw.data.genus.rom)

rel.plot.genus.rom <- ggplot(data=percentages.genus.rom, aes(x=Sample, y=Abundance, fill=Genus))+ 
  geom_bar(aes(), stat="identity", position="stack")
#raw.plot.genus.med | rel.plot.genus.med

percentages.genus.rom$Genus <- as.character(percentages.genus.rom$Genus)
percentages.genus.rom$Genus[percentages.genus.rom$Abundance < 1.0] <- "Genera <1.0% abund."
unique(percentages.genus.rom$Genus)

rel.plot.2.genus.rom <- ggplot(data=percentages.genus.rom, aes(x=Sample, y=Abundance, fill=Genus))+ 
  geom_bar(aes(), stat="identity", position="stack") +
  ylab("Relative Abundance (%)") + xlab("Roman Samples")
rel.plot.2.genus.rom <- rel.plot.2.genus.rom + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
rel.plot.2.genus.rom


##RA plots for Medieval samples
#Bacteria

glom.genus.med <- tax_glom(percentages_med, taxrank = 'Genus')
percentages.genus.med <- psmelt(glom.genus.med)
str(percentages.genus.med)

raw.genus.med <- tax_glom(physeq = merged_metagenomes_medieval_bact, taxrank = "Genus")
raw.data.genus.med <- psmelt(raw.genus.med)
str(raw.data.genus.med)

raw.plot.genus.med <- ggplot(data=raw.data.genus.med, aes(x=Sample, y=Abundance, fill=Genus))+ 
  geom_bar(aes(), stat="identity", position="stack")

rel.plot.genus.med <- ggplot(data=percentages.genus.med, aes(x=Sample, y=Abundance, fill=Genus))+ 
  geom_bar(aes(), stat="identity", position="stack")
#raw.plot.genus.med | rel.plot.genus.med

percentages.genus.med$Genus <- as.character(percentages.genus.med$Genus)
percentages.genus.med$Genus[percentages.genus.med$Abundance < 1.0] <- "Genera <1.0% abund."
unique(percentages.genus.med$Genus)

rel.plot.2.genus.med <- ggplot(data=percentages.genus.med, aes(x=Sample, y=Abundance, fill=Genus))+ 
  geom_bar(aes(), stat="identity", position="stack") +
  ylab("Relative Abundance (%)") + xlab("Medieval Samples")
rel.plot.2.genus.med <- rel.plot.2.genus.med + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
rel.plot.2.genus.med


####

