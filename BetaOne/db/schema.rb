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

ActiveRecord::Schema.define(version: 20140325004712) do

  create_table "bank_account", force: true do |t|
    t.integer "client_id"
    t.integer "bank_id",        limit: 3
    t.string  "agency",         limit: 20
    t.string  "account_number", limit: 10
  end

  create_table "client", force: true do |t|
    t.string  "name",           limit: 60
    t.string  "dob",            limit: 10
    t.integer "client_type",    limit: 1,  default: 1
    t.string  "relationship",   limit: 1
    t.string  "cpf",            limit: 11,             null: false
    t.string  "rg",             limit: 20
    t.string  "address",        limit: 50
    t.string  "phone_number",   limit: 20
    t.string  "phone_number2",  limit: 20
    t.string  "mobile_number2", limit: 20
    t.string  "mobile_number",  limit: 20
    t.string  "email_address",  limit: 50
    t.string  "email_address2", limit: 50
  end

  create_table "client_references", force: true do |t|
    t.integer "client_id",                             null: false
    t.string  "name",           limit: 50,             null: false
    t.string  "phone_number",   limit: 50
    t.string  "phone_number2",  limit: 50
    t.integer "reference_type", limit: 1,  default: 1
  end

  create_table "company", force: true do |t|
    t.integer "client_id"
    t.string  "ocupation",    limit: 50
    t.float   "income"
    t.float   "extra_income"
    t.string  "company_name", limit: 60
  end

  create_table "main", id: false, force: true do |t|
    t.string "id"
  end

  create_table "residence", force: true do |t|
    t.string "address", limit: 20
  end

  create_table "user", force: true do |t|
    t.string  "name",     limit: 50
    t.string  "login"
    t.string  "password", limit: 100
    t.integer "adm",      limit: 1,   default: 0
    t.string  "cpf",      limit: 11
  end

end
