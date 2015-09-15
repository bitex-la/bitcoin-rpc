# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitcoin_rpc/version'

Gem::Specification.new do |spec|
  spec.name          = "bitcoin_rpc"
  spec.version       = BitcoinRpc::VERSION
  spec.authors       = ["Nubis", "Eromirou"]
  spec.email         = ["nb@bitex.la", "tr@bitex.la"]

  spec.summary       = "Tiny JSON-RPC client for Bitcoin-Core"
  spec.description   = %{
    Tiny JSON-RPC client for Bitcoin-Core, forwards calls via method_missing.
    Uses OJ and BigDecimal to accurately deserialize amounts.
    Heavily based on some throwaway snippets found around the web.
  }
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.add_dependency "oj", "> 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 2"
  spec.add_development_dependency "webmock", ">= 1.21"
end
