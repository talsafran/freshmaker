module Freshmaker
  class TicketProxy
    def initialize(client)
      @client = client
    end

    def get(email)
      response = @client.get('/helpdesk/tickets/user_ticket', query: { email: email })
      response['helpdesk_tickets'] || []
    end
  end
end
