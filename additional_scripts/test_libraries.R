suppressPackageStartupMessages(library(tidyverse))

getLibs <- function(rmdFile){
    read_lines(rmdFile) %>%
        str_subset("^library\\(") %>%
        str_remove_all("^library\\(|\\).*")
}

testLib <- function(lib){
    tryCatch(
             {
                 suppressPackageStartupMessages(library(lib, character.only = TRUE))
                 message(lib, " Yes")
             },
             error = function(con){
                 message(lib, " No")
                 return(lib)
             }
             )
}


missingLibs <- list.files("Course_Materials", pattern = "Rmd$", full.names = TRUE) %>%
    map(getLibs) %>%
    unlist() %>%
    unique() %>%
    map(testLib) %>%
    unlist()
    
message()
if(!is.null(missingLibs)){
    message("Missing libraries: ", missingLibs)
}else{
    message("All correctly installed.")
}
