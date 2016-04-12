## install packagedocs if not installed:
if(!require("packagedocs")) {
  options(repos = c(tessera = "http://packages.tessera.io", getOption("repos")))
  install.packages("packagedocs")
}

knitr::opts_knit$set(root.dir = normalizePath("."))

# Render the documents
packagedocs::render_docs(
  code_path = "~/Work/github/glmnetLRC",
  docs_path = ".",             # location of docs directory
  package_name = "glmnetLRC",      # name of the package
  main_toc_collapse = TRUE,    # use collapsing toc on main page
  rd_toc_collapse = TRUE,      # use collapsing toc on rd page
  lib_dir = "assets",          # put assets in "assets" directory
  render_main = TRUE,          # render main page
  render_rd = TRUE,            # render rd page
  view_output = FALSE,         # look at the output after render
  rd_index = "./rd_index.yaml" # optional path to rd layout yaml
)

# Ensure the 'rsed' package is installed
if(!require("rsed")) {
  devtools::install_github("pnnl/rsed")
}

# Manual edits of index.html
## rsed::streamEdit(list(# Map links for pbb, qbb, and rbb to dbb
##                       s = list(pattern = "rd.html#pbb", replacement = "rd.html#dbb", fixed = TRUE),
##                       s = list(pattern = "rd.html#qbb", replacement = "rd.html#dbb", fixed = TRUE),
##                       s = list(pattern = "rd.html#rbb", replacement = "rd.html#dbb", fixed = TRUE),
                      
##                       # Map links for pkbinom to dkbinom
##                       s = list(pattern = "rd.html#pkbinom", replacement = "rd.html#dkbinom", fixed = TRUE)),
                 
##                  inFile = "index.html", outFile = "index.html")

# Manual edits of rd.html
rsed::streamEdit(list(# Fix link for sorting a dataframe
                      ## s = list(pattern = "= #https://stat.ethz.ch/pipermail/r-help/2004-september/057954>",
                      ##          replacement = "= https://stat.ethz.ch/pipermail/r-help/2004-September/057954.html>",
                      ##          fixed = TRUE),
                      
                      ## # Fix left link for dbb
                      ## s = list(pattern = '<li><a href="#dbb">dbb</a></li>',
                      ##          replacement = '<li><a href="#dbb">dbb, pbb, qbb, rbb</a></li>',
                      ##          fixed = TRUE),
                      
                      ## # Fix header text for dbb
                      ## r = list(at = "<h2>dbb</h2>",
                      ##          replacement = "<h2>dbb, pbb, qbb, rbb</h2>",
                      ##          fixed = TRUE),
                      
                      ## # Fix left link for dkbinom
                      ## s = list(pattern = '<li><a href="#dkbinom">dkbinom</a></li>',
                      ##          replacement = '<li><a href="#dkbinom">dkbinom, pkbinom</a></li>',
                      ##          fixed = TRUE),
                      
                      ## # Fix header text for dkbinom
                      ## r = list(at = "<h2>dkbinom</h2>",
                      ##          replacement = "<h2>dkbinom, pkbinom</h2>",
                      ##          fixed = TRUE),
                      
                      ## # Fix the methods for hpd
                      ## s = list(pattern = "printhpd(x", replacement = "print(x", fixed = TRUE),
                      ## s = list(pattern = "plothpd(x", replacement = "plot(x", fixed = TRUE),

                      ## # Fix the link for grabLast in getExtension
                      ## s = list(pattern = "<code><a href='grabLast.html'>",
                      ##          replacement = "<code><a href='#grablast'>",
                      ##          fixed = TRUE),
                      
                      ## # Fix the link for plapply in dfplapply
                      ## s = list(pattern = "<code><a href='plapply.html'>",
                      ##          replacement = "<code><a href='#plapply'>",
                      ##          fixed = TRUE),
                      
                      ## # Fix the link for smartFilter in movAvg2
                      ## s = list(pattern = "<code><a href='smartFilter.html'>",
                      ##          replacement = "<code><a href='#smartfilter'>",
                      ##          fixed = TRUE),
                      
                      ## # Fix the link for smartTimeAxis in timeDiff.eg
                      ## s = list(pattern = "<code><a href='smartTimeAxis.html'>",
                      ##          replacement = "<code><a href='#smarttimeaxis'>",
                      ##          fixed = TRUE),
                      
                      ## # Fix the link for timeIntegration in PowerData
                      ## s = list(pattern = "<code><a href='timeIntegration.html'>",
                      ##          replacement = "<code><a href='#timeintegration'>",
                      ##          fixed = TRUE),
                      
                      ## # Fix the link for timeDiff in timeData
                      ## s = list(pattern = "<code><a href='timeDiff.html'>",
                      ##          replacement = "<code><a href='#timediff'>",
                      ##          fixed = TRUE),
                 
                      # Fix the author field
                      r = list(at = "<strong>Authors:</strong> (none)",
                               replacement = "<strong>Author:</strong> Landon Sego",
                               fixed = TRUE)),
                 
                 inFile = "rd.html", outFile = "rd.html")
