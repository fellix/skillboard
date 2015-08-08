# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150808115430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "logo_url"
    t.string   "website_url"
    t.integer  "source_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "city"
    t.integer  "company_id"
    t.string   "country_name"
    t.string   "currency_code"
    t.boolean  "remote"
    t.boolean  "relocation_paid"
    t.string   "role_description"
    t.decimal  "salary_low"
    t.decimal  "salary_high"
    t.string   "title"
    t.boolean  "work_from_home"
    t.string   "job_type"
    t.integer  "source_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["source_id"], name: "index_jobs_on_source_id", using: :btree

  create_table "jobs_skills", id: false, force: :cascade do |t|
    t.integer "job_id"
    t.integer "skill_id"
  end

  add_index "jobs_skills", ["job_id", "skill_id"], name: "index_jobs_skills_on_job_id_and_skill_id", unique: true, using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs_skills", "jobs"
  add_foreign_key "jobs_skills", "skills"
end
