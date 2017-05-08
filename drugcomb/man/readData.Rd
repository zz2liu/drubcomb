\name{readData}
\alias{readData}
\title{read data from a csv file to a data frame
order by four header columns: drug1,drug2,drug1_level, drug2_level
turn percent into ratio, negative to 0.}
\usage{
  readData(data.file, force.positive = T,
    force.percent = F, convert2ratio = T)
}
\arguments{
  \item{data.file}{a csv file with our header columns
  (drug1,drug2,drug1_level, drug2_level) and cellline
  percent inhibition columns}

  \item{force.positive}{convert negative percent into 0}

  \item{force.percent}{convert >100 to 100}
}
\description{
  read data from a csv file to a data frame order by four
  header columns: drug1,drug2,drug1_level, drug2_level turn
  percent into ratio, negative to 0.
}

