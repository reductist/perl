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
			if (defined $myAcc) {
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
#╭─pvr@thoth ~/perl_scripts  ‹master›
#╰─➤  ./reduceString.pl
#Not a HASH reference at ./reduceString.pl line 19.
#hello world from santa %

# ... I have a feeling the issue is that I'm not assigning $myAcc in the else{} branch, but I've tried:
# - switching the if/else
# - moving the if (!defined $myAcc) { ... } between the two foreach's
# - various alternative dereferencing syntaxes
# ... but only made things worse. Not sure how to eliminate the error and the '%' at the end of $answer
