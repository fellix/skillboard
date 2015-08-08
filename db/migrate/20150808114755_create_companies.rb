class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :logo_url
      t.string :website_url
      t.integer :source_id

      t.timestamps null: false
    end
  end
end
