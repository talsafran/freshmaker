require 'spec_helper'

describe Freshmaker::Client do
  subject { Freshmaker::Client }

  let(:email)    { AUTH['email'] }
  let(:password) { AUTH['password'] }
  let(:client)   { Freshmaker::Client.new(email, password) }

  describe '#initialize' do
    context 'authorization' do
      subject { client.instance_variable_get(:@auth) }

      it { should be_a(Hash) }
      its([:username]) { should eql(email) }
      its([:password]) { should eql(password) }
    end
  end

  describe '#get' do
    it 'should return an HTTParty response' do
      response = client.get('/contacts')
      response.class.should be(HTTParty::Response)
    end
  end

  describe '#users' do
    subject { client.users }
    it { should be_an_instance_of(Freshmaker::UserProxy) }
  end

  describe '#tickets' do
    subject { client.tickets}
    it { should be_an_instance_of(Freshmaker::TicketProxy) }
  end
end
