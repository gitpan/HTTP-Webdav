
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
# $Id: copy.pl,v 1.4 2001/06/05 09:22:37 richter Exp $
#
############################################################################

#
# This this an example how to lock a resource
#

use HTTP::Webdav ;

sub auth
    {
    my ($userdata, $realm) = @_ ;
    print "auth called userdata = $userdata  realm = $realm\n" ;
    # return username, password
    return ("richter", "x") ;
    }

sub discover
    {
    my ($sess, $lock, $uri, $status) = @_ ;

    my $k ;
    my $v ;
    print "discover lock at uri = $uri :\n    " ;
    while (($k, $v) = each %$lock)
        {
        print "$k=$v " ;
        }
    print "\n    status: " ;
    while (($k, $v) = each %$status)
        {
        print "$k=$v " ;
        }

    print "\n" ;
    }



$sess = HTTP::Webdav -> new ;

$sess -> server ("www.gr.ecos.de", 8765) ;
$sess -> set_server_auth (\&auth) ;

$sess->lock({ uri => "/dav", depth => NE_DEPTH_INFINITE, scope => 0,
              type => 0,owner => "richter",timeout => 1000});

# 0 for exclusive scope  & 1 for shared scope
# 0 for write type

print "Status: ", $sess -> get_error , "\n";


$sess -> lock_discover ('/dav', \&discover) ;

print "Status: ", $sess -> get_error , "\n";
 