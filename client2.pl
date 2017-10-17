use IO::Socket::INET;

$| =1;

# create a connecting socket
 my $socket = new  IO::Socket::INET(
	 PeerHost => '192.168.195.134',
	 PeerPort => '7777',
	 Proto => 'tcp',
 );
 die "cannot connect to the server $!\n" unless $socket ;
 print "connected to the server\n";

 my $req = 'Hello Sir Hamid';
 my $size = $socket->send($req);
 print "sent data of length $size\n";

 shutdown($socket,1);

 my $response ="";
 $socket->recv($response,1024);
 print "received response : $response\n";

 $socket->close();

