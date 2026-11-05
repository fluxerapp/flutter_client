require "open3"
require "tmpdir"

def ios_bundle_plist_value(bundle, key)
  out, status = Open3.capture2("/usr/libexec/PlistBuddy", "-c", "Print :#{key}", File.join(bundle, "Info.plist"))
  raise "Cannot read #{key} from #{bundle}" unless status.success?
  out.strip
end

def assert_ios_bundle_ready(ipa_path)
  Dir.mktmpdir do |dir|
    raise "Cannot unzip #{ipa_path}" unless system("unzip", "-q", ipa_path, "-d", dir)
    app = Dir.glob(File.join(dir, "Payload", "*.app")).first
    raise "No app bundle in #{ipa_path}" if app.nil?
    extensions = Dir.glob(File.join(app, "PlugIns", "*.appex"))
    missing = []
    missing << app unless File.exist?(File.join(app, "PrivacyInfo.xcprivacy"))
    %w[NotificationService ShareExtension].each do |name|
      appex = File.join(app, "PlugIns", "#{name}.appex")
      missing << appex unless File.exist?(File.join(appex, "PrivacyInfo.xcprivacy"))
    end
    Dir.glob(File.join(app, "Frameworks", "*.framework")).each do |framework|
      missing << framework if Dir.glob(File.join(framework, "**", "PrivacyInfo.xcprivacy")).empty?
    end
    raise "Missing privacy manifest in:\n#{missing.join("\n")}" unless missing.empty?
    Dir.glob(File.join(app, "**", "PrivacyInfo.xcprivacy")).each do |manifest|
      raise "Invalid privacy manifest #{manifest}" unless system("plutil", "-lint", "-s", manifest)
    end
    %w[CFBundleShortVersionString CFBundleVersion].each do |key|
      expected = ios_bundle_plist_value(app, key)
      extensions.each do |appex|
        actual = ios_bundle_plist_value(appex, key)
        raise "#{File.basename(appex)} #{key} #{actual} differs from #{expected}" unless actual == expected
      end
    end
  end
end
