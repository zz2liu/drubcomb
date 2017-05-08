test_readData <- function() {
	res = readData('../../data/data.test.txt')
	checkEquals(dim(res), c(20,9))
}

source('~/code/working/melanoma_screening/util.R')
run = function(drug1, drug2)
{
    data = readData(data.file=COMBO.FILE)
    #res = getDrugData(data, drug1, drug2)
    res = getAdditiveData(data, drug1, drug2)
    res.new = getAdditiveData.new(data, drug1, drug2)
    browser()
}

run('Simvastatin', 'PX 12')
