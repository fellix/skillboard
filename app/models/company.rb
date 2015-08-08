class Company < ActiveRecord::Base
  has_many :jobs

  validates :source_id, uniqueness: true

  scope :by_source_id, ->(id) {
    where(source_id: id)
  }
end
