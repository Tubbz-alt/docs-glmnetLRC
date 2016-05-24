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
  package_name = "glmnetLRC",  # name of the package
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

# Manual edits of rd.html
rsed::streamEdit(list(
  # Fix print method for 'lossMat'
  r = list(at = "printlossMat(x, ...)</code></pre>",
           replacement = "## S3 method for class 'lossMat'\nprint(x, ...)</code></pre>",
           fixed = TRUE),

  # Fix print method for 'glmnetLRC'
  r = list(at = "printglmnetLRC(x, verbose = TRUE, ...)",
           replacement = "## S3 method for class 'glmnetLRC'\nprint(x, verbose = TRUE, ...)",
                               fixed = TRUE),
  
  # Fix plot method for 'glmnetLRC'
  r = list(at = "plotglmnetLRC(x, ...)",
           replacement = "## S3 method for class 'glmnetLRC'\nplot(x, ...)",
           fixed = TRUE),

  # Fix coef method for 'glmnetLRC'
  r = list(at = "coefglmnetLRC(object, ...)",
           replacement = "## S3 method for class 'glmnetLRC'\ncoef(object, ...)",
           fixed = TRUE),

  # Fix predict method for 'glmnetLRC'
  r = list(at = "predictglmnetLRC(object, newdata, truthCol = NULL,",
           replacement = "## S3 method for class 'glmnetLRC'\npredict(object, newdata, truthCol = NULL,",
           fixed = TRUE),

  # Fix missingpreds method for 'glmnetLRC'
  r = list(at = "missingpredsglmnetLRC(object, newdata, ...)",
           replacement = "## S3 method for class 'glmnetLRC'\nmissingpreds(object, newdata, ...)",
           fixed = TRUE),

  # Fix extract method for 'glmnetLRC'
  r = list(at = "extractglmnetLRC(object, ...)</code></pre>",
           replacement = "## S3 method for class 'glmnetLRC'\nextract(object, ...)</code></pre>",
           fixed = TRUE),

  # Fix summary method for 'LRCpred'
  r = list(at = "summaryLRCpred(object, ...)",
           replacement = "<pre class=\"r\"><code>## S3 method for class 'LRCpred'\nsummary(object, ...)",
           fixed = TRUE),

  # Fix print method for 'summaryLRCpred'
  r = list(at = "printsummaryLRCpred(x, ...)",
           replacement = "## S3 method for class 'summaryLRCpred'\nprint(x, ...)</code></pre>",
           fixed = TRUE),
    
  # Fix plot method for 'LRCpred'
  r = list(at = "plotLRCpred(x,",
           replacement = "<pre class=\"r\"><code>## S3 method for class 'LRCpred'\nplot(x, pch = c(1, 2), col = c(\"Blue\", \"Red\"),",
           fixed = TRUE),
                      
  # Fix glmnetLRC link in glmnetLRC_fit
  s = list(pattern = "<code><a href='glmnetLRC.html'>",
           replacement = "<code><a href='#glmnetlrc'>",
           fixed = TRUE),
                      
  # Fix the author field
  r = list(at = "<strong>Authors:</strong> (none)",
           replacement = "<strong>Authors:</strong> Landon H. Sego, Alexander M. Venzin, John A. Ramey",
           fixed = TRUE)),
                 
  inFile = "rd.html", outFile = "rd.html")
