require 'spec_helper'

describe AriaSdkUnofficial do
  it 'has a version number' do
    expect(AriaSdkUnofficial::VERSION).not_to be nil
  end

  it 'Stage Future url is formed properly' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 0})
    expect(aria.url).to eq('https://secure.future.stage.ariasystems.net/api/ws/api_ws_class_dispatcher.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 1, env_type: 0})
    expect(aria.url).to eq('https://secure.future.stage.ariasystems.net/api/AriaQuery/objects.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 2, env_type: 0})
	expect(aria.url).to eq('https://admintools.future.stage.ariasystems.net/AdminTools.php/Dispatcher')
  end

   it 'Stage Current url is formed properly' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 1})
    expect(aria.url).to eq('https://secure.current.stage.ariasystems.net/api/ws/api_ws_class_dispatcher.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 1, env_type: 1})
    expect(aria.url).to eq('https://secure.current.stage.ariasystems.net/api/AriaQuery/objects.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 2, env_type: 1})
	expect(aria.url).to eq('https://admintools.current.stage.ariasystems.net/AdminTools.php/Dispatcher')
  end

   it 'Production url is formed properly' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 2})
    expect(aria.url).to eq('https://secure.ariasystems.net/api/ws/api_ws_class_dispatcher.php') 
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 1, env_type: 2})
    expect(aria.url).to eq('https://secure.ariasystems.net/api/AriaQuery/objects.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 2, env_type: 2})
	expect(aria.url).to eq('https://admintools.ariasystems.net/AdminTools.php/Dispatcher')
  end

   it 'Stage Future CPH url is formed properly' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 3})
    expect(aria.url).to eq('https://secure.future.stage.cph.ariasystems.net/api/ws/api_ws_class_dispatcher.php') 
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 1, env_type: 3})
    expect(aria.url).to eq('https://secure.future.stage.cph.ariasystems.net/api/AriaQuery/objects.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 2, env_type: 3})
    expect(aria.url).to eq('https://admintools.future.stage.cph.ariasystems.net/AdminTools.php/Dispatcher')
  end

   it 'Production CPH url is formed properly' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 4})
    expect(aria.url).to eq('https://secure.cph.ariasystems.net/api/ws/api_ws_class_dispatcher.php') 
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 1, env_type: 4})
    expect(aria.url).to eq('https://secure.cph.ariasystems.net/api/AriaQuery/objects.php')
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 2, env_type: 4})
	expect(aria.url).to eq('https://admintools.cph.ariasystems.net/AdminTools.php/Dispatcher')
  end

  it 'Constructor variables are set poperly' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 0})
    expect(aria.client_no).to eq(123456)
    expect(aria.auth_key).to eq('nfjhfruiebire')
  end

  it 'A call to Aria is made successfully (just check that actual error code is given, not that credentials are valid)' do
    aria = Aria.new({client_no: 123456, auth_key:'nfjhfruiebire', api_type: 0, env_type: 0})
    response = aria.call('authenticate_caller')
    expect(response.has_key?("error_code")).to be true
  end

end
