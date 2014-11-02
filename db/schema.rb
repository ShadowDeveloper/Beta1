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

ActiveRecord::Schema.define(version: 20141102160612) do

  create_table "bank_account", force: true do |t|
    t.integer "client_id"
    t.integer "bank_id"
    t.string  "agency",         limit: 10
    t.string  "account_number", limit: 10
  end

  create_table "client", force: true do |t|
    t.string  "client_type",   limit: 30
    t.string  "name",          limit: nil
    t.date    "dob"
    t.integer "relationship"
    t.integer "rg"
    t.string  "cpf",           limit: 20
    t.string  "address",       limit: nil
    t.string  "phone_number",  limit: 20
    t.string  "mobile_number", limit: 20
    t.string  "email_address", limit: 50
  end

  create_table "company", force: true do |t|
    t.integer "client_id"
    t.string  "company_name", limit: 60
    t.string  "ocupation",    limit: 60
    t.float   "income"
    t.float   "extra_income"
  end

  create_table "legal_entity", force: true do |t|
    t.integer "client_id"
    t.string  "company",                limit: nil
    t.string  "cfantasia",              limit: 60
    t.string  "ccnpj",                  limit: 16
    t.string  "state_registration",     limit: 12
    t.string  "municipal_registration", limit: 12
  end

  create_table "personal_references", force: true do |t|
    t.integer "client_id"
    t.string  "name",           limit: 50
    t.string  "phone_number",   limit: 10
    t.string  "phone_number2",  limit: 10
    t.integer "reference_type"
  end

  create_table "pictures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "residence_id"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "residence_info", force: true do |t|
    t.integer "residence_id"
    t.integer "residence_code"
    t.decimal "sell_value"
    t.decimal "rent_value"
    t.decimal "condominium_value"
    t.decimal "iptu_value"
    t.decimal "area_terreno"
    t.decimal "area_util"
    t.decimal "area_total"
    t.string  "escritura_definitiva", limit: 1
    t.string  "escritura_alienada",   limit: 1
    t.string  "escritura_inventario", limit: 1
    t.string  "casa_germinada",       limit: 1
    t.string  "casa_sobrado",         limit: 1
    t.string  "casa_esquina",         limit: 1
    t.string  "casa_cond_fechado",    limit: 1
    t.string  "casa_edicula",         limit: 1
    t.string  "casa_alto_padrao",     limit: 1
    t.string  "casa_terrea",          limit: 1
    t.integer "qdt_domitorio"
    t.integer "qtd_suite"
    t.integer "qtd_banheiro"
    t.integer "qtd_garage"
  end

  create_table "residences", force: true do |t|
    t.integer   "client_id"
    t.string    "status",         limit: 1
    t.string    "residence_type", limit: 10
    t.string    "cep",            limit: 10
    t.string    "street",         limit: 80
    t.string    "address",        limit: 80
    t.string    "number",         limit: 8
    t.string    "city",           limit: 50
    t.string    "neighbourhood",  limit: 30
    t.string    "state",          limit: 20
    t.timestamp "added_at"
    t.string    "complement",     limit: 10
  end

# Could not dump table "user" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
