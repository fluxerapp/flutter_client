#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "spaceship"
require_relative "../../fastlane/altstore_pal"

AltstorePal.publish_from_ci!
