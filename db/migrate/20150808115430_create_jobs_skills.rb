class CreateJobsSkills < ActiveRecord::Migration
  def change
    create_table :jobs_skills, id: false do |t|
      t.references :job, foreign_key: true
      t.references :skill, foreign_key: true
    end

    add_index :jobs_skills, [:job_id, :skill_id], unique: true
  end
end
