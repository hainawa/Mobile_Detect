class MobileDetect
  
  attr_accessor :isMobile, :isAndroid, :isIphone, :isBlackberry, :isOpera, :isPalm, :isWindows, :isGeneric
  
  @isMobile     = false;
  @isAndroid    = false;
  @isIphone     = false;
  @isBlackberry = false;
  @isOpera      = false;
  @isPalm       = false;
  @isWindows    = false;
  @isGeneric    = false;

 def initialize(request)
   devices = {
     "android"     => "android",
     "blackberry"  => "blackberry",
     "iphone"      => "(iphone|ipod|ipad)",
     "opera"       => "opera mini",
     "palm"        => "(avantgo|blazer|elaine|hiptop|palm|plucker|xiino)",
     "windows"     => "windows ce; (iemobile|ppc|smartphone)",
     "generic"     => "(kindle|mobile|mmp|midp|o2|pda|pocket|psp|symbian|smartphone|treo|up.browser|up.link|vodafone|wap)"
   }
   
   userAgent = request.env['HTTP_USER_AGENT'].to_s.downcase
   accept = request.env['HTTP_ACCEPT'].to_s.downcase
   
   if request.env.key?('HTTP_X_WAP_PROFILE') || request.env.key?('HTTP_PROFILE')
     @isMobile = true
   elsif accept.index('text/vnd.wap.wml').to_i > 0 || accept.index('application/vnd.wap.xhtml+xml').to_i > 0
     @isMobile = true
   else
     devices.each do |device, regex| 
        var = "is#{device.capitalize}"
        self.send (var+"=").to_sym, !!userAgent.match(regex)
        # self.var = userAgent.match(regex)
        if self.send var.to_sym
          @isMobile = true 
        end
     end
   end

 end

end