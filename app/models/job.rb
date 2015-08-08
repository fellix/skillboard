class Job < ActiveRecord::Base
  belongs_to :company

  has_and_belongs_to_many :skills

  validates :source_id, uniqueness: true

  scope :by_source_id, ->(id) {
    where(source_id: id)
  }
end
