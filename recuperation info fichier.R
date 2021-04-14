# This script is used to extract meta data on Excel files (creation date ...)

# Load librairies
library(dplyr)
library(data.table)

# List files only with xlsx extension 
fichiers = list.files(path="path_to_repository", pattern = ".xlsx$") 

# Know creation and modification dates of xlsx files 
fichiers = file.info(list.files(path="path_to_repository", full.names = TRUE, pattern = ".xlsx$"))
fichiers = setDT(fichiers, keep.rownames = TRUE)[]%>%
  arrange(desc(mtime))

