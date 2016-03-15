# NAME

Alt::IPC::Run3::Plicease - Alternate implementation of IPC::Run3 with bugfixes

# SYNOPSIS

    env PERL_ALT_INSTALL=OVERWRITE cpanm Alt::IPC::Run3::Plicease

# DESCRIPTION

[IPC::Run3](https://metacpan.org/pod/IPC::Run3) is appears to be effectively unmaintained.  This is understandable
as there are better tools available today.  The combination of [Capture::Tiny](https://metacpan.org/pod/Capture::Tiny)
and the Perl built-in `system` for example.  However, I have old scripts and
modules that cannot be upgraded and need a properly patched version of [IPC::Run3](https://metacpan.org/pod/IPC::Run3)
on Windows, so I created this "alternate implementation" to make it easier to
install an already fixed [IPC::Run3](https://metacpan.org/pod/IPC::Run3).  Releasing to CPAN as an Alt distribution
will also allow cpantesters to give some feedback on the quality of these fixes.

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

This distribution has been forked from the original [IPC::Run3](https://metacpan.org/pod/IPC::Run3) in such
a way that it should be easy to apply these fixes to the original without
the "alt specific" portions.

# SEE ALSO

- [Alt](https://metacpan.org/pod/Alt)
- [IPC::Run3](https://metacpan.org/pod/IPC::Run3)

# AUTHOR

See [IPC::Run3](https://metacpan.org/pod/IPC::Run3) author information for the original author and 
contributors to the module.

The Alt code author is:

Graham Ollis &lt;plicease@cpan.org>

# COPYRIGHT AND LICENSE

Copyright 2003, R. Barrie Slaymaker, Jr., All Rights Reserved

You may use this module under the terms of the BSD, Artistic, or GPL licenses,
any version.
