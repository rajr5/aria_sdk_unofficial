require "aria_sdk_unofficial/version"
require 'httparty'
require 'json'

class Aria

  attr_accessor :client_no, :auth_key, :url

  def initialize(client_no:, auth_key:, api_type:, env_type:, api_name: nil)
        self.client_no = client_no
        self.auth_key = auth_key
        self.url = get_url api_type, env_type
    end

    def call(api_name, options = {}, remove_nil=false)

        defaults = {
            :output_format => 'json',
            :client_no => self.client_no,
            :auth_key => self.auth_key,
            :rest_call => api_name
        }

        if remove_nil
          options.keys.each { |x| options.delete x if options[x].nil? }
        end

        options.merge!(defaults)
        HTTParty.post(self.url, :body => options)
    end

    def get_url(api_type, env_type)
      env_url = ''
      full_url = ''
      if env_type == 0 # SF
        env_url += '.future.stage'
      elsif env_type == 1 # SC
        env_url += '.current.stage'
      elsif env_type == 3 # SF CPH
        env_url += '.future.stage.cph'
      elsif env_type == 4 # Prod CPH
        env_url = '.cph'
      end

      if api_type == 0 # core
        full_url = "https://secure#{env_url}.ariasystems.net/api/ws/api_ws_class_dispatcher.php"
      elsif api_type == 1 # object
        full_url = "https://secure#{env_url}.ariasystems.net/api/AriaQuery/objects.php"
      else # admin
        full_url = "https://admintools#{env_url}.ariasystems.net/AdminTools.php/Dispatcher"
      end
        return full_url
    end
end