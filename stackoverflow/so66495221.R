library(rentrez)

species<-c("Ablennes hians","Centrophryne spinulosa","Doratonotus megalepis","Entomacrodus cadenati","Katsuwonus pelamis","Lutjanus fulgens","Pagellus erythrinus")

data <- list()

for (x in species){
  term<-paste(x,"[Organism] AND (((COI[Gene] OR CO1[Gene] OR COXI[Gene] OR COX1[Gene]) AND (500[SLEN]:3000[SLEN])) OR complete genome[All Fields] OR mitochondrial genome[All Fields])",sep='',collapse = NULL)
  search<-entrez_search(db="nuccore",term=term,retmax=99999)
  data[x] <- tryCatch({entrez_fetch(db="nuccore",id=search$ids,rettype="fasta")},
                      error = function(e){NA})
}
