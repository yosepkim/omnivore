require 'spec_helper'

describe "OmnivoreApi::Client" do
  it "has an attr_reader for access token" do
    consumer_key = 'adfadf'
    service = OmnivoreApi::Client.new :sandbox, consumer_key, double
    expect(service.consumer_key).to eq(consumer_key)
  end

  it "has an attr_reader for app_secret" do
    consumer_secret = 'double'
    service = OmnivoreApi::Client.new :sandbox, double, consumer_secret
    expect(service.consumer_secret).to eq(consumer_secret)
  end

  it "has an attr_reader for server" do
    service = OmnivoreApi::Client.new :sandbox, double, double
    expect(service.server).to eq('https://ethor-test.apigee.net')
  end
end