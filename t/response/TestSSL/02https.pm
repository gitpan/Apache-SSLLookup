package TestSSL::02https;

use strict;
use warnings FATAL => qw(all);

use Apache::Test qw(-withtestmore);

use Apache::Const -compile => qw(OK);

use Apache::SSLLookup;

sub handler {

  my $r = shift;

  plan $r, tests => 3;

  $r = Apache::SSLLookup->new($r);

  isa_ok($r, 'Apache::SSLLookup');

  can_ok($r, 'is_https');

  ok(defined $r->is_https,
     'is https returned a defined value');

  return Apache::OK;
}

1;
