
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
# $Id: delete.pl,v 1.5 2001/06/01 10:36:07 richter Exp $
#
############################################################################

#
# This this an example how to delete a resource
#

use HTTP::Webdav ;

sub auth
    {
    my ($userdata, $realm) = @_ ;

    print "auth called userdata = $userdata  realm = $realm\n" ;

    # return username, password
    return ("richter", "x") ;
    }



$sess = HTTP::Webdav -> new ;

$sess -> server ("localhost", 8765) ;
$sess -> set_server_auth (\&auth) ;

$sess -> dav_delete ("/dav/foo.htm") ;

print "Status: ", $sess -> get_error , "\n" ;

