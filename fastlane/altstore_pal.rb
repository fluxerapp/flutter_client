require "cgi"
require "json"
require "fileutils"
require "net/http"
require "open-uri"
require "open3"
require "tmpdir"
require "uri"

module AltstorePal
  APP_IDENTIFIER = "com.fluxer"
  BUNDLE_ID = "com.fluxer"
  SOURCE_PATH = "altstore/source.json"
  RELEASE_NOTES = "View release notes for this version on https://feedback.fluxer.com/changelog?platform=mobile"
  ALTSTORE_ADP_URL = "https://api.altstore.io/adps"
  ASC_API_BASE = "https://api.appstoreconnect.apple.com"

  APP_STORE_BLOCKING_VERSION_STATES = [
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::WAITING_FOR_REVIEW,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::IN_REVIEW
  ].freeze

  REVIEW_TYPE_MUTABLE_STATES = [
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::PREPARE_FOR_SUBMISSION,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::READY_FOR_REVIEW,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::DEVELOPER_REJECTED,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::REJECTED,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::METADATA_REJECTED,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::INVALID_BINARY
  ].freeze

  NOTARIZATION_ACCEPTED_STATES = [
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::READY_FOR_DISTRIBUTION,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::PENDING_DEVELOPER_RELEASE,
    Spaceship::ConnectAPI::AppStoreVersion::AppVersionState::PENDING_APPLE_RELEASE
  ].freeze

  module_function

  def connect_api(api_key)
    Spaceship::ConnectAPI.token = Spaceship::ConnectAPI::Token.from(hash: api_key)
  end

  def api_key_from_env
    {
      key_id: ENV.fetch("APPSTORE_KEY_ID"),
      issuer_id: ENV.fetch("APPSTORE_ISSUER_ID"),
      key_content: ENV.fetch("APPSTORE_PRIVATE_KEY"),
      duration: 1200,
      in_house: false
    }
  end

  def find_app_store_version(app, app_version:, platform: Spaceship::ConnectAPI::Platform::IOS)
    includes = Spaceship::ConnectAPI::AppStoreVersion::ESSENTIAL_INCLUDES
    app.get_app_store_versions(filter: { platform: platform }, includes: includes).find do |version|
      version.version_string == app_version
    end
  end

  def create_notarization_version(app, app_version:, platform:)
    Spaceship::ConnectAPI.post_app_store_version(
      app_id: app.id,
      attributes: {
        versionString: app_version,
        platform: platform,
        reviewType: Spaceship::ConnectAPI::AppStoreVersion::ReviewType::NOTARIZATION
      }
    )
    find_app_store_version(app, app_version: app_version, platform: platform)
  end

  def bump_marketing_version(base_marketing_version, bump)
    parts = base_marketing_version.split(".")
    if parts.length != 3
      fail!("Expected year.month.public marketing version, got #{base_marketing_version}")
    end
    year, month, public_release = parts
    "#{year}.#{month}.#{public_release.to_i + bump}"
  end

  def notarization_submission_status(version)
    return :missing if version.nil?

    review_type = version.review_type.to_s
    state = version.app_version_state.to_s

    if review_type == Spaceship::ConnectAPI::AppStoreVersion::ReviewType::APP_STORE &&
       APP_STORE_BLOCKING_VERSION_STATES.include?(state)
      return :blocked_app_store_review
    end

    return :already_accepted if NOTARIZATION_ACCEPTED_STATES.include?(state)

    :ready
  end

  def ensure_notarization_review_type!(version)
    ensure_review_type!(version, Spaceship::ConnectAPI::AppStoreVersion::ReviewType::NOTARIZATION)
  end

  def ensure_review_type!(version, review_type)
    return true if version.review_type.to_s == review_type

    state = version.app_version_state.to_s
    return false unless state.empty? || REVIEW_TYPE_MUTABLE_STATES.include?(state)

    begin
      version.update(attributes: { reviewType: review_type })
    rescue Spaceship::UnexpectedResponse => error
      return false if error.message.include?("reviewType")

      raise
    end

    refreshed = Spaceship::ConnectAPI::AppStoreVersion.get(app_store_version_id: version.id)
    refreshed&.review_type.to_s == review_type
  end

  def prepare_app_store_release_version!(api_key:, app_identifier:, app_version:, platform: Spaceship::ConnectAPI::Platform::IOS)
    connect_api(api_key)
    app = Spaceship::ConnectAPI::App.find(app_identifier)
    app_store = Spaceship::ConnectAPI::AppStoreVersion::ReviewType::APP_STORE
    notarization = Spaceship::ConnectAPI::AppStoreVersion::ReviewType::NOTARIZATION

    version = find_app_store_version(app, app_version: app_version, platform: platform)
    if version
      previous = version.review_type.to_s
      unless ensure_review_type!(version, app_store)
        fail!(
          "App Store Connect version #{app_version} is #{previous} " \
          "(#{version.app_version_state}) and its review type cannot be changed to #{app_store}. " \
          "In App Store Connect, remove it from its review submission under App Review or set its " \
          "review type to App Store, then re-run this workflow."
        )
      end
      log("Switched App Store Connect version #{app_version} from #{previous} to #{app_store} review.") if previous != app_store
      return
    end

    editable = app.get_edit_app_store_version(platform: platform)
    return unless editable && editable.review_type.to_s == notarization

    log(
      "Unreleased version #{editable.version_string} (#{editable.app_version_state}) is an AltStore PAL " \
      "notarization version. Do not attach build #{app_version} to it; App Store review needs a #{app_store} version."
    )
  end

  def prepare_altstore_pal_build_version(
    api_key:,
    app_identifier:,
    base_marketing_version:,
    platform: Spaceship::ConnectAPI::Platform::IOS
  )
    connect_api(api_key)
    app = Spaceship::ConnectAPI::App.find(app_identifier)
    max_bumps = 32

    (1..max_bumps).each do |bump|
      candidate = bump_marketing_version(base_marketing_version, bump)
      existing = find_app_store_version(app, app_version: candidate, platform: platform)
      status = notarization_submission_status(existing)
      next if status == :already_accepted || status == :blocked_app_store_review

      version = existing || create_notarization_version(app, app_version: candidate, platform: platform)
      fail!("Could not find or create App Store version #{candidate}.") if version.nil?
      next unless ensure_notarization_review_type!(version)
      if bump > 1
        log("AltStore PAL marketing version #{candidate} (pubspec #{base_marketing_version})")
      end
      log("Prepared App Store Connect version #{candidate} for notarization.")
      return candidate
    end

    fail!(
      "Could not find an App Store Connect version for AltStore PAL notarization " \
      "after #{max_bumps} bumps from #{base_marketing_version}."
    )
  end

  def assert_can_submit_for_notarization!(version)
    status = notarization_submission_status(version)

    if status == :blocked_app_store_review
      state = version.app_version_state.to_s
      fail!(
        "App Store Connect version #{version.version_string} is in App Store review (#{state}). " \
        "Remove it from App Store review in App Store Connect or pick a higher marketing version."
      )
    end

    if status == :already_accepted
      state = version.app_version_state.to_s
      log("Version #{version.version_string} is already accepted (#{state}); skipping notarization submit.")
      return :already_accepted
    end

    :ready
  end

  def attach_build_to_version(app:, version:, app_version:, build_number:, platform: Spaceship::ConnectAPI::Platform::IOS)
    builds = Spaceship::ConnectAPI::Build.all(
      app_id: app.id,
      version: app_version,
      build_number: build_number.to_s,
      platform: platform
    )
    valid = Spaceship::ConnectAPI::Build::ProcessingState::VALID
    build = builds.find { |item| item.version.to_s == build_number.to_s && item.processing_state == valid }
    if build.nil?
      state = builds.first&.processing_state
      fail!(
        "Build #{app_version} (#{build_number}) is not a valid processed build" \
        "#{state ? " (#{state})" : ""}."
      )
    end

    Spaceship::ConnectAPI.patch_app_store_version_with_build(
      app_store_version_id: version.id,
      build_id: build.id
    )
  end

  def submit_for_notarization(api_key:, app_identifier:, app_version:, build_number:)
    connect_api(api_key)
    platform = Spaceship::ConnectAPI::Platform::IOS
    app = Spaceship::ConnectAPI::App.find(app_identifier)
    version = find_app_store_version(app, app_version: app_version, platform: platform)
    fail!("App Store Connect version #{app_version} was not found. Re-run the AltStore PAL build lane.") if version.nil?

    unless ensure_notarization_review_type!(version)
      fail!(
        "App Store Connect version #{app_version} is #{version.review_type} " \
        "(#{version.app_version_state}) and its review type cannot be changed."
      )
    end

    status = assert_can_submit_for_notarization!(version)
    return if status == :already_accepted

    attach_build_to_version(
      app: app,
      version: version,
      app_version: app_version,
      build_number: build_number,
      platform: platform
    )

    version = find_app_store_version(app, app_version: app_version, platform: platform)
    fail!("App Store Connect version #{app_version} was not found after attaching the build.") if version.nil?
    unless ensure_notarization_review_type!(version)
      fail!(
        "App Store Connect version #{app_version} is #{version.review_type} " \
        "(#{version.app_version_state}) and its review type cannot be changed."
      )
    end

    in_progress = app.get_in_progress_review_submission(platform: platform)
    if in_progress
      fail!(
        "Another App Store Connect review is already #{in_progress.state}. " \
        "Not submitting #{app_version}, so that review is left alone. " \
        "The build is uploaded and can be submitted after that review finishes."
      )
    end

    existing_submission = version.fetch_app_store_version_submission
    if existing_submission
      log("Version #{app_version} already has a submission; skipping create.")
      return
    end

    version.create_app_store_version_submission

    log("Submitted #{app_version} (#{build_number}) for notarization review.")
  end

  def write_version_metadata(path:, version:, build_version:, stable_release_tag:)
    payload = {
      version: version,
      buildVersion: build_version.to_s,
      stableReleaseTag: stable_release_tag.to_s
    }
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, JSON.pretty_generate(payload) + "\n")
  end

  def publish_from_ci!
    metadata_path = ENV.fetch("METADATA_PATH")
    metadata = JSON.parse(File.read(metadata_path))
    version = metadata.fetch("version")
    build_version = metadata.fetch("buildVersion")

    stable_tag = ENV["STABLE_RELEASE_TAG"].to_s.strip
    stable_tag = metadata["stableReleaseTag"].to_s.strip if stable_tag.empty?
    fail!("Stable release tag is required.") if stable_tag.empty?

    repo_slug = ENV.fetch("GITHUB_REPOSITORY", "fluxerapp/flutter_client")
    gh_token = ENV.fetch("GH_TOKEN")
    git_branch = ENV.fetch("GIT_BRANCH", "stable")
    ci_user_id = ENV["FLUXER_CI_APP_USER_ID"].to_s.strip
    fail!("FLUXER_CI_APP_USER_ID is required.") if ci_user_id.empty?

    connect_api(api_key_from_env)
    app = Spaceship::ConnectAPI::App.find(APP_IDENTIFIER)
    app_store_version = find_app_store_version(app, app_version: version)
    fail!("App Store version #{version} was not found.") if app_store_version.nil?

    review_type = app_store_version.review_type.to_s
    notarization = Spaceship::ConnectAPI::AppStoreVersion::ReviewType::NOTARIZATION
    unless review_type == notarization
      fail!(
        "App Store Connect version #{version} review type is #{review_type}. " \
        "Refusing to publish an App Store review build to AltStore."
      )
    end

    state = app_store_version.app_version_state.to_s
    unless NOTARIZATION_ACCEPTED_STATES.include?(state)
      fail!(
        "App Store version #{version} is #{state}. " \
        "Re-run after Apple accepts notarization (#{NOTARIZATION_ACCEPTED_STATES.join(', ')})."
      )
    end

    adp_id = alternative_distribution_package_id(app_store_version.id)
    download_url = process_with_altstore(adp_id)

    Dir.mktmpdir("fluxer-adp") do |work_dir|
      staging_dir, ipa_size = extract_and_stage_adp(download_url, work_dir)
      upload_staged_adp_to_github_release(
        staging_dir: staging_dir,
        stable_tag: stable_tag,
        repo_slug: repo_slug,
        gh_token: gh_token
      )

      if release_draft?(gh_token: gh_token, stable_tag: stable_tag, repo_slug: repo_slug)
        log(
          "GitHub release #{stable_tag} is still a draft. source.json will point at #{stable_tag}, " \
          "and its download links work once the release is published under that tag."
        )
      end

      if source_json_current?(version: version, build_version: build_version)
        log("source.json already lists #{version} (#{build_version}); skipping edit.")
        return
      end

      update_source_json(
        version: version,
        build_version: build_version,
        stable_tag: stable_tag,
        repo_slug: repo_slug,
        staging_dir: staging_dir,
        ipa_size: ipa_size
      )

      commit_source_json(
        version: version,
        build_version: build_version,
        git_branch: git_branch,
        ci_user_id: ci_user_id
      )
    end
  end

  def alternative_distribution_package_id(app_store_version_id)
    package_id = read_alternative_distribution_package_id(app_store_version_id)
    return package_id if package_id

    payload = {
      data: {
        type: "alternativeDistributionPackages",
        relationships: {
          appStoreVersion: {
            data: {
              type: "appStoreVersions",
              id: app_store_version_id
            }
          }
        }
      }
    }
    status, body = asc_request(:post, "/v1/alternativeDistributionPackages", payload)
    fail!("Failed to create alternative distribution package (#{status}): #{body}") unless status.between?(200, 201)

    package_id = read_alternative_distribution_package_id(app_store_version_id)
    return package_id if package_id

    created_id = JSON.parse(body).dig("data", "id")
    fail!("Alternative distribution package #{created_id} is not ready to download. Re-run publish later.")
  end

  def read_alternative_distribution_package_id(app_store_version_id)
    status, body = asc_request(
      :get,
      "/v1/appStoreVersions/#{app_store_version_id}/alternativeDistributionPackage?include=versions"
    )
    return nil if status == 404
    fail!("Failed to read alternative distribution package (#{status}): #{body}") unless status == 200

    payload = JSON.parse(body)
    data = payload["data"]
    return nil unless data.is_a?(Hash) && data["id"]

    assert_package_version_ready!(payload)
    data["id"]
  end

  def assert_package_version_ready!(payload)
    versions = Array(payload["included"]).select { |item| item["type"] == "alternativeDistributionPackageVersions" }
    relationship = payload.dig("data", "relationships", "versions", "data")
    if versions.empty? && relationship.is_a?(Array) && relationship.empty?
      fail!("Alternative distribution package has no versions yet. Re-run publish later.")
    end
    return if versions.empty?

    states = versions.map { |item| item.dig("attributes", "state").to_s }
    return if states.include?("COMPLETED")

    ready_states = states.reject(&:empty?).join(", ")
    fail!("Alternative distribution package is not ready (#{ready_states}). Re-run publish later.")
  end

  def asc_request(method, path, body = nil)
    token = Spaceship::ConnectAPI.token
    fail!("App Store Connect API token is not configured.") if token.nil?

    uri = URI("#{ASC_API_BASE}#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = case method
              when :get then Net::HTTP::Get.new(uri)
              when :post then Net::HTTP::Post.new(uri)
              when :patch then Net::HTTP::Patch.new(uri)
              else
                fail!("Unsupported ASC request method: #{method}")
              end
    request["Authorization"] = "Bearer #{token.text}"
    request["Content-Type"] = "application/json"
    request.body = JSON.generate(body) if body
    response = http.request(request)
    [response.code.to_i, response.body]
  end

  def process_with_altstore(adp_id)
    altstore_post(adp_id)

    deadline = Time.now + 600
    loop do
      response = altstore_get(adp_id)
      download_url = response["downloadURL"]
      return download_url if download_url && !download_url.empty?

      status_text = response["status"].to_s
      if %w[failure failed error].include?(status_text.downcase)
        fail!("AltStore ADP #{adp_id} failed (#{status_text}).")
      end
      fail!("AltStore ADP #{adp_id} is still #{status_text}. Re-run publish later.") if Time.now >= deadline

      log("AltStore ADP #{adp_id} status: #{status_text}")
      sleep(15)
    end
  end

  def altstore_post(adp_id)
    uri = URI(ALTSTORE_ADP_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    request.body = JSON.generate({ adpID: adp_id })
    response = http.request(request)
    code = response.code.to_i
    return if code.between?(200, 299) || code == 409

    fail!("AltStore process request failed (#{response.code}): #{response.body}")
  end

  def altstore_get(adp_id)
    uri = URI("#{ALTSTORE_ADP_URL}/#{adp_id}")
    JSON.parse(uri.open.read)
  end

  def extract_and_stage_adp(download_url, work_dir)
    zip_path = File.join(work_dir, "adp.zip")
    extract_dir = File.join(work_dir, "extracted")
    staging_dir = File.join(work_dir, "upload")
    FileUtils.mkdir_p(extract_dir, staging_dir)

    URI.parse(download_url).open { |remote| File.binwrite(zip_path, remote.read) }
    system("unzip", "-q", zip_path, "-d", extract_dir) ||
      fail!("Failed to unzip ADP from #{download_url}.")

    ipa_size = ipa_size_from_extract(extract_dir)
    stage_adp_files(extract_dir, staging_dir)
    validate_staged_adp!(staging_dir)
    [staging_dir, ipa_size]
  end

  def ipa_size_from_extract(extract_dir)
    ipas = Dir.glob(File.join(extract_dir, "**", "*.ipa")).reject do |path|
      path.split(File::SEPARATOR).include?("__MACOSX")
    end
    fail!("ADP is missing an .ipa.") if ipas.empty?

    variants = ipas.select { |path| path.split(File::SEPARATOR).include?("variant") }
    chosen = variants.empty? ? ipas : variants
    chosen.map { |path| File.size(path) }.max
  end

  def validate_staged_adp!(staging_dir)
    names = Dir.children(staging_dir)
    fail!("ADP is missing manifest.json.") unless names.include?("manifest.json")
    fail!("ADP is missing signature file.") unless names.include?("signature")
    fail!("ADP is missing an .ipa.") unless names.any? { |name| name.end_with?(".ipa") }
  end

  def stage_adp_files(extract_dir, staging_dir)
    Dir.glob(File.join(extract_dir, "**", "*")).each do |path|
      next unless File.file?(path)

      next if path.split(File::SEPARATOR).include?("__MACOSX")

      name = File.basename(path)
      next if name.start_with?(".")

      destination = File.join(staging_dir, name)
      fail!("ADP contains duplicate basenames; cannot upload to GitHub Releases.") if File.exist?(destination)

      FileUtils.cp(path, destination)
    end
    fail!("No ADP files found to upload.") if Dir.glob(File.join(staging_dir, "*")).none? { |path| File.file?(path) }
    staging_dir
  end

  def upload_staged_adp_to_github_release(staging_dir:, stable_tag:, repo_slug:, gh_token:)
    upload_paths = Dir.glob(File.join(staging_dir, "*")).select { |path| File.file?(path) }
    fail!("No ADP files found to upload.") if upload_paths.empty?

    gh!(gh_token, "release", "view", stable_tag, "--repo", repo_slug)
    gh!(gh_token, "release", "upload", stable_tag, *upload_paths, "--repo", repo_slug, "--clobber")
  end

  def release_draft?(gh_token:, stable_tag:, repo_slug:)
    output, status = Open3.capture2(
      { "GH_TOKEN" => gh_token },
      "gh", "release", "view", stable_tag, "--repo", repo_slug, "--json", "isDraft", "--jq", ".isDraft"
    )
    fail!("gh release view #{stable_tag} failed.") unless status.success?

    case output.strip
    when "true" then true
    when "false" then false
    else fail!("Could not read draft state of GitHub release #{stable_tag}: #{output.strip}")
    end
  end

  def source_json_current?(version:, build_version:)
    source = JSON.parse(File.read(SOURCE_PATH))
    app = source.fetch("apps").find { |entry| entry["bundleIdentifier"] == BUNDLE_ID }
    return false if app.nil?

    first = app.fetch("versions", []).first
    return false if first.nil?

    first["version"] == version &&
      first["buildVersion"] == build_version.to_s &&
      !first["downloadURL"].to_s.empty?
  end

  def update_source_json(version:, build_version:, stable_tag:, repo_slug:, staging_dir:, ipa_size:)
    asset_urls = {}
    Dir.glob(File.join(staging_dir, "*")).each do |path|
      next unless File.file?(path)

      name = File.basename(path)
      asset_urls[asset_key(name)] = release_asset_url(repo_slug, stable_tag, name)
    end

    manifest_url = asset_urls["manifest"]
    fail!("ADP is missing manifest.json.") if manifest_url.nil?
    fail!("ADP is missing signature file.") unless asset_urls.key?("signature")

    source = JSON.parse(File.read(SOURCE_PATH))
    app = source.fetch("apps").find { |entry| entry["bundleIdentifier"] == BUNDLE_ID }
    fail!("Bundle #{BUNDLE_ID} missing from #{SOURCE_PATH}.") if app.nil?

    filtered = app.fetch("versions", []).reject { |entry| entry["downloadURL"].to_s.empty? }
    filtered.reject! do |entry|
      entry["version"] == version && entry["buildVersion"] == build_version.to_s
    end
    filtered.unshift(
      {
        "version" => version,
        "buildVersion" => build_version.to_s,
        "date" => Time.now.utc.iso8601,
        "localizedDescription" => RELEASE_NOTES,
        "downloadURL" => manifest_url,
        "size" => ipa_size,
        "minOSVersion" => "16.0",
        "assetURLs" => asset_urls
      }
    )
    app["versions"] = filtered
    File.write(SOURCE_PATH, JSON.pretty_generate(source) + "\n")
  end

  def commit_source_json(version:, build_version:, git_branch:, ci_user_id:)
    system("git", "config", "user.name", "fluxer-ci[bot]") || fail!("git config failed.")
    system(
      "git",
      "config",
      "user.email",
      "#{ci_user_id}+fluxer-ci[bot]@users.noreply.github.com"
    ) || fail!("git config failed.")
    system("git", "add", SOURCE_PATH) || fail!("git add failed.")
    system("git", "commit", "-m", "chore(altstore): publish #{version} (#{build_version})") ||
      fail!("git commit failed.")
    system("git", "pull", "--rebase", "origin", git_branch) || fail!("git pull failed.")
    system("git", "push", "origin", "HEAD:#{git_branch}") || fail!("git push failed.")
  end

  def asset_key(filename)
    base = File.basename(filename)
    return "signature" if base == "signature"

    ext = File.extname(base)
    ext.empty? ? base : base.delete_suffix(ext)
  end

  def release_asset_url(repo_slug, stable_tag, filename)
    owner, repo = repo_slug.split("/", 2)
    fail!("GITHUB_REPOSITORY must look like owner/repo.") if owner.to_s.empty? || repo.to_s.empty?

    "https://github.com/#{CGI.escapeURIComponent(owner)}/#{CGI.escapeURIComponent(repo)}/releases/download/#{CGI.escapeURIComponent(stable_tag)}/#{CGI.escapeURIComponent(filename)}"
  end

  def gh!(gh_token, *args)
    env = { "GH_TOKEN" => gh_token }
    success = system(env, "gh", *args)
    fail!("gh #{args.join(' ')} failed.") unless success
  end

  def log(message)
    if defined?(FastlaneCore::UI)
      FastlaneCore::UI.message(message)
    else
      puts(message)
    end
  end

  def fail!(message)
    if defined?(FastlaneCore::UI)
      FastlaneCore::UI.user_error!(message)
    else
      abort(message)
    end
  end
end
