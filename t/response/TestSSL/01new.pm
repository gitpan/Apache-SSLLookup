package TestSSL::01new;

use strict;
use warnings FATAL => qw(all);

use Apache::Test qw(-withtestmore);

use Apache::Const -compile => qw(OK);

use Apache::SSLLookup;

sub handler {

  my $r = shift;

  plan $r, tests => 2;

  $r = Apache::SSLLookup->new($r);

  isa_ok($r, 'Apache::SSLLookup');

  can_ok($r, 'new');

  return Apache::OK;
}

1;
