require 'spec_helper'

describe Freshmaker::UserProxy do
  let(:fd_email)    { AUTH['email'] }
  let(:fd_password) { AUTH['password'] }
  let(:client)   { Freshmaker::Client.new(fd_email, fd_password) }

  let(:user_proxy) { Freshmaker::UserProxy.new(client) }

  describe '.initialize' do
    it 'should set the client' do
      user_proxy.instance_variable_get(:@client).should eql(client)
    end
  end

  describe '.get' do
    let(:email) { 'tal@safran.com' }

    context 'gets a response' do
      before(:all) do
        @users = user_proxy.get
      end

      it 'should return a response' do
        @users.should be
      end

      it 'should be an array' do
        @users.should be_an(Array)
      end

      it 'should have at most 10 users on a page' do
        @users.count.should <= 10
      end

      context 'each user' do
        it 'should have all the attributes we need' do
          @users.each do |user|
            user['name'].should be
            user['id'].should be
            user['email'].should be
          end
        end
      end
    end

    context 'empty response' do
      it 'should return an empty array' do
        Freshmaker::Client.stub(:get).and_return({})
        user_proxy.get.should == []
      end
    end
  end
end
