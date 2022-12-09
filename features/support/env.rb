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
    'appium:allowTestPackages': true,
    'appium:app': "#{Dir.pwd}/builds/facebook-394-0-0-40-107.apk",
    'appium:appActivity': 'LoginActivity',
    # 'appium:appActivity': "#{$package}#{$activity}",
    'appium:appPackage': 'com.facebook.katana',
    # 'appium:appPackage': $package,
    'appium:autoGrantPermissions': true,
    'appium:automationName': 'UiAutomator2',
    # 'appium:avd': 'API_33',
    'appium:avdArgs': '-no-audio',
    'appium:avdLaunchTimeout': 600000,
    'appium:avdReadyTimeout': 600000,
    'appium:clearDeviceLogsOnStart': true,
    # 'appium:deviceName': 'Android Emulator',
    'appium:enforceAppInstall': true,
    'appium:fullReset': true,
    'appium:gpsEnabled': true,
    # 'appium:ignoreHiddenApiPolicyError': true,
    'appium:nativeWebScreenshot': true,
    'appium:newCommandTimeout': 12000,
    'appium:noSign': true,
    'appium:sendKeyStategy': 'grouped',
    'appium:systemPort': 8200,
    'appium:uiautomator2ServerLaunchTimeout': 600000,
    # 'appium:wdaLocalPort': $nightly ? 8100 + ($avd.split('-')[1].to_i * 2) : 8102,
    # normalizeTagNames: true,
    platformName: 'Android',
    waitForSelectorTimeout: 1000
  },
  appium_lib: {
    debug: false,
    log_level: 'error',
    # Set default wait timeouts and intervals
    wait: 10,
    appium_wait_timeout: 10,
    appium_wait_interval: 0.5,
    default_wait: 10
  }
}

$driver = Appium::Driver.new($desired_caps)
Appium.promote_appium_methods AppiumWorld
$driver.start_driver