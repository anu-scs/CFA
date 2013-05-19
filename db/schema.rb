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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130513191431) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "campaign_images", :force => true do |t|
    t.string   "campimage"
    t.integer  "campaign_id"
    t.string   "image_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "campaign_stats", :force => true do |t|
    t.integer  "campaign_id"
    t.integer  "calls_in_progress"
    t.integer  "dialable_leads"
    t.integer  "human_answered_calls_count_today"
    t.integer  "answering_machine_calls_count_today"
    t.integer  "played_message_calls_count_today"
    t.integer  "call_picked_up_calls_count_today"
    t.integer  "no_answer_calls_count_today"
    t.integer  "answeing_machine_calls_count_life"
    t.integer  "played_message_calls_count_life"
    t.integer  "call_picked_up_calls_count_life"
    t.integer  "no_answer_calls_count_life"
    t.integer  "total_calls_made_count_today"
    t.integer  "total_calls_made_count_life"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "campaign_stats_customs", :force => true do |t|
    t.string   "status_code"
    t.integer  "calls_today"
    t.integer  "calls_life"
    t.integer  "campaign_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "campaign_types", :force => true do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "shortdescription"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "viciserver_id"
    t.boolean  "active",                   :default => false
    t.integer  "campaign_type_id"
    t.text     "internal_notes"
    t.string   "vici_campaign_id"
    t.integer  "add_to_list_id"
    t.string   "add_to_list_position"
    t.boolean  "add_to_list_allow"
    t.text     "transcript_text"
    t.string   "transcript_audio_file"
    t.datetime "campaign_start_date_time"
    t.datetime "campaign_end_date_time"
    t.boolean  "public_stats_visible"
    t.float    "amount_donated_total"
    t.integer  "number_donations_total"
    t.integer  "number_donations_today"
    t.float    "amount_donations_today"
    t.float    "inflate_stats_percent"
    t.float    "cost_per_call_minute"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "short_description"
    t.integer  "parent_category_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "geocamps", :force => true do |t|
    t.integer  "campaign_id"
    t.text     "states_called_now"
    t.text     "states_called_today"
    t.text     "states_included_all"
    t.text     "zipcodes_called_now"
    t.text     "zipcodes_called_today"
    t.text     "zipcodes_included_all"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "is_admin"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "viciservers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "db_connection_string"
    t.string   "server_ip"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
