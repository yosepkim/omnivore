require 'spec_helper'

describe "EthorApi::Api::Ticket" do
  before(:each) do
    @store_id = ENV['PS_ETHOR_STORE_ID']
    @menu_item_id = ENV['PS_ETHOR_MENU_ITEM_ID']
    @service = EthorApi::Client.new ENV['PS_ETHOR_VERSION'].to_sym, ENV['PS_ETHOR_API_KEY'], double
  end

  it "gets a menu item" do
    menu_item = @service.menu.find_menu_item @store_id, @menu_item_id
    expect(menu_item).to be
    expect(menu_item["menu_item"]["menu_item_id"]).to eq @menu_item_id
  end

  it "gets the menu" do
    menu_item = @service.menu.all @store_id
    expect(menu_item).to be
    expect(menu_item["menu"]).to be
  end

end
