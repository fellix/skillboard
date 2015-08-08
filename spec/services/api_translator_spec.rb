require 'rails_helper'
require 'vcr_config'

describe ApiTranslator do
  fixtures :companies, :skills

  let(:subject) { described_class.new }

  describe 'translating companies' do
    before do
      VCR.use_cassette("companies") do
        subject.translate_companies(limit: 10)
      end
    end

    it 'should create any new record in the database' do
      expect(Company.all.size).to be == 10
    end

    it 'should update any existings record' do
      updated_company = Company.by_source_id(41).first

      expect(updated_company.description).to_not be_blank
    end
  end

  describe 'translating jobs' do
    before do
      VCR.use_cassette("offers_with_companies") do
        subject.translate_offers(limit: 10)
      end
    end

    it 'should create any new record in the database' do
      expect(Job.all.size).to be == 10
    end

    it 'should create any skills that doesn\'t exists' do
      expect(Skill.all.size).to be > 1
    end
  end
end