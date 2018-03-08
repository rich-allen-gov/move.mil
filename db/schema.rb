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

ActiveRecord::Schema.define(version: 20180308042027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_of_service_contacts", force: :cascade do |t|
    t.text "custsvc_org"
    t.text "custsvc_dsn"
    t.text "custsvc_tel_comm"
    t.text "custsvc_tel_tollfree"
    t.text "custsvc_email"
    t.text "custsvc_hours"
    t.text "custsvc_url"
    t.text "custsvc_facebook_url"
    t.text "claims_dsn"
    t.text "claims_tel_comm"
    t.text "claims_tel_tollfree"
    t.text "claims_fax_dsn"
    t.text "claims_fax_comm"
    t.text "claims_fax_tollfree"
    t.text "claims_email"
    t.text "claims_post"
    t.text "retiree_dsn"
    t.text "retiree_tel_comm"
    t.text "retiree_tel_tollfree"
    t.text "retiree_fax_dsn"
    t.text "retiree_fax_comm"
    t.text "retiree_fax_tollfree"
    t.text "retiree_email"
    t.text "retiree_post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "claims_url"
    t.bigint "branch_of_service_id"
    t.text "ppm_website"
    t.text "ppm_tel_comm"
    t.index ["branch_of_service_id"], name: "index_branch_of_service_contacts_on_branch_of_service_id"
  end

  create_table "branch_of_services", force: :cascade do |t|
    t.string "name", null: false
    t.integer "display_order", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dtod_zip3_distances", force: :cascade do |t|
    t.integer "orig_zip3"
    t.integer "dest_zip3"
    t.float "dist_mi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entitlements", force: :cascade do |t|
    t.string "rank", null: false
    t.integer "total_weight_self", null: false
    t.integer "total_weight_self_plus_dependents"
    t.integer "pro_gear_weight"
    t.integer "pro_gear_weight_spouse"
    t.text "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question", null: false
    t.text "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "category"
  end

  create_table "full_packs", force: :cascade do |t|
    t.integer "schedule"
    t.int4range "weight_lbs"
    t.decimal "rate", precision: 7, scale: 2
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "full_unpacks", force: :cascade do |t|
    t.integer "schedule"
    t.decimal "rate", precision: 8, scale: 5
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "household_good_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_household_good_categories_on_name", unique: true
  end

  create_table "household_goods", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.bigint "household_good_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_good_category_id"], name: "index_household_goods_on_household_good_category_id"
  end

  create_table "linehauls", force: :cascade do |t|
    t.int4range "dist_mi"
    t.int4range "weight_lbs"
    t.integer "rate"
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.text "street_address"
    t.text "extended_address"
    t.text "locality"
    t.text "region"
    t.text "region_code"
    t.text "postal_code"
    t.text "country_name"
    t.text "country_code"
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "refinery_authentication_devise_roles", id: :serial, force: :cascade do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id"
    t.index ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id"
  end

  create_table "refinery_authentication_devise_user_plugins", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "position"
    t.index ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name"
    t.index ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true
  end

  create_table "refinery_authentication_devise_users", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.datetime "remember_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "full_name"
    t.index ["id"], name: "index_refinery_authentication_devise_users_on_id"
    t.index ["slug"], name: "index_refinery_authentication_devise_users_on_slug"
  end

  create_table "refinery_blog_categories", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.index ["id"], name: "index_refinery_blog_categories_on_id"
    t.index ["slug"], name: "index_refinery_blog_categories_on_slug"
  end

  create_table "refinery_blog_categories_blog_posts", id: :serial, force: :cascade do |t|
    t.integer "blog_category_id"
    t.integer "blog_post_id"
    t.index ["blog_category_id", "blog_post_id"], name: "index_blog_categories_blog_posts_on_bc_and_bp"
  end

  create_table "refinery_blog_category_translations", force: :cascade do |t|
    t.integer "refinery_blog_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_blog_category_translations_on_locale"
    t.index ["refinery_blog_category_id"], name: "index_a0315945e6213bbe0610724da0ee2de681b77c31"
  end

  create_table "refinery_blog_comments", id: :serial, force: :cascade do |t|
    t.integer "blog_post_id"
    t.boolean "spam"
    t.string "name"
    t.string "email"
    t.text "body"
    t.string "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["blog_post_id"], name: "index_refinery_blog_comments_on_blog_post_id"
    t.index ["id"], name: "index_refinery_blog_comments_on_id"
  end

  create_table "refinery_blog_post_translations", force: :cascade do |t|
    t.integer "refinery_blog_post_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.text "custom_teaser"
    t.string "custom_url"
    t.string "slug"
    t.string "title"
    t.index ["locale"], name: "index_refinery_blog_post_translations_on_locale"
    t.index ["refinery_blog_post_id"], name: "index_refinery_blog_post_translations_on_refinery_blog_post_id"
  end

  create_table "refinery_blog_posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "draft"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "custom_url"
    t.text "custom_teaser"
    t.string "source_url"
    t.string "source_url_title"
    t.integer "access_count", default: 0
    t.string "slug"
    t.string "username"
    t.index ["access_count"], name: "index_refinery_blog_posts_on_access_count"
    t.index ["id"], name: "index_refinery_blog_posts_on_id"
    t.index ["slug"], name: "index_refinery_blog_posts_on_slug"
  end

  create_table "refinery_image_translations", force: :cascade do |t|
    t.integer "refinery_image_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_alt"
    t.string "image_title"
    t.index ["locale"], name: "index_refinery_image_translations_on_locale"
    t.index ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id"
  end

  create_table "refinery_images", id: :serial, force: :cascade do |t|
    t.string "image_mime_type"
    t.string "image_name"
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer "refinery_page_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["locale"], name: "index_refinery_page_part_translations_on_locale"
    t.index ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"
  end

  create_table "refinery_page_parts", id: :serial, force: :cascade do |t|
    t.integer "refinery_page_id"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title"
    t.index ["id"], name: "index_refinery_page_parts_on_id"
    t.index ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id"
  end

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer "refinery_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "custom_slug"
    t.string "menu_title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_page_translations_on_locale"
    t.index ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"
  end

  create_table "refinery_pages", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "path"
    t.boolean "show_in_menu", default: true
    t.string "link_url"
    t.string "menu_match"
    t.boolean "deletable", default: true
    t.boolean "draft", default: false
    t.boolean "skip_to_first_child", default: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "view_template"
    t.string "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["depth"], name: "index_refinery_pages_on_depth"
    t.index ["id"], name: "index_refinery_pages_on_id"
    t.index ["lft"], name: "index_refinery_pages_on_lft"
    t.index ["parent_id"], name: "index_refinery_pages_on_parent_id"
    t.index ["rgt"], name: "index_refinery_pages_on_rgt"
  end

  create_table "refinery_resource_translations", force: :cascade do |t|
    t.integer "refinery_resource_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_title"
    t.index ["locale"], name: "index_refinery_resource_translations_on_locale"
    t.index ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id"
  end

  create_table "refinery_resources", id: :serial, force: :cascade do |t|
    t.string "file_mime_type"
    t.string "file_name"
    t.integer "file_size"
    t.string "file_uid"
    t.string "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.boolean "destroyable", default: true
    t.string "scoping"
    t.boolean "restricted", default: false
    t.string "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "title"
    t.index ["name"], name: "index_refinery_settings_on_name"
  end

  create_table "seo_meta", id: :serial, force: :cascade do |t|
    t.integer "seo_meta_id"
    t.string "seo_meta_type"
    t.string "browser_title"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_seo_meta_on_id"
    t.index ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"
  end

  create_table "service_areas", force: :cascade do |t|
    t.integer "service_area"
    t.text "name"
    t.integer "services_schedule"
    t.decimal "linehaul_factor", precision: 7, scale: 2
    t.decimal "orig_dest_service_charge", precision: 7, scale: 2
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_specific_posts", force: :cascade do |t|
    t.text "title"
    t.date "effective_at"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_of_service_id"
    t.index ["branch_of_service_id"], name: "index_service_specific_posts_on_branch_of_service_id"
  end

  create_table "shipping_offices", force: :cascade do |t|
    t.text "name", null: false
    t.json "email_addresses", default: []
    t.json "phone_numbers", default: []
    t.json "urls", default: []
    t.text "services", default: [], array: true
    t.text "hours"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shorthauls", force: :cascade do |t|
    t.int4range "cwt_mi"
    t.decimal "rate", precision: 7, scale: 2
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context"
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "top_tsp_by_channel_linehaul_discounts", force: :cascade do |t|
    t.text "orig"
    t.text "dest"
    t.daterange "tdl"
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tdl"], name: "index_top_tsp_by_channel_linehaul_discounts_on_tdl"
  end

  create_table "transportation_offices", force: :cascade do |t|
    t.bigint "shipping_office_id"
    t.text "name", null: false
    t.json "email_addresses", default: []
    t.json "phone_numbers", default: []
    t.json "urls", default: []
    t.text "services", default: [], array: true
    t.text "hours"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_office_id"], name: "index_transportation_offices_on_shipping_office_id"
  end

  create_table "tutorial_steps", force: :cascade do |t|
    t.bigint "tutorial_id"
    t.text "content", null: false
    t.text "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "pro_tip"
    t.index ["tutorial_id"], name: "index_tutorial_steps_on_tutorial_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.text "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slug", null: false
    t.integer "display_order"
  end

  create_table "weight_scales", force: :cascade do |t|
    t.text "name", null: false
    t.json "email_addresses", default: []
    t.json "phone_numbers", default: []
    t.json "urls", default: []
    t.text "hours"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zip3s", force: :cascade do |t|
    t.integer "zip3"
    t.text "basepoint_city"
    t.text "state"
    t.integer "service_area"
    t.text "rate_area"
    t.integer "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zip5_rate_areas", force: :cascade do |t|
    t.integer "zip5"
    t.text "rate_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branch_of_service_contacts", "branch_of_services"
  add_foreign_key "household_goods", "household_good_categories"
  add_foreign_key "service_specific_posts", "branch_of_services"
  add_foreign_key "transportation_offices", "shipping_offices"
  add_foreign_key "tutorial_steps", "tutorials"
end
