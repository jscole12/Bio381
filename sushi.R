#Sushi for genomic data visualization
# December 6 2018
# JSC

# what is sushi? r package for genomic data plotting
# BED, Bedgraph, bedpe, interaction matrices
# Bed formats: chromosome name, chromostart, chromend
# bedgraph: 4th column a value, 

# sequencing tracks, interaction plots, gene structure, manhattan plots, gene density plot
# zoomsregion() zoombox() 

library(Sushi)
Sushi_data <- data(package= "Sushi")
Sushi_data

data(list= Sushi_data$results[,3])

# Function plotBedgraph()

head(Sushi_DNaseI.bedgraph)

chrom= "chr11"
chromstart= 1650000
chromend= 2350000

plotBedgraph(Sushi_DNaseI.bedgraph, chrom, chromstart, chromend, colorbycol=SushiColors(5))

labelgenome(chrom, chromstart, chromend, n=5, scale= "Mb")
mtext("read Depth", side=2, line=2.75, cex=1, font=2)
axis(side=2,las=2, tcl=.2)

# plotmanhattan, plotBed

p <- layout(matrix(c(1,1,1,1,
                     1,1,1,1,
                     2,2,2,2,
                     2,2,2,2,
                     3,3,3,3,
                     3,3,3,3),
                   6,4,byrow= TRUE))
layout.show(p)

# set the parameters
par(mgp= c(3, .3, 0))
par(mar= c(3,4,3,2))

# genomic parameters
chrom= "chr15"
chromstart = 73000000
chromend= 89500000

plotManhattan(bedfile = Sushi_GWAS.bed, pvalues= Sushi_GWAS.bed[,5], genome= Sushi_hg18_genome, cex = 0.75)

labelgenome(genome=Sushi_hg18_genome, n=4, scale="Mb", edgeblankfraction = 0.20)
axis(side=2, las=2, tcl=0.2)
mtext("log10(p)", side=2, line=1.75, cex=.75, font=2)
labelplot("A)", "GWAS")

# zoomed in gwas

# set the margins
par(mar=c(0.1,4,2,2))

# set the genomic regions
chrom= "chr15"
chromstart= 60000000
chromend= 80000000
chromstart2= 72000000
chromend2= 74000000

plotManhattan(bedfile = Sushi_GWAS.bed, chrome=chrome2, 
              chromestart= chromestart,
              chromend = chromend,
              pvalues= Sushi_GWAS.bed$pval.GC.DBP,
              col = SushiColors(6), nrow(Sushi_hg18_genome)[15],
              cex=0.75)

zoomzregion(region=c(chromestart2,chromend2),
            chrom=chrome2,
            extend=c(0.075,1),
            wideextend = 0.2,
            offsets= c(0.0,0))
zoombox(passthrough = TRUE, topextend = 2)
axis(side=2, las=2, tcl=.2)
mtext("Z_score", side=2, line=1.75, cex=0.75, font=2)

labelplot("B)", "Zoomed in")


# plotbed() to make a gene density plot

# set the margins
par(mar=c(3,4,1.8,2)) 

#set genomic regions
chrom = "chr15"
chromstart = 60000000
chromend = 80000000
chrome_biomart= gsub("chr", "", chrom)

# set the mart 
mart <- useMart(host='may2009.archive.ensemble.org', 
                biomart = 'ENSEMBL_MART_ENSEMBL', 
                dataset='hsapiens_gene_ensembl')

# get gene info 
geneinfobed <- getBM (attributes= c("chromosome_name", "start_position", "end_position"),
                      filters=c("chromosome_name", "start", "end"), 
                      values=list(chrom_biomart,chromstart,chromend),mart=mart)

geneinfobed[,1]= paste("chr", geneinfobed[,1], sep="")

head(geneinfobed)




plotBed(beddata = geneinfobed[!duplicated(geneinfobed),],
        chrom = chrom,
        chromstart = chromstart,
        chromend =chromend,
        row='supplied', #how row number should be determined
        palettes = list(SushiColors(7)), type = "density") #type can also be set to circles and region but here we want a density plot 
#?plotBed

# add zoom in
zoomsregion(region=c(chromstart2,chromend2), 
            chrom=chrom2,
            genome=NULL,
            highlight = TRUE, #TRUE indicates that you just want a box around a region of interest
            extend=c(2,0)) #vector indidcating how far zoom region extends above and below the plot region
#add labels
labelgenome(chrom, 
            chromstart, 
            chromend, 
            n=3,
            scale="Mb",edgeblankfraction=0.20)


labelplot("C)"," Gene Density")