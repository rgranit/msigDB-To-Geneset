#! /usr/bin/perl -w 
# Writen by Roy Granit
# Use this script to convert msigDB files to into Genomica geneset.
# Tested on msigDB v4.0 with entrez.gmt type files

use strict;

if (@ARGV ne 2 ){
  die print "usage:  msigdbToGeneSet.pl msigdbfile.txt output.txt \n";
}

my %genes;  #holds genes ID's for each geneset 

my @annotations; #holds the names of genesets 

#parse input file
open(DATA,$ARGV[0]) or die "couldn't open file\n";
while (<DATA>){
	chomp($_);
 	s/\r//g;
  	push(my @line, (split "\t"));
  	chomp @line;
  	push (@annotations,$line[0]);
	chomp @annotations;
	for(my $j=2; $j <= $#line; $j++){
		my $geneID=$line[$j];
		$genes{ $geneID }{ $line[0]} = "1" ;
	

	}
	chomp %genes;

}
close(DATA);


#Write the output file
open (MOUT, ">$ARGV[1]") or die $!;
  print MOUT "\t";
  foreach (@annotations){
  print MOUT $_."\t";
    }
	print MOUT "\n";
	foreach my $id (keys %genes) {
		
		print MOUT $id."\t";
			my %line1 = %{$genes{$id}};
			for(my $i=0; $i <= $#annotations; $i++){
					my $found=0;
					 if(exists $line1{$annotations[$i]}){
							$found=1;
						}
						if ($annotations[$i] eq ""){next;};
					print MOUT $found."\t";
				}
					print MOUT "\n";	
		}
			
	
	
close MOUT; 
print "Done!\n";
