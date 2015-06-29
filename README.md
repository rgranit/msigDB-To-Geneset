# msigDB-To-Geneset
Script that converts msigDB '.gmt' files into a tab-delimited gene-set ready for use in ['Genomica'](http://genomica.weizmann.ac.il/)

Usage
--------
```
msigdbToGeneSet.pl <msigdbfile.txt> <output.txt>  
```
Input
--------

Tab delimited .txt or .gmt file downloaded from msigDB (tested on input files with entrezID, but could work with other types of IDs).

Example input:

```
TRNA_PROCESSING	http://www.broadinstitute.org/gsea/msigdb/cards/TRNA_PROCESSING	23536	51095	10667	4234	6301	16	54974
REGULATION_OF_BIOLOGICAL_QUALITY	http://www.broadinstitute.org/gsea/msigdb/cards/REGULATION_OF_BIOLOGICAL_QUALITY	10395	57679	84679	5743	5742	4358	259230
DNA_METABOLIC_PROCESS	http://www.broadinstitute.org/gsea/msigdb/cards/DNA_METABOLIC_PROCESS	7520	7518	5889	7517	7516	2547	3669

```

Output
--------

Output is a tab delimited list of genes and their 'hits' in each signature is marked by 1
```
	TRNA_PROCESSING	REGULATION_OF_BIOLOGICAL_QUALITY	DNA_METABOLIC_PROCESS
23536	1	0	0
51095	1	0	0
10667	1	0	0
4234	1	0	0
6301	1	0	0
16	1	0	0
54974	1	0	0
10395	0	1	0
57679	0	1	0
84679	0	1	0
5743	0	1	0
5742	0	1	0
4358	0	1	0
259230	0	1	0
7520	0	0	1
7518	0	0	1
5889	0	0	1
7517	0	0	1
7516	0	0	1
2547	0	0	1
3669	0	0	1
```
