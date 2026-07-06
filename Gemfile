source "https://rubygems.org"

gem "fastlane"
gem "cocoapods"
gem "multi_json"

plugins_path = File.join(File.dirname(__FILE__), "fastlane", "Pluginfile")
eval_gemfile(plugins_path) if File.exist?(plugins_path)

gem "xcodeproj", "~> 1.27", git: "https://github.com/CocoaPods/Xcodeproj.git", ref: "c12d2ae619ae42f947a6b07d865f69948c752df5"
