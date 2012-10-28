require 'spec_helper'

describe Freshmaker::TicketProxy do
  let(:fd_email)    { AUTH['email'] }
  let(:fd_password) { AUTH['password'] }
  let(:client)   { Freshmaker::Client.new(fd_email, fd_password) }

  let(:ticket_proxy) { Freshmaker::TicketProxy.new(client) }

  describe '.initialize' do
    it 'should set the client' do
      ticket_proxy.instance_variable_get(:@client).should eql(client)
    end
  end

  describe '.get' do
    let(:email) { 'tal@safran.com' }

    context 'gets a response' do
      before(:all) do
        @tickets = ticket_proxy.get(email)
      end

      it 'should return a response' do
        @tickets.should be
      end

      it 'should be an array of tickets' do
        @tickets.should be_an(Array)
      end

      it 'should have all the fields we want' do
        @tickets.each do |ticket|
          ticket.should have_key('description')
          ticket.should have_key('subject')
          ticket.should have_key('due_by')
          ticket.should have_key('display_id')
          ticket.should have_key('requester_id')
          ticket.should have_key('responder_id')
          ticket.should have_key('created_at')
          ticket.should have_key('updated_at')

          ticket['notes'].each do |note|
            note.should have_key('body')
            note.should have_key('incoming')
            note.should have_key('private')
            note.should have_key('id')
            note.should have_key('user_id')
            note.should have_key('created_at')
            note.should have_key('updated_at')
          end
        end
      end
    end

    context 'empty response' do
      it 'should return an empty array' do
        Freshmaker::Client.stub(:get).and_return({})
        ticket_proxy.get(email).should == []
      end
    end
  end
end
