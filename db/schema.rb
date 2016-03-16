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

ActiveRecord::Schema.define(version: 20160316032356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "guid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "admins", ["user_id"], name: "index_admins_on_user_id", using: :btree

  create_table "agreements", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "ethics",          default: false
    t.boolean  "code_of_conduct", default: false
    t.boolean  "candidate_terms", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "host_terms",      default: false
    t.boolean  "sponsor_terms",   default: false
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

  create_table "engagement_token_packs", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price_ex_gst"
    t.integer  "number_of_tokens"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.decimal  "gst_rate",         default: 0.1
  end

  create_table "engagements", force: :cascade do |t|
    t.integer  "opportunity_id"
    t.integer  "profile_id"
    t.string   "status",                default: "pending"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "progress_report_ids",   default: [],                     array: true
    t.integer  "completion_report_ids", default: [],                     array: true
  end

  add_index "engagements", ["opportunity_id"], name: "index_engagements_on_opportunity_id", using: :btree
  add_index "engagements", ["profile_id"], name: "index_engagements_on_profile_id", using: :btree

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

  create_table "expression_of_interests", force: :cascade do |t|
    t.integer  "sponsor_id"
    t.integer  "opportunity_id"
    t.boolean  "approved",       default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "expression_of_interests", ["opportunity_id"], name: "index_expression_of_interests_on_opportunity_id", using: :btree
  add_index "expression_of_interests", ["sponsor_id"], name: "index_expression_of_interests_on_sponsor_id", using: :btree

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

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "opportunity_id"
    t.text     "message_text"
    t.string   "status",         default: "unread"
    t.string   "attachment"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "from"
    t.integer  "to"
  end

  add_index "messages", ["opportunity_id"], name: "index_messages_on_opportunity_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "opportunities", force: :cascade do |t|
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.string   "opportunity_status", default: "draft"
    t.string   "title"
    t.text     "description"
    t.string   "pay"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "paid_engagement",    default: false
    t.text     "experiences"
    t.text     "employment_terms"
    t.integer  "school_year_id"
    t.integer  "skill_id"
    t.integer  "number_of_tokens",   default: 0
    t.boolean  "archived",           default: false
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

  create_table "opportunity_school_years", force: :cascade do |t|
    t.integer  "opportunity_id"
    t.integer  "school_year_id"
    t.integer  "number_of_students", default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "opportunity_school_years", ["opportunity_id"], name: "index_opportunity_school_years_on_opportunity_id", using: :btree
  add_index "opportunity_school_years", ["school_year_id"], name: "index_opportunity_school_years_on_school_year_id", using: :btree

  create_table "opportunity_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "opportunity_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "opportunity_skills", ["opportunity_id"], name: "index_opportunity_skills_on_opportunity_id", using: :btree
  add_index "opportunity_skills", ["skill_id"], name: "index_opportunity_skills_on_skill_id", using: :btree

  create_table "opportunity_times", force: :cascade do |t|
    t.string   "day"
    t.string   "frequency"
    t.integer  "opportunity_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
  end

  add_index "opportunity_times", ["opportunity_id"], name: "index_opportunity_times_on_opportunity_id", using: :btree

  create_table "org_user_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "position"
    t.string   "guid"
    t.integer  "user_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "org_creator",                      default: false
    t.integer  "connections",                      default: [],                 array: true
    t.string   "agency"
    t.integer  "number_of_tokens_for_independent", default: 0
    t.boolean  "approved",                         default: false
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
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
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "number_of_tokens",     default: 0
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
    t.integer  "connections",       default: [],                     array: true
    t.boolean  "approved",          default: false
  end

  add_index "profiles", ["candidate_type_id"], name: "index_profiles_on_candidate_type_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "opportunity_id"
    t.string   "report_type"
    t.string   "relevant_knowledge"
    t.text     "relevant_knowledge_comment"
    t.string   "punctual"
    t.text     "punctual_comment"
    t.string   "communication"
    t.text     "communication_comment"
    t.string   "enthusiasm"
    t.text     "enthusiasm_comment"
    t.string   "professionalism"
    t.text     "professionalism_comment"
    t.text     "stength"
    t.text     "further_dev"
    t.text     "general_comments"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "profile_id"
    t.integer  "engagement_id"
    t.datetime "engagement_start_date"
    t.datetime "engagement_end_date"
  end

  add_index "reports", ["engagement_id"], name: "index_reports_on_engagement_id", using: :btree
  add_index "reports", ["opportunity_id"], name: "index_reports_on_opportunity_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "verified",          default: false
    t.string   "verification_code", default: "not verified"
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
    t.text     "message"
  end

  add_index "skill_verifications", ["guid"], name: "index_skill_verifications_on_guid", using: :btree
  add_index "skill_verifications", ["user_id"], name: "index_skill_verifications_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "skill_category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "approved",          default: false
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organisation"
    t.string   "position"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "guid"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "logo"
  end

  add_index "sponsors", ["user_id"], name: "index_sponsors_on_user_id", using: :btree

  create_table "subscription_packs", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price_ex_gst"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "gst_rate",     default: 0.1
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "user_type"
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.datetime "expiry_date"
    t.decimal  "payment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "notified_at"
  end

  add_index "subscriptions", ["organisation_id"], name: "index_subscriptions_on_organisation_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "token_purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.integer  "number_of_tokens"
    t.decimal  "payment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "token_purchases", ["organisation_id"], name: "index_token_purchases_on_organisation_id", using: :btree
  add_index "token_purchases", ["user_id"], name: "index_token_purchases_on_user_id", using: :btree

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

  add_foreign_key "admins", "users"
  add_foreign_key "agreements", "users"
  add_foreign_key "candidate_skill_verifications", "candidate_skills"
  add_foreign_key "candidate_skill_verifications", "skill_verifications"
  add_foreign_key "candidate_skills", "skills"
  add_foreign_key "candidate_skills", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "engagements", "opportunities"
  add_foreign_key "engagements", "profiles"
  add_foreign_key "expression_of_interests", "opportunities"
  add_foreign_key "expression_of_interests", "sponsors"
  add_foreign_key "messages", "opportunities"
  add_foreign_key "messages", "users"
  add_foreign_key "opportunities", "organisations"
  add_foreign_key "opportunities", "school_years"
  add_foreign_key "opportunities", "skills"
  add_foreign_key "opportunities", "users"
  add_foreign_key "opportunity_applications", "opportunities"
  add_foreign_key "opportunity_applications", "users"
  add_foreign_key "opportunity_school_years", "opportunities"
  add_foreign_key "opportunity_school_years", "school_years"
  add_foreign_key "opportunity_skills", "opportunities"
  add_foreign_key "opportunity_skills", "skills"
  add_foreign_key "opportunity_times", "opportunities"
  add_foreign_key "org_user_profiles", "users"
  add_foreign_key "org_users", "organisations"
  add_foreign_key "org_users", "users"
  add_foreign_key "organisations", "organisation_types"
  add_foreign_key "profiles", "candidate_types"
  add_foreign_key "profiles", "users"
  add_foreign_key "reports", "engagements"
  add_foreign_key "reports", "opportunities"
  add_foreign_key "security_checks", "users"
  add_foreign_key "skill_verifications", "users"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "sponsors", "users"
  add_foreign_key "subscriptions", "organisations"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "token_purchases", "organisations"
  add_foreign_key "token_purchases", "users"
end
