require 'poundpay/resource'
require 'poundpay/elements'
require 'poundpay/callback'

module Poundpay
  API_URL = "https://api.poundpay.com"
  API_VERSION = "silver"

  def self.configure(developer_sid, auth_token, api_url=API_URL, version=API_VERSION)
    unless developer_sid.start_with? "DV"
      raise ArgumentError.new "developer_sid should start with 'DV'.  Make sure " \
        "you're using the right developer_sid"
    end
    api_url.sub! /(\/)$/, ""  # Remove trailing backslash
    Resource.site = "#{api_url}/#{version}/"
    Resource.user = developer_sid
    Resource.password = auth_token
  end
end