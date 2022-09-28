dat = read.table(text = 'Sentence	| Keyword |	Keyword_w_context
The yellow lab dog is so cute.|dog|The yellow lab dog
The fluffy black cat purrs loudly.|cat|The fluffy black cat',sep="|",header=TRUE)

n_before = 3
n_after = 2


# Note: This will give an error if you don't have enough words before or after
dat %>% 
  mutate(Keyword_w_context_before = str_extract(string=Sentence,
                                              pattern=paste0("(([A-Za-z]+)\\s){",n_before,"}",Keyword)),
         
         Keyword_w_context_after = str_extract(string=Sentence,
                                               pattern=paste0(Keyword,"(\\s([A-Za-z]+)){",n_after,"}"))
         )
