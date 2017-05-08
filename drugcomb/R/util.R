require(sqldf)

#' read data from a csv file to a data frame
#' order by four header columns: drug1,drug2,drug1_level, drug2_level
#' turn percent into ratio, negative to 0.
#' @param data.file a csv file with our header columns (drug1,drug2,drug1_level, drug2_level) and cellline percent inhibition columns
#' @param force.positive convert negative percent into 0
#' @param force.percent convert >100 to 100
#' @convert2ratio convert percentage to ratio 0..1
#' @export
readData = function(data.file, force.positive=T, force.percent=F, convert2ratio=T)
{
    data = read.csv(data.file, as.is=T)
    data$drug1_level = as.character(data$drug1_level)
    data$drug2_level = as.character(data$drug2_level)
    data = data[order(data$drug1, data$drug2, data$drug1_level, data$drug2_level),]

    header = data[,1:4]
    dat = data[,-(1:4), drop=F]
    #force positive
    if (force.positive) {
        dat = apply(dat, 2, function(x) { x[x<0] = 0; x })
    }
    #force <=100
    if (force.percent) {
        dat = apply(dat, 2, function(x) { x[x>100] = 100; x })
    }

    if (convert2ratio) {
        dat = apply(dat, 2, function(x) { x=x/100; x })
    }
    result = cbind(header, dat)
}


#get a data frame of drug1level, drug2level, effect; order by level1,level2
getCombo = function(data, drug1, drug2, cellline)
{
    sele = (data$drug1==drug1) & (data$drug2==drug2)
    res = data[sele, c('drug1_level', 'drug2_level', cellline)]
    result = res[order(res$drug1_level, res$drug2_level),]
}

###
# ref: Borisy,,Keith 2003: Systematic discovery of multicomponent therapeutics
bliss.additive = function(a, b) { a + b - a*b }

#get a data frame of drug1level, drug2level, combo effect, bliss additive, drug1only, drug2only effect
getEffects = function(data, drug1, drug2, cellline)
{
    result = getCombo(data, drug1, drug2, cellline)

    drug1only = (data$drug1==drug1) & (data$drug2=='')
    drug1.eff = data[drug1only, cellline]
    names(drug1.eff) = data[drug1only, 'drug1_level']
    result$drug1_eff = drug1.eff[result$drug1_level]

    drug2only = (data$drug2==drug2) & (data$drug1=='')
    drug2.eff = data[drug2only, cellline]
    names(drug2.eff) = data[drug2only, 'drug2_level']
    result$drug2_eff = drug2.eff[result$drug2_level]
    result$addit_eff = bliss.additive(result$drug1_eff, result$drug2_eff)
    return (result)
}


