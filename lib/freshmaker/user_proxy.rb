module Freshmaker
  class UserProxy
    def initialize(client)
      @client = client
    end

    def all
      all  = []
      page = 1

      begin
        users = get(page: page)
        all  += users
        page += 1
      end while users.present?

      all
    end

    def get(params={})
      response = @client.get('/contacts', query: params)
      response['users'] || []
    end
  end
end
