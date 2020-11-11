#RSpecは途中中断するとfixtureがきえたりするので元に戻す。
$ git checkout spec/fixtures
$ ls -alt ../*clean/spec/fixtures/files/for_kencom_files/kumiai/
_helper.rb初期設定
	spec/rails_helper.rb
	require 'simplecov'
require 'simplecov-rcov'
require 'capybara/rspec'
require 'capybara/poltergeist'

SimpleCov.formatters = SimpleCov::Formatter::RcovFormatter
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
# require 'spec_helper'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include ActiveSupport::Testing::TimeHelpers
  config.include FactoryGirl::Syntax::Methods
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = true


  # capybara default driver
  Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
  end
end


障害対応troubleshoot
	to_specやGemfile.lock起因でうごかないとき：gem uninstall rspec-*** -v *** でGemfilelockにかいてない gem全部消す
		REHL: /usr/local/lib/ruby/gems/[RUBY_VERSION]/gems
		debian:

