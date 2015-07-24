require 'spec_helper'

describe "EthorApi::Api::Store" do
  before(:each) do
    @service = EthorApi::Client.new ENV['PS_ETHOR_VERSION'].to_sym, ENV['PS_ETHOR_API_KEY'], double
  end

  it "gets a list of stores" do
    expect(@service.store.all.length).to be(2)
  end
end