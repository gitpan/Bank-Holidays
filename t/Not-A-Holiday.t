# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Bank-Holidays.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 5 };
use Bank::Holidays;
use DateTime;
ok(1); # If we made it this far, we're ok.

ok($curr = DateTime->now());
# Check any old day is not a holiday;

ok(my $bank = Bank::Holidays->new( dt => DateTime->new(month => 9, day => 30, year => $curr->year)));
ok($bank->is_holiday ? 0 : 1);

# Check the tomorrow parameter. Returns no.

ok ($bank->is_holiday(Tomorrow => 1) ? 0 : 1);
