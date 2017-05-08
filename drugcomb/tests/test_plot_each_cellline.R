#source('util.R')
#source('plot_each_cellline.R')

#data = readData('test_data.csv')
#plotEachCellline(data, prefix='tmp/drugcomb')
plotEachCelllineFromFile('test_data.csv', prefix='tmp/drugcomb', plot.singles=T)
