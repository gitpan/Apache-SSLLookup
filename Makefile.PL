#!perl

use 5.008001;

use Apache2 ();
use ModPerl::MM ();
use Apache::TestMM qw(test clean);
use Apache::TestRunPerl ();

# configure tests based on incoming arguments
Apache::TestMM::filter_args();

# provide the test harness
Apache::TestRunPerl->generate_script(bugreport => <<EOF);
+-------------------------------------------------------------------+
| this module is experimental, use at your own risk                 |
+-------------------------------------------------------------------+
EOF

# now, write out the Makefile
ModPerl::MM::WriteMakefile(
  NAME          => 'Apache::SSLLookup',
  VERSION_FROM  => 'SSLLookup.pm',
  PREREQ_PM     => { mod_perl    => 1.9916 },
  TYPEMAPS      => [qw(typemap)],
);
