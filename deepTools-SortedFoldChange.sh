#!/bin/bash
#SBATCH -p htc
#SBATCH --mem=40G
#SBATCH --ntasks=2
#SBATCH --tasks-per-node=4
#SBATCH -t 24:00:00
#SBATCH -o DpTlsL.%J
#SBATCH -e DpTlsL.%J
#SBATCH --job-name=DpTls2
#SBATCH --account=scw1448

computeMatrix reference-point --regionsFileName LogFold-Genes.pad1000.bed --scoreFileName wt1coverage.bigWig \
--outFileName wt1LogMatrix.tab.gz --referencePoint center --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --sortRegions keep
computeMatrix reference-point --regionsFileName LogFold-Genes.pad1000.bed --scoreFileName wt2coverage.bigWig \
--outFileName wt2LogMatrix.tab.gz --referencePoint center --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --sortRegions keep
computeMatrix reference-point --regionsFileName LogFold-Genes.pad1000.bed --scoreFileName wt3coverage.bigWig \
--outFileName wt3LogMatrix.tab.gz --referencePoint center --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --sortRegions keep
computeMatrix reference-point --regionsFileName LogFold-Genes.pad1000.bed --scoreFileName ko4coverage.bigWig \
--outFileName ko4LogMatrix.tab.gz --referencePoint center --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --sortRegions keep
computeMatrix reference-point --regionsFileName LogFold-Genes.pad1000.bed --scoreFileName ko5coverage.bigWig \
--outFileName ko5LogMatrix.tab.gz --referencePoint center --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --sortRegions keep
computeMatrix reference-point --regionsFileName LogFold-Genes.pad1000.bed --scoreFileName ko6coverage.bigWig \
--outFileName ko6LogMatrix.tab.gz --referencePoint center --beforeRegionStartLength 1000 --afterRegionStartLength 1000 --sortRegions keep

plotHeatmap --matrixFile wt1LogMatrix.tab.gz --outFileName wt1LogHeatMap.png --sortRegions no
plotHeatmap --matrixFile wt2LogMatrix.tab.gz --outFileName wt2LogHeatMap.png --sortRegions no
plotHeatmap --matrixFile wt3LogMatrix.tab.gz --outFileName wt3LogHeatMap.png --sortRegions no
plotHeatmap --matrixFile ko4LogMatrix.tab.gz --outFileName ko4LogHeatMap.png --sortRegions no
plotHeatmap --matrixFile ko5LogMatrix.tab.gz --outFileName ko5LogHeatMap.png --sortRegions no
plotHeatmap --matrixFile ko6LogMatrix.tab.gz --outFileName ko6LogHeatMap.png --sortRegions no