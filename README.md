README.md 

This script is able to process a fastq file where the second line in a group of 4 contains a 
given sequence. First the script counts the number of each base across all sequences.
Next it will count the number of each pair of bases (described as kmers of size 2). Then
it will count the number of each pair of bases, without assuming you know in advance the possible pairs.
Finally the function allows you to count kmers of any size. 

