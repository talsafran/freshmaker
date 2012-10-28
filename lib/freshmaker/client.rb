require 'httparty'

module Freshmaker
  class Client
    include HTTParty

    base_uri AUTH['url']

    def initialize(email, password)
      @auth = { username: email, password: password }
    end

    def get(path, options={})
      options.merge!({ basic_auth: @auth })
      self.class.get("#{path}.xml?", options)
    end

    def users
      Freshmaker::UserProxy.new(self)
    end

    def tickets
      Freshmaker::TicketProxy.new(self)
    end
  end
end
