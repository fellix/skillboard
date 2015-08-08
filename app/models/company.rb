class Company < ActiveRecord::Base
  has_many :jobs

  validates :source_id, uniqueness: true

  scope :by_source_id, ->(id) {
    where(source_id: id)
  }

  scope :with_skills, ->(skills) {
    where(%Q{
      EXISTS (
        SELECT 1
        FROM jobs_skills
        JOIN jobs ON jobs.id = jobs_skills.job_id
        WHERE jobs.company_id = companies.id AND
          jobs_skills.skill_id IN (?)
      )
    }, skills)
  }
end
