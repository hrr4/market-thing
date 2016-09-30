use strict;
use warnings;
use Finance::Quote;
use LWP::UserAgent;
use Data::Dumper;

my $q = Finance::Quote->new;
$q->set_currency("USD");
$q->require_labels(qw/price date time high low volume/);

sub Get_Quote {
    return $q->fetch("nasdaq", @_);
}

my @stocks = ("NXPI");
my %quotes = Get_Quote(@stocks);

#print Dumper(\%quote);

# What do we want out of this?
foreach my $stock (@stocks) {
    my $test = "$stock" . "_price";

    my $price = $quotes{$test};

    print qq($stock\n\tPrice: $price\n);
}
