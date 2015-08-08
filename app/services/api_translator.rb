class ApiTranslator
  def self.translate
    new.translate
  end

  def translate(options = {})
    translate_companies(options) && translate_offers(options)
  end

  def translate_companies(options = {})
    list = Api::Companies.list(options)

    list.each do |company_data|
      translate_company(company_data)
    end

    true
  end

  protected
  def translate_company(company_data)
    company = Company.by_source_id(company_data['id']).first

    company ||= Company.new
    company.assign_attributes(
      name: company_data['name'],
      description: company_data['description'],
      logo_url: company_data['logo_url'],
      website_url: company_data['website_url'],
      source_id: company_data['id']
    )

    company.save

    company
  end

  public
  def translate_offers(options = {})
    list = Api::Jobs.list(options)

    list.each do |offer_data|
      translate_offer(offer_data)
    end

    true
  end

  protected
  def translate_offer(offer_data)
    offer = Job.by_source_id(offer_data['id']).first

    company = load_company(offer_data['company_id'])

    offer ||= Job.new
    offer.assign_attributes(
      company: company,
      city: offer_data['city'],
      country_name: offer_data['country_name'],
      currency_code: offer_data['currency_code'],
      remote: offer_data['remote'],
      relocation_paid: offer_data['relocation_paid'],
      role_description: offer_data['role_description'],
      salary_low: offer_data['salary_low'],
      salary_high: offer_data['salary_high'],
      title: offer_data['title'],
      work_from_home: offer_data['work_from_home'],
      job_type: offer_data['type'],
      source_id: offer_data['id']
    )

    offer.skills = load_skills(offer_data['tags'])

    offer.save

    offer
  end

  def load_company(id)
    begin
      company = Company.find(id)
    rescue ActiveRecord::RecordNotFound
      company = translate_company(Api::Companies.get(id))
    end
  end

  def load_skills(skills_list)
    skills_list.map do |skill_name|
      skill = Skill.where(name: skill_name).first

      skill || Skill.create(name: skill_name)
    end
  end
end