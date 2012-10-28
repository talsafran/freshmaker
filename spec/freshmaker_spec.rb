require 'spec_helper'

describe Freshmaker do
  describe '#new' do
    subject { Freshmaker.new }
    it { should be_an_instance_of(Freshmaker::Client) }
  end
end
