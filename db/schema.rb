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

ActiveRecord::Schema.define(version: 20151105035956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "ethics",          default: false
    t.boolean  "code_of_conduct", default: false
    t.boolean  "terms",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "agreements", ["user_id"], name: "index_agreements_on_user_id", using: :btree

  create_table "candidate_skill_verifications", force: :cascade do |t|
    t.integer  "candidate_skill_id"
    t.integer  "skill_verification_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "candidate_skill_verifications", ["candidate_skill_id"], name: "index_candidate_skill_verifications_on_candidate_skill_id", using: :btree
  add_index "candidate_skill_verifications", ["skill_verification_id"], name: "index_candidate_skill_verifications_on_skill_verification_id", using: :btree

  create_table "candidate_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "verified",    default: false
    t.string   "skill_level"
  end

  add_index "candidate_skills", ["skill_id"], name: "index_candidate_skills_on_skill_id", using: :btree
  add_index "candidate_skills", ["user_id"], name: "index_candidate_skills_on_user_id", using: :btree

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
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "terms"
    t.boolean  "verified",       default: false
    t.string   "achievement"
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string   "enquiry_type"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "opportunities", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.string   "opportunity_status", default: "draft"
    t.string   "title"
    t.text     "description"
    t.string   "pay"
    t.date     "commencement_date"
    t.date     "completion_date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "paid_engagement",    default: false
    t.text     "specific_skills"
    t.text     "experiences"
    t.text     "employment_terms"
    t.integer  "school_year_id"
    t.integer  "skill_id"
  end

  add_index "opportunities", ["organisation_id"], name: "index_opportunities_on_organisation_id", using: :btree
  add_index "opportunities", ["school_year_id"], name: "index_opportunities_on_school_year_id", using: :btree
  add_index "opportunities", ["skill_id"], name: "index_opportunities_on_skill_id", using: :btree
  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id", using: :btree

  create_table "opportunity_applications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.string   "introduction"
    t.string   "application_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "opportunity_applications", ["opportunity_id"], name: "index_opportunity_applications_on_opportunity_id", using: :btree
  add_index "opportunity_applications", ["user_id"], name: "index_opportunity_applications_on_user_id", using: :btree

  create_table "opportunity_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "opportunity_id"
  end

  add_index "opportunity_skills", ["opportunity_id"], name: "index_opportunity_skills_on_opportunity_id", using: :btree
  add_index "opportunity_skills", ["skill_id"], name: "index_opportunity_skills_on_skill_id", using: :btree

  create_table "org_user_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "position"
    t.string   "guid"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "org_creator", default: false
  end

  add_index "org_user_profiles", ["guid"], name: "index_org_user_profiles_on_guid", using: :btree
  add_index "org_user_profiles", ["user_id"], name: "index_org_user_profiles_on_user_id", using: :btree

  create_table "org_users", force: :cascade do |t|
    t.boolean  "admin_status",    default: false
    t.boolean  "verified_status", default: false
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "org_users", ["organisation_id"], name: "index_org_users_on_organisation_id", using: :btree
  add_index "org_users", ["user_id"], name: "index_org_users_on_user_id", using: :btree

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

  add_index "organisations", ["organisation_type_id"], name: "index_organisations_on_organisation_type_id", using: :btree

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
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "candidate_type_id"
    t.date     "dob"
    t.string   "status",            default: "pending"
  end

  add_index "profiles", ["candidate_type_id"], name: "index_profiles_on_candidate_type_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "school_year_opportunities", force: :cascade do |t|
    t.integer  "school_year_id"
    t.integer  "opportunity_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "school_year_opportunities", ["opportunity_id"], name: "index_school_year_opportunities_on_opportunity_id", using: :btree
  add_index "school_year_opportunities", ["school_year_id"], name: "index_school_year_opportunities_on_school_year_id", using: :btree

  create_table "school_years", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "security_checks", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "number"
    t.date     "expiry_date"
    t.integer  "checked_by"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "verified",    default: false
  end

  add_index "security_checks", ["user_id"], name: "index_security_checks_on_user_id", using: :btree

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skill_verifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "referree_name"
    t.string   "referree_email"
    t.string   "referree_phone"
    t.string   "referree_relationship"
    t.string   "time_known"
    t.integer  "work_ethic"
    t.integer  "communication"
    t.integer  "presentation"
    t.text     "accomplishments"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "guid"
    t.boolean  "approve"
    t.text     "message"
  end

  add_index "skill_verifications", ["guid"], name: "index_skill_verifications_on_guid", using: :btree
  add_index "skill_verifications", ["user_id"], name: "index_skill_verifications_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "skill_category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "opportunities", "school_years"
  add_foreign_key "opportunities", "skills"
  add_foreign_key "opportunity_skills", "opportunities"
  add_foreign_key "org_user_profiles", "users"
  add_foreign_key "org_users", "organisations"
  add_foreign_key "org_users", "users"
  add_foreign_key "school_year_opportunities", "opportunities"
  add_foreign_key "school_year_opportunities", "school_years"
end
