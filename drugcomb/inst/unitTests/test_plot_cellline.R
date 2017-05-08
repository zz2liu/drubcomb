source('~/code/working/melanoma_screening/plot_cellline.R')


test_plotComboAdditive = function() {
    pdf('tmp.pdf', width=200, height=200)
    plotComboAdditive('Vorinostat (SAHA)', 'Flavopiridol', plot.func=plot.stacked.bar, horiz=T,
        mfrow=c(40, 40))
    dev.off()
}

test_plotCellline = function() {
    plotCellline('X501MEL.BRAF', 
        drugs=c('Simvastatin', 'Lapatinib', 'MK-2206',  "PX 12"),
        plot.func=.plot.stacked.bar.horiz)
}

test_plotCellline()
