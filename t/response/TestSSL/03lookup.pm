package TestSSL::03lookup;

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

  can_ok($r, 'ssl_lookup');

  ok(!$r->ssl_lookup('foo'),
     'non-existent ssl variable returned false');

  return Apache::OK;
}

1;
