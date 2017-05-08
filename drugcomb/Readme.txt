The prototype for combo drug screening package:
plot_each_drugcomb_cellline(data_file, plot_func, plot_kw, par_kw)
plot_each_cellline_drugcomb(...)

# drugcomb is currently drug pairs.
# data_file a csv file with (drug1_id, drug1_level, drug2_id, drug2_level, cellline1, 2, ...)
    order by first four columns.
    drug_level: ordered factors, eg: 0,1,2,3,4,5,...; 0 is necessary for calc of additive effects.
    one of the drug can be a DMSO for single effects.


