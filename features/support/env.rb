require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)

HEADLESS = ENV['HEADLESS']

Capybara.register_driver :selenium do |app|

if HEADLESS.eql?('sem_headless')
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {'args' =>['--disable-infobars',
                                      'window-size=1600,1024']}
    )
  )
elsif HEADLESS.eql?('com_headless')
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
          'chromeOptions' => {'args' =>['headless', 'disable-gpu',
                                        '--disable-infobars',
                                        'window-size=1600,1024']}
      )
)
end
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 10
    config.app_host = 'https://www.groupon.com.br/login'
end