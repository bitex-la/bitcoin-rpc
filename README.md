# BitcoinRpc

Tiny JSON-RPC client for Bitcoin-Core, forwards calls via method_missing.
Uses OJ and BigDecimal to accurately deserialize amounts.
Heavily based on some throwaway snippets found around the web.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitcoin_rpc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoin_rpc

## Usage

    >>> client = BitcoinRpc::Client.new('http://user:pass@bitcoin-rpc-host:18332')
    => #<BitcoinRpc::Client:0x007fae4a94c780 @uri=#<URI::HTTP http://user:pass@bitcoin-rpc-host:18332>>
    >>> client.getinfo
    => {
         "version" => 100000,
         "protocolversion" => 70002,
         "walletversion" => 60000,
         "balance" => 1.27007770,
         "blocks" => 315281,
         "timeoffset" => 0,
         "connections" => 9,
         "proxy" => "",
         "difficulty" => 1.00000000,
         "testnet" => true,
         "keypoololdest" => 1418924649,
         "keypoolsize" => 101,
         "paytxfee" => 0.00000000,
         "relayfee" => 0.00001000,
         "errors" => ""
       }

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bitcoin_rpc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
