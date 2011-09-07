#Simple mobile detection scripts
Always looking for contributions. Did we miss-sniff a user agent? Let us know!

##license
http://www.opensource.org/licenses/mit-license.php The MIT License

##PHP usage

instantiate like so:
	$mobileDetect = new Mobile_Detect();

checks for truthiness
	if ($mobileDetect->isAndroid) { do some stuff... }
	
##Ruby usage

instantiate like so:
	mobileDetect = MobileDetect.new(request)

checks for truthiness
	if mobileDetect.isIphone { do some stuff... }