
primes = seq(1000,2000,by=1)

primes[primes %% 10 == 1]
sum(primes[primes >=1000 & primes <= 2000])
