#api with jsonlite
library(RCurl)
library(jsonlite)

base.url = "http://bioplex.hms.harvard.edu/bioplexDisplay/api/api.php?geneQuery="

#return a single table:
one.table=fromJSON(getURL(paste0(base.url,55909)))

#loop over multiple tables
gene.IDs = c(55909,1956,5796,10000000000)
presence = vector()
multiple.tables = list()
for(i in 1:length(gene.IDs)){
  if(validate(getURL(paste0(base.url,gene.IDs[i])))){
      multiple.tables[[i]] = fromJSON(
        getURL(
            paste0(base.url,gene.IDs[i])
          )
        )
      presence[i] = "yes"
  } else{
    multiple.tables[[i]] = 0
    presence[i] = "no"
  }
}

output.table = as.data.frame(cbind(gene.IDs,presence))
