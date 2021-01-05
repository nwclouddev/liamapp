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

ActiveRecord::Schema.define(version: 2020_09_05_182143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "article_categories", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["category_id"], name: "index_article_categories_on_category_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "bins", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id"
    t.bigint "organization_id", default: 3, null: false
    t.index ["organization_id"], name: "index_bins_on_organization_id"
    t.index ["store_id"], name: "index_bins_on_store_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.bigint "user_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "eqp_object_categories", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.bigint "eqp_object_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "not_used"
    t.index ["code"], name: "index_eqp_object_categories_on_code", unique: true
    t.index ["eqp_object_class_id"], name: "index_eqp_object_categories_on_eqp_object_class_id"
  end

  create_table "eqp_object_classes", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "not_used"
    t.index ["code"], name: "index_eqp_object_classes_on_code", unique: true
  end

  create_table "eqp_object_criticalities", force: :cascade do |t|
    t.integer "seq"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seq", "description"], name: "index_eqp_object_criticalities_on_seq_and_description", unique: true
  end

  create_table "eqp_object_statuses", force: :cascade do |t|
    t.integer "seq"
    t.string "description"
    t.boolean "active_on_create"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status_code", limit: 2
    t.index ["seq", "description"], name: "index_eqp_object_statuses_on_seq_and_description", unique: true
  end

  create_table "eqp_objects", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.string "alias"
    t.date "commission_date"
    t.string "manufact"
    t.string "manufact_model"
    t.string "revision"
    t.bigint "eqp_profile_id"
    t.string "profile_applied"
    t.boolean "not_used"
    t.bigint "eqp_object_class_id", null: false
    t.bigint "eqp_object_category_id", null: false
    t.bigint "eqp_object_status_id", null: false
    t.bigint "eqp_object_criticality_id"
    t.bigint "functional_area_id"
    t.bigint "lane_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organization_id", null: false
    t.string "num_des"
    t.string "status_code", limit: 2
    t.bigint "manufacturer_id"
    t.string "eqp_category"
    t.index ["eqp_object_category_id"], name: "index_eqp_objects_on_eqp_object_category_id"
    t.index ["eqp_object_class_id"], name: "index_eqp_objects_on_eqp_object_class_id"
    t.index ["eqp_object_criticality_id"], name: "index_eqp_objects_on_eqp_object_criticality_id"
    t.index ["eqp_object_status_id"], name: "index_eqp_objects_on_eqp_object_status_id"
    t.index ["eqp_profile_id"], name: "index_eqp_objects_on_eqp_profile_id"
    t.index ["functional_area_id"], name: "index_eqp_objects_on_functional_area_id"
    t.index ["lane_type_id"], name: "index_eqp_objects_on_lane_type_id"
    t.index ["manufacturer_id"], name: "index_eqp_objects_on_manufacturer_id"
    t.index ["organization_id", "code"], name: "index_eqp_objects_on_organization_id_and_code", unique: true
    t.index ["organization_id"], name: "index_eqp_objects_on_organization_id"
  end

  create_table "eqp_profiles", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.string "manufact"
    t.string "manufact_model"
    t.boolean "not_used"
    t.bigint "eqp_object_class_id", null: false
    t.bigint "eqp_object_category_id", null: false
    t.bigint "eqp_object_status_id", null: false
    t.bigint "eqp_object_criticality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "manufacturer_id"
    t.string "obj_type"
    t.index ["code"], name: "index_eqp_profiles_on_code", unique: true
    t.index ["eqp_object_category_id"], name: "index_eqp_profiles_on_eqp_object_category_id"
    t.index ["eqp_object_class_id"], name: "index_eqp_profiles_on_eqp_object_class_id"
    t.index ["eqp_object_criticality_id"], name: "index_eqp_profiles_on_eqp_object_criticality_id"
    t.index ["eqp_object_status_id"], name: "index_eqp_profiles_on_eqp_object_status_id"
    t.index ["manufacturer_id"], name: "index_eqp_profiles_on_manufacturer_id"
  end

  create_table "event_components", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_event_components_on_code", unique: true
  end

  create_table "event_eqp_groups", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "not_used"
    t.index ["code"], name: "index_event_eqp_groups_on_code", unique: true
  end

  create_table "event_failures", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_event_failures_on_code", unique: true
  end

  create_table "event_priorities", force: :cascade do |t|
    t.integer "seq"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seq"], name: "index_event_priorities_on_seq", unique: true
  end

  create_table "event_problems", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_event_problems_on_code", unique: true
  end

  create_table "event_statuses", force: :cascade do |t|
    t.integer "seq"
    t.string "description"
    t.boolean "active_event"
    t.boolean "active_on_create"
    t.boolean "active_on_update"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seq"], name: "index_event_statuses_on_seq", unique: true
  end

  create_table "event_types", force: :cascade do |t|
    t.integer "seq"
    t.string "description"
    t.boolean "user_createable"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seq"], name: "index_event_types_on_seq", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "eqp_object_id", null: false
    t.string "description"
    t.bigint "event_type_id", null: false
    t.bigint "event_status_id", null: false
    t.bigint "event_priority_id", null: false
    t.bigint "user_id", null: false
    t.date "sched_start_date"
    t.date "sched_end_date"
    t.decimal "total_labor"
    t.decimal "estimated_hours"
    t.integer "pm_schedule_id"
    t.date "due_date"
    t.date "date_completed"
    t.boolean "reopened"
    t.integer "completed_by_id"
    t.integer "event_eqp_group_id"
    t.integer "event_problem_id"
    t.integer "event_failure_id"
    t.integer "event_component_id"
    t.integer "event_owner"
    t.integer "assigned_to"
    t.decimal "downtime_hours"
    t.string "scheduling_block"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eqp_object_id"], name: "index_events_on_eqp_object_id"
    t.index ["event_priority_id"], name: "index_events_on_event_priority_id"
    t.index ["event_status_id"], name: "index_events_on_event_status_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "functional_areas", force: :cascade do |t|
    t.string "code"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", null: false
    t.index ["code"], name: "index_functional_areas_on_code", unique: true
  end

  create_table "labor_hours", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date_worked"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "hours"
    t.integer "laborable_id"
    t.string "laborable_type"
    t.index ["user_id"], name: "index_labor_hours_on_user_id"
  end

  create_table "lane_types", force: :cascade do |t|
    t.string "code"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", null: false
    t.index ["code"], name: "index_lane_types_on_code", unique: true
  end

  create_table "manufact_parts", force: :cascade do |t|
    t.bigint "part_id", null: false
    t.bigint "manufacturer_id", null: false
    t.string "manufact_part_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_manufact_parts_on_manufacturer_id"
    t.index ["part_id"], name: "index_manufact_parts_on_part_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.string "preferred_supplier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_manufacturers_on_code", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.date "go_live_date"
    t.date "pm_start_date"
    t.integer "pm_generation_lead_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_organizations_on_code", unique: true
  end

  create_table "part_classes", force: :cascade do |t|
    t.string "code"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_part_classes_on_code", unique: true
  end

  create_table "part_uoms", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_part_uoms_on_code", unique: true
  end

  create_table "parts", force: :cascade do |t|
    t.string "description"
    t.bigint "part_class_id", null: false
    t.bigint "part_uom_id", null: false
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "track_cores"
    t.index ["part_class_id"], name: "index_parts_on_part_class_id"
    t.index ["part_uom_id"], name: "index_parts_on_part_uom_id"
  end

  create_table "period_uoms", force: :cascade do |t|
    t.integer "uom_int"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.index ["uom_int"], name: "index_period_uoms_on_uom_int", unique: true
  end

  create_table "pm_schedule_eqp_objects", force: :cascade do |t|
    t.bigint "pm_schedule_id", null: false
    t.bigint "eqp_object_id", null: false
    t.date "due_date"
    t.decimal "est_hours"
    t.integer "eqp_object_org_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eqp_object_id"], name: "index_pm_schedule_eqp_objects_on_eqp_object_id"
    t.index ["pm_schedule_id"], name: "index_pm_schedule_eqp_objects_on_pm_schedule_id"
  end

  create_table "pm_schedules", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.integer "frequency"
    t.boolean "not_used"
    t.float "est_hours"
    t.integer "persons_required"
    t.string "trade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "eqp_profile_id"
    t.integer "period_uom_id"
    t.index ["code"], name: "index_pm_schedules_on_code", unique: true
    t.index ["eqp_profile_id"], name: "index_pm_schedules_on_eqp_profile_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "description"
    t.bigint "organization_id", null: false
    t.date "due_date"
    t.bigint "user_id", null: false
    t.integer "purchase_order_status_id"
    t.integer "supplier_id"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_purchase_orders_on_organization_id"
    t.index ["store_id"], name: "index_purchase_orders_on_store_id"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
  end

  create_table "stock_criticalities", force: :cascade do |t|
    t.integer "seq"
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_stock_criticalities_on_code", unique: true
    t.index ["seq"], name: "index_stock_criticalities_on_seq", unique: true
  end

  create_table "store_parts", force: :cascade do |t|
    t.bigint "part_id", null: false
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.bigint "bin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 0
    t.integer "min_qty"
    t.integer "max_qty"
    t.integer "stock_criticality_id"
    t.bigint "supplier_id"
    t.index ["bin_id"], name: "index_store_parts_on_bin_id"
    t.index ["organization_id"], name: "index_store_parts_on_organization_id"
    t.index ["part_id"], name: "index_store_parts_on_part_id"
    t.index ["store_id"], name: "index_store_parts_on_store_id"
    t.index ["supplier_id"], name: "index_store_parts_on_supplier_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "code"
    t.string "description", null: false
    t.bigint "organization_id", null: false
    t.boolean "not_used", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_stores_on_code", unique: true
    t.index ["organization_id"], name: "index_stores_on_organization_id"
  end

  create_table "supplier_parts", force: :cascade do |t|
    t.bigint "part_id", null: false
    t.bigint "supplier_id", null: false
    t.string "supplier_part_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["part_id"], name: "index_supplier_parts_on_part_id"
    t.index ["supplier_id"], name: "index_supplier_parts_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.boolean "not_used"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "description"
    t.boolean "not_used"
    t.integer "permission_group_id"
    t.bigint "store_id", default: 1, null: false
    t.bigint "organization_id", default: 3, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "bins", "organizations"
  add_foreign_key "comments", "users"
  add_foreign_key "eqp_object_categories", "eqp_object_classes"
  add_foreign_key "eqp_objects", "eqp_object_categories"
  add_foreign_key "eqp_objects", "eqp_object_classes"
  add_foreign_key "eqp_objects", "eqp_object_criticalities"
  add_foreign_key "eqp_objects", "eqp_object_statuses"
  add_foreign_key "eqp_objects", "eqp_profiles"
  add_foreign_key "eqp_objects", "functional_areas"
  add_foreign_key "eqp_objects", "lane_types"
  add_foreign_key "eqp_objects", "manufacturers"
  add_foreign_key "eqp_objects", "organizations"
  add_foreign_key "eqp_profiles", "eqp_object_categories"
  add_foreign_key "eqp_profiles", "eqp_object_classes"
  add_foreign_key "eqp_profiles", "eqp_object_criticalities"
  add_foreign_key "eqp_profiles", "eqp_object_statuses"
  add_foreign_key "eqp_profiles", "manufacturers"
  add_foreign_key "events", "eqp_objects"
  add_foreign_key "events", "event_priorities"
  add_foreign_key "events", "event_statuses"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "users"
  add_foreign_key "labor_hours", "users"
  add_foreign_key "manufact_parts", "manufacturers"
  add_foreign_key "manufact_parts", "parts"
  add_foreign_key "parts", "part_classes"
  add_foreign_key "parts", "part_uoms"
  add_foreign_key "pm_schedule_eqp_objects", "eqp_objects"
  add_foreign_key "pm_schedule_eqp_objects", "pm_schedules"
  add_foreign_key "pm_schedules", "eqp_profiles"
  add_foreign_key "pm_schedules", "period_uoms"
  add_foreign_key "purchase_orders", "organizations"
  add_foreign_key "purchase_orders", "stores"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "store_parts", "bins"
  add_foreign_key "store_parts", "organizations"
  add_foreign_key "store_parts", "parts"
  add_foreign_key "store_parts", "stores"
  add_foreign_key "store_parts", "suppliers"
  add_foreign_key "stores", "organizations"
  add_foreign_key "supplier_parts", "parts"
  add_foreign_key "supplier_parts", "suppliers"
  add_foreign_key "users", "organizations"
  add_foreign_key "users", "stores"
end
