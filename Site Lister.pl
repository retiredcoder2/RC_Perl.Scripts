#!/usr/bin/perl 
#################################### 
# (C)oded by h4ckinger 
# Hackinger's Web Page: www.hackinger.org 
# plz send e-mail me when u find a bug in this script 
# mail:hackingerboy@gmail.com 
# server site lister v0.1 
# Private Tool 
# greatz ; 
# Darkcode,CyberGhost,excellance,redLine,The_BeKiR 
# and All my Friends... 
#################################### 
use LWP::UserAgent; 
$xpl = LWP::UserAgent->new( ) or die; 


my $OperatingSystem = $^O; 
my $unix = ""; 
if (index(lc($OperatingSystem),"win")!=-1){ 
$unix="0"; #windows system 
}else{ 
$unix="1"; #unix system 
} 
if($unix){ 
system("clear"); 
} 
else{system("cls");} 
$site=$ARGV[0]; 
if(!$site){&usage} 
$res = $xpl->get("http://hackinger.org/tool/whois.php?ip=$site", 'USER_AGENT'=>"hackozilla"); 
if($res->is_success) { 
$content=$res->content; 
$content=~s/<title>Coded by h4ckinger-ghost_boy<\/title>//; 
print "h4ckinger's Server Site Lister\n(C)oded by h4ckinger - ghost_boy\n\n---------------------------------------\n"; 
$content=~s/<br>/\n/g; 

print "$content---------------------------------------"; 

} 


sub usage{ 
if($unix){ 
system("clear"); 
} 
else{system("cls");} 
print q[ 
============================================================ =========== 
h4ckinger's Server Site Lister 
(C)oded by h4ckinger - ghost_boy 
www.hackinger.org 
usage: list.pl <site> 
example: list.pl hackinger.org 
============================================================ =========== 
]; 
exit; 
}