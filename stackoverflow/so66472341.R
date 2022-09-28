
unique_transcripts <- unique(timecourse1$transcript)

lm_list <- list()

for(u in unique_transcripts){
  
  lm_list[u] <- tryCatch({lm(expression_level~time,data=timecourse1[timecourse1$transcript == u,])},
                         error = function(e){NA})
  
}

