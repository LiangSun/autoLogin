require 'rubygems'
require 'watir-webdriver'

class WebApp < AppBase

  def initialize
  end


  def launch_the_app(url)
    log("   launching app from #{url}")
    $browser = Watir::Browser.start url, :chrome
    $browser.window.maximize

    #return screen(WelcomeScreen).await
  end


  def wait_for_screen(screen_cls)
    screen_obj = nil
    begin
      screen_obj = screen_cls.new().await()
      log("on #{screen_cls.name} now")
    rescue
      fail("the app is not on #{screen_cls.name} !")
    end

    return screen_obj
  end

  def log(msg, cls=nil)
    time_stamp = Time.now.strftime("%H:%M:%S")
    if cls.nil?
      print "      [#{time_stamp}] #{msg}\n"
    else
      print "      [#{time_stamp}]    #{cls.class.name}: #{msg}\n"
    end
  end


  def testini(classname)
    printf("testaaa")
    screen_obj = classname.new().await()

    return screen_obj
  end

end