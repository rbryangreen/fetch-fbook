require 'appium_lib'
require 'json'
require 'rubygems'
require 'rspec'
require 'rspec/expectations'
require 'selenium-cucumber'

class AppiumWorld
end

World do
  AppiumWorld.new
end

$desired_caps = {
  caps: {
    'appium:adbExecTimeout': 30000,
    'appium:appWaitDuration': 40000,
    'appium:app': "#{Dir.pwd}/builds/facebook-394-0-0-40-107.apk",
    'appium:appActivity': 'LoginActivity',
    'appium:appPackage': 'com.facebook.katana',
    'appium:autoGrantPermissions': true,
    'appium:automationName': 'UiAutomator2',
    'appium:avdLaunchTimeout': 600000,
    'appium:avdReadyTimeout': 600000,
    'appium:clearDeviceLogsOnStart': true,
    'appium:fullReset': true,
    'appium:gpsEnabled': true,
    'appium:newCommandTimeout': 12000,
    'appium:systemPort': 8200,
    'appium:uiautomator2ServerLaunchTimeout': 600000,
    platformName: 'Android',
    waitForSelectorTimeout: 1000
  },
  appium_lib: {
    debug: false,
    log_level: 'error',
    # Set default wait timeouts and intervals
    wait: 30,
    appium_wait_timeout: 30,
    appium_wait_interval: 0.5,
    default_wait: 30
  }
}

$driver = Appium::Driver.new($desired_caps)
Appium.promote_appium_methods AppiumWorld
$driver.start_driver