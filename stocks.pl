use strict;
use warnings;
use Finance::Quote;
use LWP::UserAgent;
use Data::Dumper;

my @stocks = ("NXPI", "DIS");

if ($#ARGV >= 0) {
    @stocks = @ARGV;
}

my $q = Finance::Quote->new;
$q->set_currency("USD");
$q->require_labels(qw/price date time high low p_change/);


sub Get_Quote {
    return $q->fetch("nyse", @_);
}

my %quotes = Get_Quote(@stocks);

print Dumper(\%quotes);

# What do we want out of this?
foreach my $stock (@stocks) {
    my $price = $quotes{$stock, "price"};
    my $pchange = $quotes{$stock, "p_change"};
    my $date = $quotes{$stock, "date"};
    my $time = $quotes{$stock, "time"};

    print qq($stock\n\tPrice: $price\n\t%Change: $pchange\n\tDateTime: $time, $date\n);
}
