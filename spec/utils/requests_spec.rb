# frozen_string_literal: true

require_relative '../../lib/bucky/utils/requests'

describe Bucky::Utils::Requests do
  let(:test_class) { Struct.new(:test_class) { include Bucky::Utils::Requests } }
  subject { test_class.new }
  let(:uri) { 'http://example.com' }
  let(:device) { 'pc' }
  let(:open_timeout) { 60 }
  let(:read_timeout) { 60 }
  let(:http) { Net::HTTP.new('test') }

  describe '#get_response' do
    it 'call Net::HTTP.get' do
      allow(Net::HTTP).to receive(:start).and_yield(http)
      Net::HTTP.start do |http|
        expect(http).to receive(:get)
      end
      subject.get_response(uri, device, open_timeout, read_timeout)
    end
  end
end
