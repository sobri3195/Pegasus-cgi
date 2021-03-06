#!/usr/bin/perl
################################################################
#                                                       	   #
# CGI scanner by Pegasus				                	   #
#  	   														   #
# Muhammad Sobri Maulana                                       #
# Don't change my copyright motherfucker   					   #
#                                           			       #
################################################################

use Socket;

@cgi_scripts = ("GET /cgi-bin/unlg1.1 HTTP/1.0\n\n","GET /cgi-bin/rwwwshell.pl HTTP/1.0\n\n",
"GET /cgi-bin/phf HTTP/1.0\n\n","GET /cgi-bin/Count.cgi HTTP/1.0\n\n",
"GET /cgi-bin/test-cgi HTTP/1.0\n\n","GET /cgi-bin/nph-test-cgi HTTP/1.0\n\n",
"GET /cgi-bin/nph-publish HTTP/1.0\n\n","GET /cgi-bin/php.cgi HTTP/1.0\n\n",
"GET /cgi-bin/handler HTTP/1.0\n\n","GET /cgi-bin/webgais HTTP/1.0\n\n",
"GET /cgi-bin/websendmail HTTP/1.0\n\n","GET /cgi-bin/webdist.cgi HTTP/1.0\n\n",
"GET /cgi-bin/faxsurvey HTTP/1.0\n\n","GET /cgi-bin/htmlscript HTTP/1.0\n\n",
"GET /cgi-bin/pfdispaly.cgi HTTP/1.0\n\n","GET /cgi-bin/perl.exe HTTP/1.0\n\n",
"GET /cgi-bin/wwwboard.pl HTTP/1.0\n\n","GET /cgi-bin/www-sql HTTP/1.0\n\n",
"GET /cgi-bin/view-source HTTP/1.0\n\n","GET /cgi-bin/campas HTTP/1.0\n\n",
"GET /cgi-bin/aglimpse HTTP/1.0\n\n","GET /cgi-bin/glimpse HTTP/1.0\n\n",
"GET /cgi-bin/man.sh HTTP/1.0\n\n","GET /cgi-bin/AT-admin.cgi HTTP/1.0\n\n",
"GET /cgi-bin/filemail.pl HTTP/1.0\n\n","GET /cgi-bin/maillist.pl HTTP/1.0\n\n",
"GET /cgi-bin/jj HTTP/1.0\n\n","GET /cgi-bin/info2www HTTP/1.0\n\n",
"GET /cgi-bin/files.pl HTTP/1.0\n\n","GET /cgi-bin/finger HTTP/1.0\n\n",
"GET /cgi-bin/bnbform.cgi HTTP/1.0\n\n","GET /cgi-bin/survey.cgi HTTP/1.0\n\n",
"GET /cgi-bin/AnyForm2 HTTP/1.0\n\n","GET /cgi-bin/textcounter.pl HTTP/1.0\n\n",
"GET /cgi-bin/classifieds.cgi HTTP/1.0\n\n","GET /cgi-bin/environ.cgi HTTP/1.0\n\n",
"GET /cgi-bin/wrap HTTP/1.0\n\n","GET /cgi-bin/cgiwrap HTTP/1.0\n\n",
"GET /cgi-bin/guestbook.cgi HTTP/1.0\n\n","GET /cgi-bin/edit.pl HTTP/1.0\n\n",
"GET /cgi-bin/perlshop.cgi HTTP/1.0\n\n","GET /cgi-bin/anyboard.cgi HTTP/1.0\n\n",
"GET /cgi-bin/webbbs.cgi HTTP/1.0\n\n","GET /cgi-bin/environ.cgi HTTP/1.0\n\n",
"GET /cgi-bin/whois_raw.cgi HTTP/1.0\n\n","GET /_vti_inf.html HTTP/1.0\n\n",
"GET /_vti_pvt/service.pwd HTTP/1.0\n\n","GET /_vti_pvt/users.pwd HTTP/1.0\n\n",
"GET /_vti_pvt/authors.pwd HTTP/1.0\n\n","GET /_vti_pvt/administrators.pwd HTTP/1.0\n\n",
"GET /_vti_bin/shtml.dll HTTP/1.0\n\n","GET /_vti_bin/shtml.exe HTTP/1.0\n\n",
"GET /cgi-dos/args.bat HTTP/1.0\n\n","GET /cgi-win/uploader.exe HTTP/1.0\n\n",
"GET /cgi-bin/rguest.exe HTTP/1.0\n\n","GET /cgi-bin/wguest.exe HTTP/1.0\n\n",
"GET /scripts/issadmin/bdir.htr HTTP/1.0\n\n","GET /scripts/CGImail.exe HTTP/1.0\n\n",
"GET /scripts/tools/newdsn.exe HTTP/1.0\n\n","GET /scripts/fpcount.exe HTTP/1.0\n\n",
"GET /scripts/counter.exe HTTP/1.0\n\n","GET /cgi-bin/visadmin.exe HTTP/1.0\n\n",
"GET /cfdocs/expelval/openfile.cfm HTTP/1.0\n\n","GET /cfdocs/expelval/exprcalc.cfm HTTP/1.0\n\n",
"GET /cfdocs/expelval/displayopenedfile.cfm HTTP/1.0\n\n","GET /cfdocs/expelval/sendmail.cfm HTTP/1.0\n\n",
"GET /iissamples/exair/howitworks/codebrws.asp HTTP/1.0\n\n","GET /iissamples/sdk/asp/docs/codebrws.asp HTTP/1.0\n\n",
"GET /msads/Samples/SELECTOR/showcode.asp HTTP/1.0\n\n","GET /search97.vts HTTP/1.0\n\n",
"GET /carbo.dll HTTP/1.0\n\n");

