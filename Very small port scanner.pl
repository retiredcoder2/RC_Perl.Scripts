#!/usr/bin/perl
use IO::Socket::INET;
if (!defined($ARGV[2])) {
print 'usage: <target> <low> <high>';}
for ($x=$ARGV[1];$x<$ARGV[2]+1;$x++){
if (fork()){if ($sock = new IO::Socket::INET(
PeerAddr=>$ARGV[0],PeerPort=>$x,Proto=>'tcp'))
{ print"$x\tOPEN\n";}else{print"$x\tCLOSED\n";}
close($sock);exit;}} 