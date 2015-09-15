require 'spec_helper'

describe BitcoinRpc do
  def stub_rpc(method, params, *fixtures)
    request = {id: 'jsonrpc', method: method}
    request[:params] = params unless params.empty?
    responses = fixtures.collect do |f|
      path = File.expand_path(File.join('../fixtures/', f), __FILE__)
      {status: 200, body: open(path)}
    end
    stub_request(:post, 'http://my.server:1234')
      .with(body: hash_including(request)).to_return(*responses)
  end

  it 'has a version number' do
    expect(BitcoinRpc::VERSION).not_to be nil
  end

  it 'requests and responds correctly' do
    s = stub_rpc('listreceivedbyaddress', [3, false, true], 'listreceivedbyaddress')
    BitcoinRpc::Client.new('http://my.server:1234').listreceivedbyaddress(3, false, true)
    s.should have_been_requested.once
  end

  it 'raises on rpc errors' do
    s = stub_rpc('listreceivedbyaddress', [3, false, true], 'error')
    expect do
      BitcoinRpc::Client.new('http://my.server:1234').listreceivedbyaddress(3, false, true)
    end.to raise_exception BitcoinRpc::Client::JsonRpcError
    s.should have_been_requested.once
  end
end
