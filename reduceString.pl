#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper qw(Dumper);

my @string_list = (
	{ text => "hello"	},
	{ text => "world"	},
	{ text => "from"	},
	{ text => "santa"	}
);
# result should be: "hello world from santa"
#print Dumper @string_list;

sub reduce{
	my (@str_list, $red) = @_;
	my $myAcc = undef;
	foreach my $hash_ref (@str_list) {
		foreach ($hash_ref->{text}) {
			if ($myAcc) {
				print $myAcc = $red->( $myAcc, $_ . ' ');
			}
			else {
				print $_ . ' ';
			}
		}
	}
	return $myAcc;
}
sub myReducer{
	my ($a, $c) = @_;
	return ($a // '') . $c;
}

my $answer = reduce(@string_list, \&myReducer);
print Dumper $answer;