@cgi_names = ("UnlG - backdoor ","THC - backdoor  ",
"phf             ","Count.cgi       ","test-cgi        ","nph-test-cgi    ",
"nph-publish     ","php.cgi         ","handler         ","webgais         ",
"websendmail     ","webdist.cgi     ","faxsurvey       ","htmlscript      ",
"pfdisplay       ","perl.exe        ","wwwboard.pl     ","www-sql         ",
"view-source     ","campas          ","aglimpse        ","glimpse         ",
"man.sh          ","AT-admin.cgi    ","filemail.pl     ","maillist.pl     ",
"jj              ","info2www        ","files.pl        ","finger          ",
"bnbform.cgi     ","survey.cgi      ","AnyForm2        ","textcounter.pl  ",
"classifields.cgi","environ.cgi     ","wrap            ","cgiwrap         ",
"guestbook.cgi   ","edit.pl         ","perlshop.cgi    ","anyboard.cgi    ",
"webbbs.cgi      ","environ.cgi     ","whois_raw.cgi   ","_vti_inf.html   ",
"service.pwd     ","users.pwd       ","authors.pwd     ","administrators  ",
"shtml.dll       ","shtml.exe       ","args.bat        ","uploader.exe    ",
"rguest.exe      ","wguest.exe      ","bdir - samples  ","CGImail.exe     ",
"newdsn.exe      ","fpcount.exe     ","counter.exe     ","visadmin.exe    ",
"openfile.cfm    ","exprcalc.cfm    ","dispopenedfile  ","sendmail.cfm    ",
"codebrws.asp    ","codebrws.asp 2  ","showcode.asp    ","search97.vts    ",
"carbo.dll       ");


print "Scan CGI by Pegasus\n\n";
print "Host: ";
chomp($remote=<STDIN>);

print "HTTP [80]: ";
chomp($port=<STDIN>);

if($port eq "")
{
	$port=80;
}

print "Using log?(y/n)";
$yn=<STDIN>;

if($yn =~ /y/i)
{ 
	$log = 1; 
	$logfile="$remote".".scan";

	print "Using log[$logfile]: ";
	$file=<STDIN>;
	chop($file) if $file =~ /\n$/;

	if($file ne "") 
	{
		$logfile=$file;
	}
	open(LOG,">>$logfile") || die("Not$logfile!");
	print LOG "Scanning $remote port $port\n\n";
}

print "Press [enter] checking version http...\n";
$blah=<STDIN>;

$submit = "HEAD / HTTP/1.0\r\n\r\n";
if($port =~ /\D/) { $port = getservbyname($port, 'tcp') }
&error("Port Not Specified.") unless $port;
$iaddr = inet_aton($remote) || &error("
Fail to find the Host: $remote");
$paddr = sockaddr_in($port, $iaddr) || &error("Its stop!");
$proto = getprotobyname('tcp') || &error("Impossible to go by protocall!");

socket(SOCK, PF_INET, SOCK_STREAM, $proto) || &error("Failure to open the socket: $!");
connect(SOCK, $paddr) || &error("Can not connect: $!");
send(SOCK,$submit,0);
while(<SOCK>)
{
	print $_;
	print LOG $_ if $log==1;
}
close(SOCK);

print "Press [enter] to check vulnerabilities in CGI...\n";
$blah=<STDIN>;

$i=0;

foreach $cgi_script(@cgi_scripts)
{
	print "Searching for @cgi_names[$i] : ";
	print LOG "Searching for @cgi_names[$i] : " if $log==1;
	$submit=$cgi_script;
	&connect_n_check;
	$i++;
}

if($bad_security>0)
{
	print "This Server has many vulnerabilities.\n";
	print LOG "This Server has many vulnerabilities.\n\n" if $log==1;
}
else
{
	print "No vulnerabilities were found.\n";
	print LOG "No vulnerability of any CGI.\n\n" if $log==1;
}
close(LOG) if $log==1;
exit;

sub connect_n_check
{
	if($port =~ /\D/) { $port = getservbyname($port, 'tcp') }
	&error("No port specified.") unless $port;
	$iaddr = inet_aton($remote) || &error("Failed to find host: $remote");
	$paddr = sockaddr_in($port, $iaddr) || &error("Some fucking thing!");
	$proto = getprotobyname('tcp') || &error("Unable to get protocall!");

        socket(SOCK, PF_INET, SOCK_STREAM, $proto) || &error("Failed to open socket: $!");
	connect(SOCK, $paddr) || &error("Can not connect: $!");
	send(SOCK,$submit,0);

	$check=<SOCK>;
	($http,$code,$blah) = split(/ /,$check);
	if($code == 200)
	{
		print "Found!\n";
		print LOG "Found!\n" if $log==1;
		$bad_security++;
	}
	else
	{
		print "It was not found\n";
		print LOG "It was not found\n" if $log==1;
	}
	close(SOCK);
}

sub error
{
$error = shift(@_);
	print "Error - $error\n";
	print LOG "Error - $error\n\n" if $log==1;
	close(LOG) if $log==1;
	exit;
}                                                    