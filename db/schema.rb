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

ActiveRecord::Schema.define(:version => 20101024221005) do

  create_table "antibodies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "target_id"
    t.integer  "host_species_id"
    t.text     "antigen"
    t.string   "clonality"
    t.string   "purification"
    t.integer  "vendor_id"
    t.string   "catalogue_number"
    t.string   "lot_number"
    t.string   "url"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_antibodies", :force => true do |t|
    t.integer  "project_id"
    t.integer  "antibody_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_targets", :force => true do |t|
    t.integer  "project_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "targets_count",    :default => 0
    t.integer  "antibodies_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", :force => true do |t|
    t.string   "name"
    t.string   "scientific_name"
    t.integer  "targets_count",    :default => 0
    t.integer  "antibodies_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "species", ["name"], :name => "index_species_on_name"
  add_index "species", ["scientific_name"], :name => "index_species_on_scientific_name"

  create_table "targets", :force => true do |t|
    t.string   "name"
    t.integer  "species_id"
    t.integer  "gene_id"
    t.integer  "antibodies_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "targets", ["gene_id"], :name => "index_targets_on_gene_id"
  add_index "targets", ["species_id"], :name => "index_targets_on_species_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "contact_person"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.integer  "antibodies_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendors", ["antibodies_count"], :name => "index_vendors_on_antibodies_count"
  add_index "vendors", ["name"], :name => "index_vendors_on_name"

end
