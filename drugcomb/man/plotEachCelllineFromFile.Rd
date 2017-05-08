\name{plotEachCelllineFromFile}
\alias{plotEachCelllineFromFile}
\title{plot a combination plot for each cellline from a csv file}
\usage{
  plotEachCelllineFromFile(data.file, ...)
}
\arguments{
  \item{data.file}{a csv file with four header columns
  named (drug1, drug1_level, drug2, drug2_level) and a
  number of percent inhibition columns, a column for each
  cellline.  the cellline names should be valid for usage
  in a file name (no */\}

  \item{prefix}{the prefix of the out pdf file for each
  cellline. file name = {prefix}.cellline.pdf}

  \item{...}{plot.func, parameters to plot.func}
}
\value{
  a combination plot in pdf file for each cellline.
  numDrug1 x numDrug2 subplots for each cellline.  Each
  subplot is a combination of a pair of drugs (plot as
  title {drug1}&{drug2}) Label each combination level as
  {drug1_level}&{drug2_level} Each bar: red means synergy
  (comb effect > additive effect), green means antignism
  (comb effect < additive effect), the actual effect is top
  of red (or yellow in case of antaganism.  numbers on the
  bar are single effects of drug1 and drug2
}
\description{
  plot a combination plot for each cellline from a csv file
}

