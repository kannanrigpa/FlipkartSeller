# FlipkartSeller

Ruby Gem for Flipkart Marketplace API.

This extension helps developers to integrate Flipkart marketplace API easily in Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'FlipkartSeller'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install FlipkartSeller

## Usage

1. Create flipkart client object

	fk_client = FlipkartSeller::Client.new(CLIENT_ID,CLIENT_SECRET)

2. Fetch your orders

	fk_client.fetch_orders

3. Get product detail
	
	fk_client.get_product(PRODUCT_SKU)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

