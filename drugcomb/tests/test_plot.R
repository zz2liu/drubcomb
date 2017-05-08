source('../R/plot.R')
source('../R/util.R')

data = readData('test_data.csv')
drug1 = 'Dia1'
drug2 = 'Bort'
cellline = 'H1975'
effects = getEffects(data, drug1, drug2, cellline)
plotEffects(effects, plot.singles=F, main=paste(drug1,drug2, sep='&'))

