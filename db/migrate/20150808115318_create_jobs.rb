class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :city
      t.references :company, index: true, foreign_key: true
      t.string :country_name
      t.string :currency_code
      t.boolean :remote
      t.boolean :relocation_paid
      t.string :role_description
      t.decimal :salary_low
      t.decimal :salary_high
      t.string :title
      t.boolean :work_from_home
      t.string :job_type
      t.integer :source_id, index: true

      t.timestamps null: false
    end
  end
end
