# NAME

Alt::IPC::Run3::Plicease - Alternate implementation of IPC::Run3 with bugfixes

# SYNOPSIS

    env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::IPC::Run3::Plicease

# DESCRIPTION

[IPC::Run3](https://metacpan.org/pod/IPC::Run3) is effectively unmaintained.  This understandable, since 
there are today better alternatives.  The combination of 
[Capture::Tiny](https://metacpan.org/pod/Capture::Tiny) and the Perl built-in `system` is probably better 
solution for your needs if you are writing new code.  However, I have 
old scripts and modules that cannot be upgraded and I need a properly 
patched version of [IPC::Run3](https://metacpan.org/pod/IPC::Run3), and created this "alternate 
implementation" to make it easier to install an already patched version.
Releasing it to CPAN as an Alt distribution also will allow cpantesters 
to give some feedback on the quality of these fixes.

This version includes these fixes:

- rt95308

    Add checks to errno on Windows, so that [IPC::Run3](https://metacpan.org/pod/IPC::Run3) can distinguish 
    between a system error and a script that simply returns exit value of 
    `0xff`, as it is able to on other systems.  Also include a test that 
    demonstrates the issue.

- rt104654

    No longer skip fork tests on cygwin.  `fork` has been available on
    cygwin for far too long for this to be useful anymore.

- rt103108

    Minor tweak to silence warnings during test.

- rt52317

    STDIN cannot reliably be saved.  Simply mention this in the 
    documentation.

This distribution also serves as an example of an Alt disttribution that 
is implemented as a (somewhat) simple [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) `dist.ini` file on 
top of the existing non-Alt distribution in such a way that it should be 
easy to apply any or all of the changes in this version to the original 
non-Alt implementation.

# SEE ALSO

- [Alt](https://metacpan.org/pod/Alt)
- [IPC::Run3](https://metacpan.org/pod/IPC::Run3)

# AUTHOR

See [IPC::Run3](https://metacpan.org/pod/IPC::Run3) author information for the original author and 
contributors to the module.

The Alt code author is:

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

Copyright 2003, R. Barrie Slaymaker, Jr., All Rights Reserved

You may use this module under the terms of the BSD, Artistic, or GPL licenses,
any version.
