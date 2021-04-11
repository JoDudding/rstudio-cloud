#-------------------------------------------------------------------------------
#' clean_folders.r
#-------------------------------------------------------------------------------
#' jo dudding
#' apr 21
#' move output from the rmarkdown code to the outputs folder
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' run setup
#-------------------------------------------------------------------------------

source('scripts/setup.r', echo = FALSE)

#-------------------------------------------------------------------------------
#' move .html reports to the html folder
#-------------------------------------------------------------------------------

system("mv -f scripts/*.html html")

#-------------------------------------------------------------------------------
#' move .md reports to the outputs folder
#-------------------------------------------------------------------------------

# identify the md documents
md_files <- list.files(here::here("scripts"), pattern = "\\.md")

# omit the readme
md_files <- md_files[md_files != 'README.md']

# create the move instruction
md_files <- glue("mv -f scripts/{md_files} outputs")

# apply the move instruction
map(md_files, system)

#-------------------------------------------------------------------------------
#' move subfolders to the outputs folder
#-------------------------------------------------------------------------------

# identify folders
md_fold <- list.dirs(here::here("scripts"), full.names = FALSE, 
                     recursive = FALSE)

# create instruction to delete existing folder in outputs
md_fold_rm <- glue("rm -r outputs/{md_fold}")

# apply for each folder
map(md_fold_rm, system)

# create move instruction
md_fold_mv <- glue("mv -f scripts/{md_fold} outputs")

# apply for each folder
map(md_fold_mv, system)

#-------------------------------------------------------------------------------