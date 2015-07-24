require 'spec_helper'

describe "OmnivoreApi::Api::Store" do
  before(:each) do
    @service = OmnivoreApi::Client.new ENV['PS_OMNIVORE_VERSION'].to_sym, ENV['PS_OMNIVORE_API_KEY'], double
  end

  it "gets a list of stores" do
    expect(@service.store.all.length).to be(2)
  end
end