# 
# Building Makefile for HTTP::Webdav
#
# (C) 2001 G.Richter / ECOS
#
# $Id: Makefile.PL,v 1.5 2001/06/04 19:44:59 richter Exp $
#
 

use ExtUtils::MakeMaker;


sub error
    {
    print STDERR $_[0], "\n" ;
    exit (1) ;
    }

$pversion = 'neon 0.15.0' ;
open (C, "neon-config --version|") or error ("Cannot execute neon-config ($!). Is neon already installed on your system?") ;
chomp ($version = <C>)  or error ("Cannot execute neon-config to get version. Is neon already installed on your system?") ;
close C ;

open C, "neon-config --prefix --libs --cflags|" or error ("Cannot execute neon-config ($!). Is neon already installed on your system?") ;
chomp ($prefix = <C>) ;
chomp ($libs = <C>) ;
chomp ($cflags = <C>) ;
close C ;

print "Found $version installed under $prefix\n" ;
print STDERR "This module was made for $pversion and may not run correctly with $version\n" if ($pversion ne $version) ;


WriteMakefile
    (
    'NAME'	=> 'HTTP::Webdav',
    'VERSION_FROM' => 'Webdav.pm', # finds $VERSION
    'LIBS' => [$libs],
    'INC'  => $cflags,
    );
