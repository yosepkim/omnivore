require 'spec_helper'

describe "EthorApi::Api::Ticket" do
  before(:each) do
    @store_id = ENV['PS_ETHOR_STORE_ID']
    @service = EthorApi::Client.new ENV['PS_ETHOR_VERSION'].to_sym, ENV['PS_ETHOR_API_KEY'], double
    @ticket = @service.ticket.create @store_id, { body: {order_type: 'dine_in'}}
  end

  it "creates a ticket" do
    expect(@ticket).to be
    expect(@ticket["ticket"]["order_type"]).to eq 'dine_in'
  end

  it "adds items to a ticket" do
    order_items = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/order_items.json"))
    ticket = @service.ticket.add_items @store_id, @ticket["ticket"]["order_id"], {body: order_items}
    expect(ticket["ticket"]["order_items"].length).to be 1
  end

  it "submits a ticket" do
    order_items = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/order_items.json"))
    ticket = @service.ticket.add_items @store_id, @ticket["ticket"]["order_id"], {body: order_items}

    customer = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/customer.json"))
    ticket = @service.ticket.submit @store_id, @ticket["ticket"]["order_id"], {body: customer}

    ticket = @service.ticket.find @store_id, @ticket["ticket"]["order_id"]
    
    expect(ticket).to be
    expect(ticket["ticket"]["order_type"]).to eq 'dine_in'
  end


  it "deletes a non submitted ticket" do
    ticket = @service.ticket.void @store_id, @ticket["ticket"]["order_id"]
    expect(ticket).to be
    expect(ticket["ticket"]["order_status"]).to eq "DELETED"
  end

  it "deletes a non submitted ticket" do
    order_items = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/order_items.json"))
    ticket = @service.ticket.add_items @store_id, @ticket["ticket"]["order_id"], {body: order_items}

    customer = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/customer.json"))
    ticket = @service.ticket.submit @store_id, @ticket["ticket"]["order_id"], {body: customer}
    
    ticket = @service.ticket.void @store_id, @ticket["ticket"]["order_id"]
    expect(ticket["ticket"]["order_status"]).to eq "DELETED"
  end

  it "adds a payment to a ticket" do
    order_items = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/order_items.json"))
    ticket = @service.ticket.add_items @store_id, @ticket["ticket"]["order_id"], {body: order_items}

    customer = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/customer.json"))
    ticket = @service.ticket.submit @store_id, @ticket["ticket"]["order_id"], {body: customer}

    payments = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/payments.json"))
    ticket = @service.ticket.add_payments @store_id, @ticket["ticket"]["order_id"], {body: payments}

    expect(ticket).to be
    expect(ticket["ticket"]["order_payments"].length).to eq 2

  end

   it "adds a payment to a submitted ticket" do
    order_items = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/order_items.json"))
    ticket = @service.ticket.add_items @store_id, @ticket["ticket"]["order_id"], {body: order_items}

    customer = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/customer.json"))
    ticket = @service.ticket.submit @store_id, @ticket["ticket"]["order_id"], {body: customer}

    payments = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/payments.json"))
    ticket = @service.ticket.add_payments @store_id, @ticket["ticket"]["order_id"], {body: payments}

    ticket = @service.ticket.submit @store_id, @ticket["ticket"]["order_id"], {body: customer}

    ticket = @service.ticket.find @store_id, @ticket["ticket"]["order_id"]

    expect(ticket).to be
    expect(ticket["ticket"]["order_payments"][1]["sent_to_pos"]).to eq true
  end

  it "finds a ticket" do
    expect(@ticket).to be
    expect(@ticket["ticket"]["order_type"]).to eq 'dine_in'
    expect(@ticket["ticket"]["order_id"]).to be
  end
end
