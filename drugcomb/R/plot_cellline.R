###
#source('util.R') #readData
#source('plot.R') #getEffects, plotEffects

###
#' plot for all combos, given a cellline
#' @param ...: pass to plot.func
#' @export
plotCellline = function(data, cellline, drugs1, drugs2,
                        ...)
{
    par(mfrow=c(length(drugs1), length(drugs2)),
        mar=c(2,2,2,0), #more compact margin
        oma=c(3, 1, 4, 1), #bigger top outer margin
        mgp=c(0,0.3,0), #smaller label margin
        tcl=0.5) #tick inside
    for (i in 1:length(drugs1)) {
        for (j in 1:length(drugs2)) {
            # a subplot for drug1&drug2
            drug1 = drugs1[i]; drug2 = drugs2[j]
            #print (paste(i, j, drug1, drug2))
            effects = getEffects(data, drug1, drug2, cellline)
            plotEffects(effects, ...)
            title(paste(substr(drug1, 1, 4), ' & ', substr(drug2, 1, 4), sep=''))
        }
    }
}

