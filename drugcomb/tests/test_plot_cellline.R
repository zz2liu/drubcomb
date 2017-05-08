#source('util.R')
#source('plot_cellline.R')

data = readData('test_data.csv')
drugs1 = c('Dia1', 'hspi')
drugs2 = c('Bort', 'CMPD', 'Curc')
cellline = 'H1975'
plotCellline(data, cellline, drugs1, drugs2)
plotCellline(data, cellline, drugs1, drugs2, plot.singles=T)


