# AriaSdkUnofficial

This is an unofficial Aria SDK gem meant to be a bit simpler while also implementing all of the end points instead of a limited number of them.
This product is issued with no warranty and is in no way any representation of Aria Systems.

The official sdk can be found [here](https://github.com/AriaSystems/ruby_sdk).
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aria_sdk_unofficial'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install aria_sdk_unofficial

## Usage

To use this gem, instantiate the Aria object and use the call method to make an API call.

To instaniate the Aria object, a dictionary with the following keys is passed in as the only argument:
```ruby
{
	client_no: 123456, 
	auth_key:'auth_key_here', 
	api_type: 0, 
	env_type: 1
}
```
### Valid api types are as follows:
* 0 = Core API
* 1 = Object Query API
* 2 = Admintools API

### Valid environment types are as follows:
* 0 = Stage Future
* 1 = Stage Current
* 2 = Production
* 3 = Stage Future CPH
* 4 = Production CPH

**Note:** One optional parameter can be assed in named api_name.  This will be ignored, but is allowed.

```ruby
aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 0})
```
After instantiating the object, the client_no, auth_key, and url are all accessible

```ruby
puts aria.url
```

### To make and API call,  use the call method with the following parameters:

```ruby
{
	api_name: set_session, 
	options: {acct_no: 123456}, 
	remove_nil: true
}
```

options and remove_nil are both optional parameters.

Options are the additional API parameters used.

Removing nill will strip parameters with nil values from the options prior to sending to Aria.

**Defaults:** remove_nil=false, options = {}

```ruby
aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 0})
response = aria.call('authenticate_caller', {acct_no: 123456})
puts response.['session_id']
```

### Admintools example
```ruby
aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 2, env_type: 0})
if response['error_code'] == 0
	response['coa_list'].each do |coa|
		puts "coa id #{coa['coa_id']}"
		puts "coa code #{coa['coa_code']}"
		puts "coa description #{coa['coa_description']}"
	end
else
	puts "API call failed, error code #{response['error_msg']}"
end
```

#### The response element is an [httparty](https://github.com/jnunemaker/httparty) response.
