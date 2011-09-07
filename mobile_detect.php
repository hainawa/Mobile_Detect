<?php

class Mobile_Detect {

    public $isMobile     = false;
    public $isAndroid    = false;
    public $isIphone     = false;
    public $isBlackberry = false;
    public $isOpera      = false;
    public $isPalm       = false;
    public $isWindows    = false;
    public $isGeneric    = false;

    public function __construct() {
		$devices = array(
	        "android"       => "android",
	        "blackberry"    => "blackberry",
	        "iphone"        => "(iphone|ipod|ipad)",
	        "opera"         => "opera mini",
	        "palm"          => "(avantgo|blazer|elaine|hiptop|palm|plucker|xiino)",
	        "windows"       => "windows ce; (iemobile|ppc|smartphone)",
	        "generic"       => "(kindle|mobile|mmp|midp|o2|pda|pocket|psp|symbian|smartphone|treo|up.browser|up.link|vodafone|wap)"
	    );
        $userAgent = $_SERVER['HTTP_USER_AGENT'];
        $accept    = $_SERVER['HTTP_ACCEPT'];

        if (isset($_SERVER['HTTP_X_WAP_PROFILE']) || isset($_SERVER['HTTP_PROFILE'])) {
            $this->isMobile = true;
        } elseif (strpos($accept,'text/vnd.wap.wml') > 0 || strpos($accept,'application/vnd.wap.xhtml+xml') > 0) {
            $this->isMobile = true;
        } else {
            foreach ($devices as $device => $regexp) {
				$var = "is".ucfirst($device);
				$this->$var = (bool) preg_match("/" . $regexp . "/i", $userAgent);
                if ($this->$var) {
                    $this->isMobile = true;
                }
            }
        }
    }
}
