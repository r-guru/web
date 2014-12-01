#!/usr/bin/env Rscript

input <- commandArgs(trailingOnly = TRUE)
KnitPost <- function(input, base.url = "/") {
  require(methods)
  require(knitr)
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  print(paste0("_rmd_out/", sub(".Rmd$", "", basename(input)), ".md"))
  knit(input, output = paste0("rmd_out/", sub(".Rmd$", "", basename(input)), ".md"), envir = new.env())#parent.frame())
}

KnitPost(input)