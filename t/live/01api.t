use strict;
use warnings FATAL => qw(all);

use Apache::Test;
use Apache::TestRequest;

my $config = Apache::Test::config();
my $ssl_module = $config->{vars}->{ssl_module_name};
my $hostport = $config->{vhosts}->{$ssl_module}->{hostport};
my $url = "https://$hostport/TestLive__01api/";

print GET_BODY_ASSERT $url;

