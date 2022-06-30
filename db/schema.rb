# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_30_020000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index %w[message_id message_checksum], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index %w[record_type record_id name], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index %w[record_type record_id name blob_id], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index %w[blob_id variation_digest], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "course_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_course_categories_on_code"
    t.index ["lft"], name: "index_course_categories_on_lft"
    t.index ["parent_id"], name: "index_course_categories_on_parent_id"
    t.index ["rgt"], name: "index_course_categories_on_rgt"
  end

  create_table "course_chapters", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.integer "seq", limit: 2, null: false
    t.string "title", null: false
    t.string "folder", null: false
    t.integer "pages", limit: 2, null: false
    t.integer "study_time", default: 60
    t.string "file_prefix"
    t.string "file_ext", default: "html"
    t.string "start_name", default: "01"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_chapters_on_course_id"
  end

  create_table "course_details", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "support_devise"
    t.string "content_type"
    t.text "intro_info"
    t.text "goal_info"
    t.text "target_info"
    t.text "tutor_info"
    t.integer "study_point"
    t.integer "period", default: 30
    t.integer "total_time", default: 30
    t.integer "price", default: 0
    t.string "price_info"
    t.decimal "score_progress", precision: 5, scale: 2
    t.decimal "score_exam", precision: 5, scale: 2
    t.decimal "score_report", precision: 5, scale: 2
    t.string "score_info"
    t.string "pass_info"
    t.boolean "certificate", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_details_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "course_category_id", null: false
    t.string "code", null: false
    t.string "title", null: false
    t.string "path", null: false
    t.integer "width", default: 1280, null: false
    t.integer "height", default: 720, null: false
    t.bigint "author_id", null: false
    t.bigint "pm_id"
    t.bigint "cp_id"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_courses_on_author_id"
    t.index ["course_category_id"], name: "index_courses_on_course_category_id"
    t.index ["cp_id"], name: "index_courses_on_cp_id"
    t.index ["pm_id"], name: "index_courses_on_pm_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "category", default: "notice"
    t.string "status", default: "draft"
    t.string "title", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.string "ip", default: "127.0.0.1"
    t.integer "reading", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "course_chapters", "courses"
  add_foreign_key "course_details", "courses"
  add_foreign_key "courses", "course_categories"
  add_foreign_key "courses", "users", column: "author_id"
  add_foreign_key "courses", "users", column: "cp_id"
  add_foreign_key "courses", "users", column: "pm_id"
  add_foreign_key "posts", "users"
end
