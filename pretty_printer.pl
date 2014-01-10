#!/usr/bin/perl
use warnings;
use strict;

#read the whole file, split lines into columns and store them in
#separate arrays (ignore an excess of 6 columns)
#then find the largest item in each field and print them STDOUT
#print each field on a separate line, with just enough spaces
#to make the line the exact length of the longest item in that 
#column, and 1 space between each column

#intializes arrays, these store the data in each column of fstab
my @colA = ();
my @colB = ();
my @colC = ();
my @colD = ();
my @colE = ();
my @colF = ();
my @sepParts = (); #used for separating @parts

#reads the file into an array
my @lines_of_text = <STDIN>; 
my $line=0;
my $i = 0;


#this loop grabs each line and stores it in @parts
foreach $line (@lines_of_text){
	#chomp() removes newlines, which stops processing errors
	chomp($line);
	
	#splits input by ANY whitespace character
	my @parts = split(/\s+/, $line);
	print("<"."@parts".">"."\n");

	
	#now split each index of @parts into their columns, each
	#column in @parts is denoted by a " "
	
	#this adds each piece of column data to the column arrays
	push(@colA, split(/\s+/, $parts[$i]));
	push(@colB, split(/\s+/, $parts[$i+1]));
	push(@colC, split(/\s+/, $parts[$i+2]));
	push(@colD, split(/\s+/, $parts[$i+3]));
	push(@colE, split(/\s+/, $parts[$i+4]));
	push(@colF, split(/\s+/, $parts[$i+5]));
}

#there's a more concise way to do this using arrays but I ran out of time
my $lengthA = 0;
my $lengthB = 0;
my $lengthC = 0;
my $lengthD = 0;
my $lengthE = 0;
my $lengthF = 0;
my $arraySize = @colA; #grabs the size of the array for our while loop
$i = 0; #reset b/c it's used in our while
$lengthA = length($colA[$i]); 
$lengthB = length($colB[$i]); 
$lengthC = length($colC[$i]); 
$lengthD = length($colD[$i]); 
$lengthE = length($colE[$i]); 
$lengthF = length($colF[$i]); 

while($i < $arraySize-1){
	#if the length of the current element is less than the
	#length of the next, give the variable $length that next length
	if($lengthA < length($colA[$i+1])){
		$lengthA = length($colA[$i+1]);
	}
	
	my $lengthasdf = length($colB[$i+1]);
	if($lengthB < length($colB[$i+1])){
		$lengthB = length($colB[$i+1]);
	}
	
	if($lengthC < length($colC[$i+1])){
		$lengthC = length($colC[$i+1]);
	}

	if($lengthD < length($colD[$i+1])){
		$lengthD = length($colD[$i+1]);
	}
	
	if($lengthE < length($colE[$i+1])){
		$lengthE = length($colE[$i+1]);
	}
	
	if($lengthF < length($colF[$i+1])){
		$lengthF = length($colF[$i+1]);
	}

	print"\n";
	$i = $i + 1;
}


for(my $counter = 0; $counter < $i; $counter++){
#this gets the number of spaces to add to make the length
#of the longest item in colA line up with the first
	my $numSpaces = $lengthA - length($colA[$counter]);
	
	my $toPrint = $colA[$counter] . (" " x $numSpaces);
	print "$toPrint ";
	
#--------colB-----------------------------------------------
	$numSpaces = $lengthB - length($colB[$counter]);
	$toPrint = $colB[$counter] . (" " x $numSpaces);
	print "$toPrint ";

#--------colC-----------------------------------------------
	$numSpaces = $lengthC - length($colC[$counter]);
	$toPrint = $colC[$counter] . (" " x $numSpaces);
	print "$toPrint ";
	
#--------colD-----------------------------------------------
	$numSpaces = $lengthD - length($colD[$counter]);
	$toPrint = $colD[$counter] . (" " x $numSpaces);
	print "$toPrint ";
	
#--------colE-----------------------------------------------
	$numSpaces = $lengthE - length($colE[$counter]);
	$toPrint = $colE[$counter] . (" " x $numSpaces);
	print "$toPrint ";
	
#--------colF-----------------------------------------------
	$numSpaces = $lengthF - length($colF[$counter]);
	$toPrint = $colF[$counter] . (" " x $numSpaces);
	print "$toPrint \n";
}