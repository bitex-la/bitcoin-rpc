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
  spec.homepage      = "https://github.com/bitex-la/bitcoin-rpc"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.add_dependency "oj", "~> 3.13.0"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "webmock", "~> 1.21"
end
