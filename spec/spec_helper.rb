$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bitcoin_rpc'
require 'webmock/rspec'
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:expect, :should]
  end
end
