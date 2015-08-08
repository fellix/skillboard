class Skill < ActiveRecord::Base
  validates :name, uniqueness: true

  scope :ordered, ->{ order(:name) }

  scope :more_frequent_used, -> {
    joins(%Q{
      JOIN (
        SELECT jobs_skills.skill_id, COUNT(jobs_skills.skill_id) frequency
        FROM jobs_skills
        GROUP BY jobs_skills.skill_id
      ) fr ON fr.skill_id = skills.id
      JOIN (
        SELECT AVG(frequency) media
        FROM (
          SELECT jobs_skills.skill_id, COUNT(jobs_skills.skill_id) frequency
          FROM jobs_skills
          GROUP BY jobs_skills.skill_id
        ) x
      ) media ON media.media = media.media
    }).where('fr.frequency >= media.media')
  }

  def to_s
    name
  end
end
