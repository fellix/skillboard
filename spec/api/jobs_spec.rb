require 'spec_helper'
require 'vcr_config'
require 'rest-client'
require_relative '../../app/api/base'
require_relative '../../app/api/jobs'

describe Api::Jobs do
  describe 'retrieving all the offers' do
    let(:subject) do
      VCR.use_cassette("offers") do
        described_class.list(limit: 10)
      end
    end

    it 'should return an array' do
      expect(subject.size).to be 10
    end

    it 'should have at least the id, company_id and tags' do
      first_company = subject.first

      expect(first_company).to be_a(Hash)
      expect(first_company).to have_key('id')
      expect(first_company).to have_key('company_id')
      expect(first_company).to have_key('tags')
    end
  end
end