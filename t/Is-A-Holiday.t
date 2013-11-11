# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Bank-Holidays.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 6 };
use Bank::Holidays;
use DateTime;

ok(1); # If we made it this far, we're ok.
ok($curr = DateTime->now());

# Test simple check, when it is a holiday.

ok($bank = Bank::Holidays->new(dt => DateTime->new(month => 12, day => 25, year => $curr->year)));
ok($bank->is_holiday ? 1 : 0);

# Test the Tomorrow parameter.
ok($bank = Bank::Holidays->new(dt => DateTime->new(month => 12, day => 24, year => $curr->year)));
ok($bank->is_holiday(Tomorrow => 1) ? 1 : 0);
