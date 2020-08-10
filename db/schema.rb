# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_21_183643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "apply_jobs", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "job_opportunity_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "feedback"
    t.index ["candidate_id"], name: "index_apply_jobs_on_candidate_id"
    t.index ["job_opportunity_id"], name: "index_apply_jobs_on_job_opportunity_id"
  end

  create_table "awnser_proposals", force: :cascade do |t|
    t.bigint "choice_id", null: false
    t.string "awnser_message"
    t.bigint "proposal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["choice_id"], name: "index_awnser_proposals_on_choice_id"
    t.index ["proposal_id"], name: "index_awnser_proposals_on_proposal_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.date "date_of_birth"
    t.string "profile_description"
    t.string "experience"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "formation"
    t.string "courses"
    t.bigint "level_id"
    t.string "profession"
    t.string "feedback"
    t.index ["level_id"], name: "index_candidates_on_level_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string "option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "headhunter_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_comments_on_candidate_id"
    t.index ["headhunter_id"], name: "index_comments_on_headhunter_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "message"
    t.bigint "apply_job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "choice_id", null: false
    t.index ["apply_job_id"], name: "index_feedbacks_on_apply_job_id"
    t.index ["choice_id"], name: "index_feedbacks_on_choice_id"
  end

  create_table "headhunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_headhunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_headhunters_on_reset_password_token", unique: true
  end

  create_table "interviews", force: :cascade do |t|
    t.date "interview_date"
    t.time "hour"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_opportunity_id", null: false
    t.bigint "candidate_id", null: false
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
    t.index ["job_opportunity_id"], name: "index_interviews_on_job_opportunity_id"
  end

  create_table "job_opportunities", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "description_job"
    t.string "skills"
    t.decimal "salary_range"
    t.bigint "level_id", null: false
    t.date "deadline"
    t.string "region"
    t.string "benefits"
    t.string "office_functions"
    t.string "company_expectations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "headhunter_id", null: false
    t.index ["headhunter_id"], name: "index_job_opportunities_on_headhunter_id"
    t.index ["level_id"], name: "index_job_opportunities_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string "message"
    t.bigint "job_opportunity_id", null: false
    t.bigint "candidate_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_proposals_on_candidate_id"
    t.index ["job_opportunity_id"], name: "index_proposals_on_job_opportunity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apply_jobs", "candidates"
  add_foreign_key "apply_jobs", "job_opportunities"
  add_foreign_key "awnser_proposals", "choices"
  add_foreign_key "awnser_proposals", "proposals"
  add_foreign_key "candidates", "levels"
  add_foreign_key "candidates", "users"
  add_foreign_key "comments", "candidates"
  add_foreign_key "comments", "headhunters"
  add_foreign_key "feedbacks", "apply_jobs"
  add_foreign_key "feedbacks", "choices"
  add_foreign_key "interviews", "candidates"
  add_foreign_key "interviews", "job_opportunities"
  add_foreign_key "job_opportunities", "headhunters"
  add_foreign_key "job_opportunities", "levels"
  add_foreign_key "proposals", "candidates"
  add_foreign_key "proposals", "job_opportunities"
end
