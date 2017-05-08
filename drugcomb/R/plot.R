require('gplots')

# plot stacked bars for each level comb.
# effects: a data frame with 
#   levels1, levels2: the dosage levels of drug1 and drug2, start from 1
#   combo, addit_eff, drug1_eff, drug2_eff: the actual, additive, drug1only, drug2only effects as ratio
# plot.singles: plot single drug effects as 1/2 on the bars if True.
# sep: seperator of the drug1 level and drug2 level in the bar labels.
# col: the colors for comm, syna, anti part of each bar.
# ...: pass to barplot
# return: the actual combo effect is max(comm, syna)
#' @export
plotEffects = function(effects,
    plot.singles=F, main='', sep='&', col=c('yellow', 'red', 'green'),
    drug1.pch='1', drug2.pch='2', ...)
{
    levels1 = effects[,1]
    levels2 = effects[,2]
    combo = effects[,3]
    addit = effects$addit_eff
    effect1 = effects$drug1_eff
    effect2 = effects$drug2_eff

    labels = paste(levels1, levels2, sep=sep)
    dat = cbind(comm = pmin(combo, addit),
                syna = pmax(combo - addit, 0),
                anti = pmax(addit - combo, 0))
    row.names(dat) = labels

    space = rep(0, length(unique(levels2)))
    space[1] = 0.5 #seperate bars for each drug1 dosage level.
    mids = barplot(t(dat), col=col, main=main,
        xlim=c(0,1), #horiz
        horiz=T, las=1,#horiz 
        space=space, border=NA,
        family='sans', font=2, ...)


    if (plot.singles) {
        points(effect1, mids, pch=drug1.pch)
        points(effect2, mids, pch=drug2.pch)
    }
}
