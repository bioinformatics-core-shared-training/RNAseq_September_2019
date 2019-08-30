testLib <- function(lib){
    tryCatch(
             {
                 suppressPackageStartupMessages(library(lib, character.only = TRUE))
                 message(lib, " Yes")
             },
             error = function(con){
                 message(lib, " No")
                 return(NA)
             }
             )
}


libs <- c("biomaRt", "circlize", "clusterProfiler", "ComplexHeatmap", "DESeq2",
          "fgsea", "ggfortify", "Glimma", "GO.db", "goseq", "limma",
          "pathview", "tidyverse")

for(i in libs){ testLib(i) }


