
############################################################################
#
# HTTP::Webdav - Perl interface to Neon HTTP and WebDAV client library
#
# Copyright (c) 2001 Gerald Richter / ecos gmbh (www.ecos.de)
# 
# You may distribute under the terms of either the GNU General Public 
# License or the Artistic License, as specified in the Perl README file.
# 
# THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
# WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
# MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
# $Id: Webdav.pm,v 1.13 2001/06/11 04:09:46 richter Exp $
#
############################################################################


package HTTP::Webdav ;

use strict;
use vars qw($VERSION @ISA $initdone);


require Exporter;

$VERSION = "0.1.14-0.15.1";

require DynaLoader;

@ISA = qw(DynaLoader);

bootstrap HTTP::Webdav $VERSION;

sub new 
    {
    my $class = shift;
    my %options = @_;

    if (!$initdone)
        {
        HTTP::Webdav::Util::sock_init () ;
        $initdone++ ;
        }


    my $sess = HTTP::Webdav::Util::session_create () ;

    return $sess;
    }

1;

