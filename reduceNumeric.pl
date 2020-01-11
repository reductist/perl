#!/usr/local/bin/perl

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
my $answer = reduce(\@list, \&myReducer);
