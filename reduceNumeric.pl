#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper qw(Dumper);

sub reduce{
	my($list, $red) = @_;
	my $myAcc = undef;
	foreach my $item ( @$list ) {
		print "item: $item\n";
		print $myAcc = $red->( $myAcc, $item ), "\n";
	}
	return $myAcc;
}
sub myReducer{
	my ($a, $c) = @_;
	return ($a //0) + $c;
}

my @list = @ARGV;
my $answer = reduce(\@list, \&myReducer);
print Dumper $answer;
