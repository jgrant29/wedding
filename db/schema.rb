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

ActiveRecord::Schema.define(version: 2019_01_11_215352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "abouts", id: :serial, force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current_about", default: false
  end

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "popover"
    t.string "pin"
    t.string "boolean"
    t.string "slug"
    t.boolean "stickey"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "announcements_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "announcement_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "authors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.text "description"
    t.integer "book_id"
    t.integer "state_taxonomy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "contact"
    t.string "slug"
    t.index ["book_id"], name: "index_authors_on_book_id"
    t.index ["state_taxonomy_id"], name: "index_authors_on_state_taxonomy_id"
  end

  create_table "authors_blogs", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "blog_id", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.index ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id"
    t.index ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id"
  end

  create_table "authors_chambers", id: false, force: :cascade do |t|
    t.integer "chamber_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id", "chamber_id"], name: "index_authors_chambers_on_author_id_and_chamber_id"
    t.index ["chamber_id", "author_id"], name: "index_authors_chambers_on_chamber_id_and_author_id"
  end

  create_table "authors_events", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "event_id", null: false
  end

  create_table "authors_law_firms", id: false, force: :cascade do |t|
    t.integer "law_firm_id", null: false
    t.integer "author_id", null: false
  end

  create_table "authors_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id", "product_id"], name: "index_authors_products_on_author_id_and_product_id"
    t.index ["product_id", "author_id"], name: "index_authors_products_on_product_id_and_author_id"
  end

  create_table "authors_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "blog_categories", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "slug"
  end

  create_table "blog_categories_blogs", id: false, force: :cascade do |t|
    t.integer "blog_category_id", null: false
    t.integer "blog_id", null: false
  end

  create_table "blog_categories_events", id: false, force: :cascade do |t|
    t.integer "blog_category_id", null: false
    t.integer "event_id", null: false
  end

  create_table "blogs", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published"
    t.string "subject"
    t.string "slug"
    t.string "avatar"
    t.text "front_description"
    t.boolean "remove_avatar"
    t.string "authored_by"
    t.string "keywords"
    t.string "string"
    t.datetime "oth_edit_date"
    t.string "pdf_blog"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
  end

  create_table "blogs_law_firms", id: false, force: :cascade do |t|
    t.integer "law_firm_id", null: false
    t.integer "blog_id", null: false
  end

  create_table "blogs_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "state_taxonomy_id", null: false
    t.integer "blog_id", null: false
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "public", default: true
    t.boolean "published", default: true
    t.datetime "published_at"
    t.text "author"
    t.text "firm"
    t.text "chamber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "product_id"
    t.date "expiration"
    t.float "price"
    t.string "plan"
    t.string "expires"
    t.string "order_item_id"
    t.decimal "unit_price"
    t.integer "quantity"
    t.decimal "total_price"
    t.integer "priority"
    t.text "book_update"
    t.boolean "send_book_update", default: false
    t.boolean "book_dashboard"
    t.index ["product_id"], name: "index_books_on_product_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "books_chambers", id: false, force: :cascade do |t|
    t.integer "chamber_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id", "chamber_id"], name: "index_books_chambers_on_book_id_and_chamber_id"
    t.index ["chamber_id", "book_id"], name: "index_books_chambers_on_chamber_id_and_book_id"
  end

  create_table "books_law_firms", id: false, force: :cascade do |t|
    t.integer "law_firm_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books_order_items", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "order_item_id", null: false
  end

  create_table "books_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id", "order_id"], name: "index_books_orders_on_book_id_and_order_id"
    t.index ["order_id", "book_id"], name: "index_books_orders_on_order_id_and_book_id"
  end

  create_table "books_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "books_subscriptions", id: false, force: :cascade do |t|
    t.integer "subscription_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books_user_subscriptions", id: false, force: :cascade do |t|
    t.integer "user_subscription_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id", "user_id"], name: "index_books_users_on_book_id_and_user_id"
    t.index ["user_id", "book_id"], name: "index_books_users_on_user_id_and_book_id"
  end

  create_table "chambers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "body"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publish"
    t.string "slug"
    t.boolean "partner", default: true
  end

  create_table "chambers_law_firms", id: false, force: :cascade do |t|
    t.integer "chamber_id", null: false
    t.integer "law_firm_id", null: false
    t.index ["chamber_id", "law_firm_id"], name: "index_chambers_law_firms_on_chamber_id_and_law_firm_id"
    t.index ["law_firm_id", "chamber_id"], name: "index_chambers_law_firms_on_law_firm_id_and_chamber_id"
  end

  create_table "chambers_products", id: false, force: :cascade do |t|
    t.integer "chamber_id", null: false
    t.integer "product_id", null: false
    t.index ["chamber_id", "product_id"], name: "index_chambers_products_on_chamber_id_and_product_id"
    t.index ["product_id", "chamber_id"], name: "index_chambers_products_on_product_id_and_chamber_id"
  end

  create_table "chambers_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "chamber_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "chapters", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "author"
    t.datetime "published_at"
    t.string "chamber"
    t.boolean "published", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.integer "user_id"
    t.boolean "basic"
    t.integer "priority"
    t.tsvector "tsv_body"
    t.string "forms"
    t.index ["book_id"], name: "index_chapters_on_book_id"
    t.index ["tsv_body"], name: "index_chapters_tsv_body", using: :gin
    t.index ["user_id"], name: "index_chapters_on_user_id"
  end

  create_table "charges", id: :serial, force: :cascade do |t|
    t.integer "amount"
    t.integer "coupon_id"
    t.integer "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "body"
    t.string "nickname"
  end

  create_table "coupon_uses", id: :serial, force: :cascade do |t|
    t.integer "coupon_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", id: :serial, force: :cascade do |t|
    t.string "code"
    t.integer "discount_percent"
    t.datetime "expires_at"
    t.string "description"
    t.integer "user_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_coupons_on_product_id"
  end

  create_table "coupons_products", id: false, force: :cascade do |t|
    t.integer "coupon_id", null: false
    t.integer "product_id", null: false
  end

  create_table "customer_order_relations", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_customer_order_relations_on_order_id"
    t.index ["product_id"], name: "index_customer_order_relations_on_product_id"
  end

  create_table "event_types", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_event_types_on_event_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.text "description"
    t.text "popover"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "video_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_type_id"
    t.boolean "pin"
    t.string "slug"
    t.string "author"
    t.string "hosted_by"
    t.boolean "promote_dashboard"
  end

  create_table "events_law_firms", id: false, force: :cascade do |t|
    t.integer "law_firm_id", null: false
    t.integer "event_id", null: false
  end

  create_table "events_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "event_id", null: false
  end

  create_table "events_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "favorites", id: :serial, force: :cascade do |t|
    t.integer "chapter_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_favorites_on_chapter_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "form_attachments", id: :serial, force: :cascade do |t|
    t.integer "chapter_id"
    t.integer "book_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.boolean "public", default: true
    t.boolean "published", default: true
    t.boolean "form_sort"
    t.boolean "policy_sort"
    t.boolean "delete_box"
    t.index ["book_id"], name: "index_form_attachments_on_book_id"
    t.index ["chapter_id"], name: "index_form_attachments_on_chapter_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "law_firms", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.text "description"
    t.integer "book_id"
    t.integer "state_taxonomy_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["author_id"], name: "index_law_firms_on_author_id"
    t.index ["book_id"], name: "index_law_firms_on_book_id"
    t.index ["state_taxonomy_id"], name: "index_law_firms_on_state_taxonomy_id"
  end

  create_table "law_firms_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "law_firm_id", null: false
    t.index ["law_firm_id", "product_id"], name: "index_law_firms_products_on_law_firm_id_and_product_id"
    t.index ["product_id", "law_firm_id"], name: "index_law_firms_products_on_product_id_and_law_firm_id"
  end

  create_table "law_firms_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "law_firm_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "more_details", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.text "popover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "more_details_products", id: false, force: :cascade do |t|
    t.integer "more_detail_id", null: false
    t.integer "product_id", null: false
  end

  create_table "order_item_products", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.decimal "unit_price", precision: 12, scale: 3
    t.integer "quantity"
    t.decimal "total_price", precision: 12, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book_id"
    t.string "coupon_id"
    t.string "code"
    t.integer "discount_percent"
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["coupon_id"], name: "index_order_items_on_coupon_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "order_items_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "order_item_id", null: false
  end

  create_table "order_statuses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "shipping_address"
    t.string "shipping_suite"
    t.string "shipping_city"
    t.string "shipping_state"
    t.string "shipping_zip"
    t.string "billing_address"
    t.string "billing_city"
    t.string "billing_state"
    t.string "billing_zip"
    t.string "phone_number"
    t.datetime "expiration_date"
    t.date "order_date"
    t.string "additional_email"
    t.integer "user_id"
    t.string "coupon_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.string "plan"
    t.date "expiration"
    t.integer "expires"
    t.float "price"
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.string "card_last4"
    t.integer "card_exp_month"
    t.integer "card_exp_year"
    t.string "card_type"
    t.decimal "subtotal", precision: 12, scale: 3
    t.decimal "tax", precision: 12, scale: 3
    t.decimal "shipping", precision: 12, scale: 3
    t.decimal "total", precision: 12, scale: 3
    t.string "stripe_billing_name"
    t.string "stripe_shipping_name"
    t.string "stripe_authenticity_token"
    t.string "stripe_email"
    t.string "stripe_billing_address_country_code"
    t.string "stripe_shipping_address_country_code"
    t.string "stripe_shipping_address_country"
    t.string "stripe_billing_address_country"
    t.string "coupon_id"
    t.string "code"
    t.integer "discount_percent"
    t.string "order_item_id"
    t.decimal "unit_price"
    t.integer "quantity"
    t.decimal "total_price"
    t.integer "order_status_id"
    t.string "password"
    t.string "name"
    t.boolean "paid_status", default: false
    t.boolean "shipping_billing_same", default: false
    t.string "billing_suite"
    t.string "last_name"
    t.datetime "expiring_date"
    t.string "heard_about"
    t.string "sales_rep"
    t.integer "filemaker_number"
    t.boolean "user_confirmation"
    t.boolean "order_confirmation"
    t.string "company_name"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id"
    t.index ["filemaker_number"], name: "index_orders_on_filemaker_number"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.index ["order_id", "product_id"], name: "index_orders_products_on_order_id_and_product_id"
    t.index ["product_id", "order_id"], name: "index_orders_products_on_product_id_and_order_id"
  end

  create_table "pg_search_documents", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "searchable_id"
    t.string "searchable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "post_contents", id: :serial, force: :cascade do |t|
    t.integer "post_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_contents_on_post_id"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "topic_id"
    t.integer "current_post_content_id"
    t.float "rank"
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_posts_on_admin_id"
    t.index ["current_post_content_id"], name: "index_posts_on_current_post_content_id"
    t.index ["topic_id"], name: "index_posts_on_topic_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.float "price"
    t.boolean "active"
    t.string "state"
    t.boolean "hardcopy_book"
    t.boolean "online_only"
    t.boolean "online_hardcopy"
    t.datetime "expiration"
    t.boolean "monthly"
    t.boolean "annual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plan"
    t.integer "expires"
    t.string "state_id"
    t.string "state_taxonomy_id"
    t.string "state_list"
    t.string "description"
    t.string "image"
    t.string "product_image"
    t.boolean "disabled"
    t.integer "priority"
    t.boolean "human_resources_manual"
    t.boolean "policies"
    t.boolean "forms"
    t.boolean "hru_news", default: true
    t.boolean "webinar"
    t.boolean "email_alerts", default: true
    t.boolean "federal_poster"
    t.boolean "wages_hours"
    t.boolean "hiring_firing_discipline"
    t.boolean "e_verify"
    t.boolean "employee_benefits"
    t.boolean "fmla_ada"
    t.boolean "osha"
    t.boolean "first"
    t.boolean "prime"
    t.boolean "plus"
    t.boolean "pro"
    t.string "slug"
    t.boolean "comparison_chart"
    t.boolean "customer_support", default: true
    t.string "sku"
    t.boolean "files_block"
    t.boolean "activity", default: true
    t.boolean "public_option", default: true
    t.boolean "trial_option"
    t.boolean "filter_topic"
    t.boolean "filter_hire"
    t.boolean "filter_ada"
    t.boolean "filter_imm"
    t.boolean "filter_ben"
    t.boolean "filter_wages"
    t.boolean "filer_safety"
    t.boolean "filter_posters"
    t.boolean "filter_federal"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "products_state_taxonomies", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "products_testimonials", id: false, force: :cascade do |t|
    t.integer "testimonial_id", null: false
    t.integer "product_id", null: false
    t.index ["product_id", "testimonial_id"], name: "index_products_testimonials_on_product_id_and_testimonial_id"
    t.index ["testimonial_id", "product_id"], name: "index_products_testimonials_on_testimonial_id_and_product_id"
  end

  create_table "revisions", id: :serial, force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.datetime "data"
    t.text "note"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chapter_id"
    t.integer "book_id"
    t.boolean "current_version", default: true
    t.index ["book_id"], name: "index_revisions_on_book_id"
    t.index ["chapter_id"], name: "index_revisions_on_chapter_id"
  end

  create_table "shopping_carts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.string "orderstatus"
    t.integer "quantity"
    t.text "product_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["order_id"], name: "index_shopping_carts_on_order_id"
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "state_events", id: :serial, force: :cascade do |t|
    t.integer "event_id"
    t.integer "state_taxonomy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_state_events_on_event_id"
    t.index ["state_taxonomy_id"], name: "index_state_events_on_state_taxonomy_id"
  end

  create_table "state_taxonomies", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.string "state_list"
    t.string "slug"
    t.text "description"
    t.boolean "comparison_chart"
    t.boolean "human_resources_manual"
    t.boolean "policies"
    t.boolean "forms"
    t.boolean "hru_news"
    t.boolean "webinar"
    t.boolean "email_alerts"
    t.boolean "federal_posters"
    t.boolean "wages_hours"
    t.boolean "hiring_firing_discipline"
    t.boolean "e_verify"
    t.boolean "employee_benefits"
    t.boolean "fmla_ada"
    t.boolean "osha"
    t.boolean "disable"
    t.boolean "federal_poster"
    t.boolean "customer_support"
    t.boolean "front_page"
    t.boolean "top_half_top"
    t.string "state_name"
    t.text "body_chamber"
    t.boolean "other_chamber"
    t.string "state_link"
    t.string "state_initials"
    t.index ["product_id"], name: "index_state_taxonomies_on_product_id"
    t.index ["slug"], name: "index_state_taxonomies_on_slug", unique: true
  end

  create_table "state_taxonomies_testimonials", id: false, force: :cascade do |t|
    t.integer "testimonial_id", null: false
    t.integer "state_taxonomy_id", null: false
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.string "user"
    t.string "first_name"
    t.string "last_name"
    t.datetime "expiration_date"
    t.boolean "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_of_contents", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "public"
    t.boolean "published"
    t.datetime "published_at"
    t.text "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chapter_id"
    t.integer "user_id"
    t.index ["chapter_id"], name: "index_table_of_contents_on_chapter_id"
    t.index ["user_id"], name: "index_table_of_contents_on_user_id"
  end

  create_table "testimonials", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "city"
    t.string "state"
  end

  create_table "thank_yous", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "order_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_thank_yous_on_order_id"
    t.index ["order_item_id"], name: "index_thank_yous_on_order_item_id"
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "public", default: true
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "trial_users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_subscriptions", id: :serial, force: :cascade do |t|
    t.boolean "paid_status"
    t.string "user"
    t.string "name"
    t.string "last_name"
    t.datetime "expiration_date"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book_title"
  end

  create_table "user_subscriptions_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "user_subscription_id", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "role"
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.integer "order_id"
    t.integer "product_id"
    t.integer "book_id"
    t.boolean "email_favorites", default: true
    t.boolean "guest"
    t.boolean "standard"
    t.boolean "pro"
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.string "card_last4"
    t.integer "card_exp_month"
    t.integer "card_exp_year"
    t.string "card_type"
    t.string "phone"
    t.string "state"
    t.boolean "email_notification", default: true
    t.string "sales_rep"
    t.boolean "trial_user"
    t.boolean "trial_check"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "value"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  create_table "where_did_you_hear_about_us", id: :serial, force: :cascade do |t|
    t.string "where_did_you_hear_about_us"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_where_did_you_hear_about_us_on_order_id"
  end

  add_foreign_key "announcements", "users"
  add_foreign_key "authors", "books"
  add_foreign_key "authors", "state_taxonomies"
  add_foreign_key "comments", "posts"
  add_foreign_key "coupons", "products"
  add_foreign_key "customer_order_relations", "orders"
  add_foreign_key "customer_order_relations", "products"
  add_foreign_key "event_types", "events"
  add_foreign_key "favorites", "chapters"
  add_foreign_key "favorites", "users"
  add_foreign_key "law_firms", "authors"
  add_foreign_key "law_firms", "books"
  add_foreign_key "law_firms", "state_taxonomies"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "post_contents", "posts"
  add_foreign_key "shopping_carts", "orders"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "state_events", "events"
  add_foreign_key "state_events", "state_taxonomies"
  add_foreign_key "thank_yous", "order_items"
  add_foreign_key "thank_yous", "orders"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users"
  add_foreign_key "where_did_you_hear_about_us", "orders"
end
