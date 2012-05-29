# SagePay Admin & Reporting API for Ruby

This is a port of [the PHP version](https://github.com/colinbm/sagepay-php). Mainly written to play with making a gem.

## Installation

Add this line to your application's Gemfile:

    gem 'sagepayadminapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sagepayadminapi

## Usage

You can use any command specified in the [Reporting and Admin API documentation](https://www.sagepay.com/sites/default/files/pdf/brochures/ReportingAndAdminAPIProtocol_1_02_0.pdf) as a method.

```ruby
adminapi = SagePayAdminAPI.new('vendor', 'username', 'password')
transaction = adminapi.getTransactionDetail(vendortxcode: '12345678')
puts "Third Man Status: #{transaction['t3maction']} (#{transaction['t3mscore']})"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todo

- Tests