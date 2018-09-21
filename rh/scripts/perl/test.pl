#!/usr/bin/perl
use strict;
use warnings;

print "perl print test\n";
my $echoVar = system("echo","shell system call test");
my $uptickVar = `cat /opt/rh/endpoints.conf`;
print $uptickVar;
print "\n";
print $echoVar;

print "\n\n---\n\n";

print `sh /opt/rh/getRequest.sh $rhURL $authHeader`;
