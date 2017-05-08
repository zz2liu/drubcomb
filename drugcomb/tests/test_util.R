#source('util.R')
data = readData('test_data.csv')
drug1 = 'Dia1'
drug2 = 'Bort'
cellline = 'H1975'
combo = getCombo(data, drug1, drug2, cellline)
effects = getEffects(data, drug1, drug2, cellline)
print(effects)
#browser()

################3
#run = function(drug1, drug2)
#{
#    data = readData(data.file=COMBO.FILE)
#    #res = getDrugData(data, drug1, drug2)
#    res = getAdditiveData(data, drug1, drug2)
#    res.new = getAdditiveData.new(data, drug1, drug2)
#    browser()
#}
#
#run('Simvastatin', 'PX 12')
