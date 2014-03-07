# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'motion-testflight'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  env = if ENV['adhoc'] == '1'
          'adhoc'
        else
          'dev'
        end
  app.name = 'Hoppy Rudy'
  app.frameworks += ["SpriteKit"]
  app.delegate_class = 'EFCAppDelegate'

  if env == 'adhoc'
  	app.identifier = 'com.alldigitalshop.hoppyrudy'
  	app.codesign_certificate = 'iPhone Distribution: Jeff Krantz (J2H4HN4995)'
  	app.provisioning_profile = 'Desktop/RubyBird/Profile_4.mobileprovision'
  	app.entitlements['get-task-allow'] = false
  else
  	app.identifier = 'com.alldigitalshop.hoppyrudy'
  	app.codesign_certificate = 'iPhone Distribution: Jeff Krantz (J2H4HN4995)'
  	app.provisioning_profile = 'Profile_4.mobileprovision'
  end

  #testflight config
  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = 'caa43ad2ec311b17dc829553314445ea_MTQyNDE5ODIwMTMtMTEtMDUgMTk6MDM6MTYuOTY1NDg1'
  app.testflight.team_token = '5ecab6ee35a10655399dfc815bd118a5_Mjk5MDk3MjAxMy0xMS0xMiAyMDowNTowOS44OTUwOTI'
  # Use `rake config' to see complete project settings.
  
end

desc "Set the env to 'adhoc'"
task :set_adhoc do
  ENV['adhoc'] = '1'
end

desc "Run Testflight with the adhoc provisioning profile"
# e.g. rake tf notes="My release notes"
task :tf => [
  :set_adhoc,
  :testflight
]
