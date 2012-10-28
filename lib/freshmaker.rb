require 'yaml'
AUTH = YAML::load(File.open 'auth.yml')

require 'freshmaker/client'
require 'freshmaker/ticket_proxy'
require 'freshmaker/user_proxy'
require 'freshmaker/version'

module Freshmaker
  class << self
    attr_writer :email, :password

    def new
      Freshmaker::Client.new(@email, @password)
    end
  end
end
