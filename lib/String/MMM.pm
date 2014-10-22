package String::MMM;

use 5.014000;
use strict;
use warnings;

use base 'Exporter';

# This allows declaration	use String::MMM ':all';
our %EXPORT_TAGS = ( 'all' => [ qw(
				    match_strings  match_strings_a match_arrays
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

use version; our $VERSION = qv("v0.0.1");  #First release

require XSLoader;
XSLoader::load('String::MMM', $VERSION);

# Preloaded methods go here.

'ABCD';
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

String::MMM - Perl XS for comparing (matching) strings MasterMind style

=head1 SYNOPSIS

  use String::MMM qw(:all);
  my @result = match_strings( 'AAAA', 'ABCD', 6 ); # 6 is alphabet size;
  # $result[0] contains number of blacks, $result[1] whites
  @result = match_strings_a( 'abcd', 'efgh' ); # alphabet size = 26;
  # should return 0,0
  @result = match_arrays( [ 0,3,2,1], [0,0,1,2], 10 );

=head1 DESCRIPTION

String comparison is a critical operation in MasterMind, and the
fastest Perl implementation is not fast enough. This implementation
can be up to an order of magnitude faster (depending on string size,
of course).

=head1 INTERFACE

=head2 match_strings ( $hidden, $target, $colors )

Matches 'A'-based strings (from 'A....A' to
'chr($colors)...chr($colors)', with an alphabet of size
$colors. Returns an array with the number of blacks and whites as
first and second element. Length is not checked; comparison is done
over the length of $hidden. 

=head2 match_strings_a ( $hidden, $target )

Same as above, with lowercase letters. Besides, $colors is assumed to
be 26.

=head2 match_arrays ( $ref_to_hidden_array, $ref_to_hidden_target,
$colors ) 

Same as above, with integer numbers. Just in case you need more than
26 symbols. 

=head1 SEE ALSO

This module is used in some algorithms in L<Algorithm::MasterMind>. 

=head1 DEPENDENCIES

Needs a C compiler to install 

=head1 AUTHOR

Juan J. Merelo Guervós, E<lt>jjmerelo@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Juan J. Merelo Guervós

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.16.0 or,
at your option, any later version of Perl 5 you may have available.

=cut
