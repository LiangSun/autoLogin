Given(/^I turn on the "([^"]*)" and login$/) do |arg|

  url = "https://developer.salesforce.com/trailhead"

  if arg.downcase == "firefox"

    $browser = Watir::Browser.start url, :firefox
    # $browser.window.maximize
    _home_page = $web_app.wait_for_screen(HomeScreen)


    # _home_page.login_as("sandeep@trailhead.test", "test4321")
    # _home_page.login_as("mmoller-org@developerforce.com.mmoller", "salesforce1")
    #_home_page.login_as("lorenzof-org@developerforce.com.lfernandez", "Salesforce1!")

    _home_page.login_as("all.finished@trailhead.com", "test1234")



  elsif arg.downcase == "chrome"
    $browser = Watir::Browser.start url, :chrome
    $browser.window.maximize
    _home_page = $web_app.wait_for_screen(HomeScreen)


    # _home_page.login_as("sandeep@trailhead.test", "test4321")
    # _home_page.login_as("mmoller-org@developerforce.com.mmoller", "salesforce1")
    # _home_page.login_as("lorenzof-org@developerforce.com.lfernandez", "Salesforce1!")

    _home_page.login_as("trailhead2@automation.test", "salesforce1")


  # elsif arg.downcase! == "chrome"
  #   $browser = Watir::Browser.start url, :chrome
  end



end