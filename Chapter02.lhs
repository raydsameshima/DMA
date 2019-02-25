Chapter02.lhs

> module Chapter02 where

> import Data.Numbers.Primes

Definition 1.
An algorithm is a finite set of precise instruction for performing a computation
or for solving a problem.

A solution to the Chinese mathematician Sun-Tsu:

> crt = head [x | x <- [1..], x `mod` 3 == 2, x `mod` 5 == 3, x `mod` 7 == 2]

Computations and Explorations

1. Determine whether 2^p-1 is prime for each of the primes not exceeding 100.

*Chapter02> takeWhile (<100) [2^p-1| p<- primes]
[3,7,31]

*Chapter02> takeWhile (<1000) [2^p-1| p<- primes]
[3,7,31,127]

3. Show that n^2+n+41 is prime for all n<-[0..39], but is not prime when n=40.

> ps = [n^2+n+41| n<-[0..40]]

*Chapter02> map isPrime ps
[True,True,True,True,True,True,True,True,True,True
,True,True,True,True,True,True,True,True,True,True
,True,True,True,True,True,True,True,True,True,True
,True,True,True,True,True,True,True,True,True,True
,False
]

4. Find as many primes of the form n^2+1 where n is a positive integer as you can.

*Chapter02> take 100 $ filter isPrime [n^2+1|n<-[0..]]
[2,5,17,37,101,197,257,401,577,677,1297,1601,2917,3137,4357,5477,7057,8101,8837,12101,13457,14401,15377,15877,16901,17957,21317,22501,24337,25601,28901,30977,32401,33857,41617,42437,44101,50177,52901,55697,57601,62501,65537,67601,69697,72901,78401,80657,90001,93637,98597,106277,115601,122501,147457,148997,156817,160001,164837,176401,184901,190097,193601,197137,215297,217157,220901,224677,240101,246017,287297,295937,309137,324901,331777,341057,352837,401957,404497,414737,417317,427717,454277,462401,470597,476101,484417,490001,495617,509797,512657,547601,562501,577601,583697,608401,614657,665857,682277,739601]

5. Find 10 different primes each with 100 digits.

> keta 
>   :: Integer -> Int
> keta = floor . logBase 10 . fromInteger

Theoretically, we can have the first 10 primes but, the following small tests shows this implementation is super slow.

*Chapter02> take 10 $ filter (\x -> 6 == keta x) primes
[1000003,1000033,1000037,1000039,1000081,1000099,1000117,1000121,1000133,1000151]
(0.22 secs, 386,408,352 bytes)
*Chapter02> take 10 $ filter (\x -> 7 == keta x) primes
[10000019,10000079,10000103,10000121,10000139,10000141,10000169,10000189,10000223,10000229]
(2.34 secs, 4,579,946,312 bytes)
*Chapter02> take 10 $ filter (\x -> 8 == keta x) primes
[100000007,100000037,100000039,100000049,100000073,100000081,100000123,100000127,100000193,100000213]
(30.83 secs, 53,166,741,776 bytes)

6. How man primes are there?

*Chapter02> length $ takeWhile (<1000000) primes
78498
(0.16 secs, 349,226,632 bytes)
*Chapter02> length $ takeWhile (<10000000) primes
664579
(1.92 secs, 4,266,074,224 bytes)
*Chapter02> length $ takeWhile (<100000000) primes
5761455
(26.71 secs, 50,447,123,096 bytes)

