# OmnivoreApi

Gem for consuming the Omnivore API

Currently working:
* Get stores list
* Create ticket


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omnivore_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omnivore_api

## Usage

Checkout the rspec tests for better documentation

### Examples
```ruby
  @service = EthorApi::Client.new :sandbox, api_key, consumer_secret # :sandbox or :live
  
  @service.store.all # lists all stores

  @service.ticket.create "HI6PIDO5JS", { body: {order_type: 'dine_in'}} # create ticket

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
