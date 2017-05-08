#source('plot_cellline.R')

#' plot a combination plot for each cellline
#' @param data a data.frame with four header columns named (drug1, drug1_level, drug2, drug2_level)
#'   and a number of percent inhibition columns, a column for each cellline.
#'   the cellline names should be valid for usage in a file name (no */\@$% etc)
#'   drug1 - plot as rows;  drug2 - plot as cols; the name of drugs should be short (<=4 letters)
#'   each drug should have a comb with '' (blank) at each level as single agent effects
#'   drug1_level: the dosage level (1..9) of drug1, all the drugs should have the same number of levels
#'   drug2_level: the dosage level (1..9) of drug2, all the drugs should have the same number of levels
#' @param prefix the prefix of the out pdf file for each cellline. file name = {prefix}.cellline.pdf
#' @param ... plot.func, parameters to plot.func
#' @return a combination plot in pdf file for each cellline.
#'   numDrug1 x numDrug2 subplots for each cellline.
#'   Each subplot is a combination of a pair of drugs (plot as title {drug1}&{drug2})
#'       Label each combination level as {drug1_level}&{drug2_level}
#'   Each bar: red means synergy (comb effect > additive effect), green means
#'       antignism (comb effect < additive effect), the actual effect is top of red
#'       (or yellow in case of antaganism.  numbers on the bar are single effects of drug1 and drug2
#' @export
plotEachCellline = function(data, prefix='', subplot.size=2, ...)
{
    celllines = colnames(data)[-(1:4)]
    drugs1 = unique(data$drug1)
    drugs1 = drugs1[drugs1 != '']
    drugs2 = unique(data$drug2)
    drugs2 = drugs2[drugs2 != '']
    for (i in 1:length(celllines)){
        cellline = celllines[i]
        pdf.file = paste(prefix, '.', cellline, '.pdf', sep='')
        print(pdf.file)
        height.adjust = 1.3
        pdf(pdf.file, width=subplot.size*length(drugs2), 
            height=subplot.size*height.adjust*length(drugs1)) #test
        plotCellline(data, cellline, drugs1, drugs2, ...)
        dev.off()
    }
}

#' plot a combination plot for each cellline from a csv file
#' @param data.file a csv file with four header columns named (drug1, drug1_level, drug2, drug2_level)
#'   and a number of percent inhibition columns, a column for each cellline.
#'   the cellline names should be valid for usage in a file name (no */\@$% etc)
#'   drug1 - plot as rows;  drug2 - plot as cols; the name of drugs should be short (<=4 letters)
#'   each drug should have a comb with '' (blank) at each level as single agent effects
#'   drug1_level: the dosage level (1..9) of drug1, all the drugs should have the same number of levels
#'   drug2_level: the dosage level (1..9) of drug2, all the drugs should have the same number of levels
#' @param prefix the prefix of the out pdf file for each cellline. file name = {prefix}.cellline.pdf
#' @param ... plot.func, parameters to plot.func
#' @return a combination plot in pdf file for each cellline.
#'   numDrug1 x numDrug2 subplots for each cellline.
#'   Each subplot is a combination of a pair of drugs (plot as title {drug1}&{drug2})
#'       Label each combination level as {drug1_level}&{drug2_level}
#'   Each bar: red means synergy (comb effect > additive effect), green means
#'       antignism (comb effect < additive effect), the actual effect is top of red
#'       (or yellow in case of antaganism.  numbers on the bar are single effects of drug1 and drug2
#' 
#' @export
plotEachCelllineFromFile = function(data.file, ...)
{
    data = readData(data.file)
    plotEachCellline(data, ...)
}

