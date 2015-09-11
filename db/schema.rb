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

ActiveRecord::Schema.define(version: 20150903005618) do

  create_table "candidate_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "candidate_skills", ["skill_id"], name: "index_candidate_skills_on_skill_id"
  add_index "candidate_skills", ["user_id"], name: "index_candidate_skills_on_user_id"

  create_table "candidate_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "institution"
    t.string   "course"
    t.string   "year_completed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "opportunities", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.string   "opportunity_status"
    t.string   "name"
    t.string   "tagline"
    t.text     "info"
    t.date     "planned_start_date"
    t.string   "duration"
    t.decimal  "pay"
    t.date     "commencement_date"
    t.date     "completion_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "opportunities", ["organisation_id"], name: "index_opportunities_on_organisation_id"
  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id"

  create_table "opportunity_applications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.string   "introduction"
    t.string   "application_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "opportunity_applications", ["opportunity_id"], name: "index_opportunity_applications_on_opportunity_id"
  add_index "opportunity_applications", ["user_id"], name: "index_opportunity_applications_on_user_id"

  create_table "opportunity_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "opportunity_skills", ["project_id"], name: "index_opportunity_skills_on_project_id"
  add_index "opportunity_skills", ["skill_id"], name: "index_opportunity_skills_on_skill_id"

  create_table "org_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "org_users", ["organisation_id"], name: "index_org_users_on_organisation_id"
  add_index "org_users", ["user_id"], name: "index_org_users_on_user_id"

  create_table "organisation_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.integer  "organisation_type_id"
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "logo"
    t.string   "website"
    t.string   "acara_school_id"
    t.string   "school_type"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "organisations", ["organisation_type_id"], name: "index_organisations_on_organisation_type_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.text     "bio"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "phone"
    t.string   "website"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "candidate_type_id"
  end

  add_index "profiles", ["candidate_type_id"], name: "index_profiles_on_candidate_type_id"
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "security_checks", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "number"
    t.date     "expiry_date"
    t.boolean  "checked"
    t.integer  "checked_by"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "security_checks", ["user_id"], name: "index_security_checks_on_user_id"

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "skill_category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
