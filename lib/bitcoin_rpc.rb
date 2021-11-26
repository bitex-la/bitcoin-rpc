require "net/http"
require "uri"
require 'oj'
require "bitcoin_rpc/version"

module BitcoinRpc
  class Client
    def initialize(service_url)
      @uri = URI.parse(service_url)
    end
   
    def method_missing(name, *args)
      post_body = Oj.dump({method: name, params: args, id: 'jsonrpc'}, mode: :compat)
      raw_response = http_post_request(post_body)
      resp = Oj.load(raw_response, symbol_keys: true, bigdecimal_load: true)
      raise JsonRpcError, resp[:error] if resp[:error]
      resp[:result]
    end
   
    def http_post_request(post_body)
      http    = Net::HTTP.new(@uri.host, @uri.port)
      request = Net::HTTP::Post.new(@uri.request_uri)
      request.basic_auth @uri.user, @uri.password
      request.content_type = 'application/json'
      request.body = post_body
      http.request(request).body
    end
   
    class JsonRpcError < RuntimeError; end
  end
end
