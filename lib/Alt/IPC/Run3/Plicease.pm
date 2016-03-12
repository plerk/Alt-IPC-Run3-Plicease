package Alt::IPC::Run3::Plicease;

use strict;
use warnings;

# VERSION

1;

__END__

=head1 NAME

Alt::IPC::Run3::Plicease - Alternate implementation of IPC::Run3 with bugfixes

=head1 SYNOPSIS

 env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::IPC::Run3::Plicease

=head1 DESCRIPTION

L<IPC::Run3> is effectively unmaintained.  This understandable, since 
there are today better alternatives.  The combination of 
L<Capture::Tiny> and the Perl built-in C<system> is probably better 
solution for your needs if you are writing new code.  However, I have 
old scripts and modules that cannot be upgraded and I need a properly 
patched version of L<IPC::Run3>, and created this "alternate 
implementation" to make it easier to install an already patched version.
Releasing it to CPAN as an Alt distribution also will allow cpantesters 
to give some feedback on the quality of these fixes.

This version includes these fixes:

=over 4

=item rt95308

Add checks to errno on Windows, so that L<IPC::Run3> can distinguish 
between a system error and a script that simply returns exit value of 
C<0xff>, as it is able to on other systems.  Also include a test that 
demonstrates the issue.

=item rt104654

No longer skip fork tests on cygwin.  C<fork> has been available on
cygwin for far too long for this to be useful anymore.

=item rt103108

Minor tweak to silence warnings during test.

=item rt52317

STDIN cannot reliably be saved.  Simply mention this in the 
documentation.

=back

This distribution also serves as an example of an Alt disttribution that 
is implemented as a (somewhat) simple L<Dist::Zilla> C<dist.ini> file on 
top of the existing non-Alt distribution in such a way that it should be 
easy to apply any or all of the changes in this version to the original 
non-Alt implementation.

=head1 SEE ALSO

=over 4

=item L<Alt>

=item L<IPC::Run3>

=back

=head1 AUTHOR

See L<IPC::Run3> author information for the original author and 
contributors to the module.

The Alt code author is:

Graham Ollis E<lt>plicease@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003, R. Barrie Slaymaker, Jr., All Rights Reserved

You may use this module under the terms of the BSD, Artistic, or GPL licenses,
any version.

=cut
