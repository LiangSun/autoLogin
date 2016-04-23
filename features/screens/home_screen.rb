class HomeScreen < AppBase



  def await(opts = nil)


    sleep(3)
    self
  end

  def verify_UI

    #search and login
    search_container = $browser.element(:id => "search-social-container").exists?
    login_button = $browser.element(:id => "login-button").exists?
    signup_button = $browser.a(:xpath, "//a[@class='btn btn-success']").exists?

    #navbar
    navbar = $browser.div(:class, "navbar navbar-static-top navbar-inverse trailhead-nav")
    home_navbar = navbar.a(:text, "Home").exists?
    trails_navbar = navbar.a(:text, "Trails").exists?
    modules_navbar = navbar.a(:text, "Modules").exists?
    projects_navbar = navbar.a(:text, "Projects").exists?

    #video
    trailhead_video = $browser.div(:class, "span6 traihead-home-hero-video").exists?

    #logo
    trailhead_logo = $browser.img(:class, "trailhead-hero-logo").exists?
    trailhead_logo_height = 120
    trailhead_logo_width = 140

    #title
    trailhead_title = $browser.h3(:text, "the fun way to learn Salesforce").exists?

    #description
    trailhead_description = $browser.p(:text, "Everyone can learn Salesforce. Whether you are an admin, user, or developer, there is a trail for you.").exists?

    #trailhead_home_tab
    trailhead_home_tab = $browser.ul(:class, "inline trailhead-home-tab")
    trailhead_home_tab_items = trailhead_home_tab.text.include?("Trails") && trailhead_home_tab.text.include?("Modules") && trailhead_home_tab.text.include?("Projects")

    #trailhead_home_panel_title
    trailhead_home_panel_title = $browser.h3(:text, "Follow a guided learning path").exists?

    #trailhead_home_panel_description
    trailhead_home_panel_description = $browser.text.include?("Trails take the guesswork out of where to begin and where to go next to make your journey easier.")

    if !search_container
      return false
    end

    if !home_navbar || !trails_navbar || !modules_navbar || !projects_navbar
      return false
    end

    if !trailhead_video || !trailhead_logo || !trailhead_title || !trailhead_description
      return false
    end

    if !trailhead_home_tab_items
      return false
    end

    return true

  end

  # def await(opts = nil)
  #   until check_all_ui
  #     sleep 1
  #   end
  # end

  def check_cards_order(trails_modules_project)
    cards = get_cards(trails_modules_project)
    titles = cards.map{|element| element.text}
    reorder_title = titles.sort_by(&:downcase)

    # check if cards are sorted alphabetically
    if reorder_title.eql?(titles)
      return true
    else
      puts "orders are wrong"
      return false
    end
  end

  def login_as(username, password)
    $browser.button(:id, "login-button").click
    Watir::Wait.until{$browser.div(:class, "btn login-wizard-login pull-left").visible?}
    $browser.div(:class, "btn login-wizard-login pull-left").click
    Watir::Wait.until{$browser.input(:id, "username").exists?}
    sleep 1
    $browser.text_field(:id, "username").set username
    $browser.text_field(:id, "password").set password
    $browser.input(:id, "Login").click


  end

  def get_cards_num(card_types)
    return get_cards(card_types).count
  end

  def get_cards(card_types)
    if card_types == "Trails"
      $browser.i(:class, "icon-trail pull-left").click
      root = $browser.div(:class, "row trailhead-home-grid-container trailhead-home-grid-container-trails")
    elsif card_types == "Modules"
      $browser.i(:class, "icon-module pull-left").click
      root = $browser.div(:class, "row trailhead-home-grid-container trailhead-home-grid-container-modules")
    elsif card_types == "Projects"
      $browser.i(:class, "icon-project pull-left").click
      root = $browser.div(:class, "row trailhead-home-grid-container trailhead-home-grid-container-projects")
    else
      # report error here. None item has been selected
    end

    cards = root.elements(:xpath, "//a[@class='trailhead-item-title']").select{|element| element.visible?}

    return cards
  end





end