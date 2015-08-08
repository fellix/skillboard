require 'spec_helper'
require 'vcr_config'
require 'rest-client'
require_relative '../../app/api/base'
require_relative '../../app/api/companies'

describe Api::Companies do
  describe 'retrieving all the companies' do
    let(:subject) do
      VCR.use_cassette("companies") do
        described_class.list(limit: 10)
      end
    end

    it 'should return an array' do
      expect(subject.size).to be 10
    end

    it 'should have at least the id, name and website' do
      first_company = subject.first

      expect(first_company).to be_a(Hash)
      expect(first_company).to have_key('id')
      expect(first_company).to have_key('name')
      expect(first_company).to have_key('website_url')
    end
  end

  describe 'retrieving data from only one company' do
    it 'should return the data when an id is given' do
      company = VCR.use_cassette("company") do
        described_class.get(75)
      end

      expect(company['name']).to be == 'Skimlinks'
      expect(company['id']).to be == 75
    end
  end
end