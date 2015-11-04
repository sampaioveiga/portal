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

ActiveRecord::Schema.define(version: 20151104121618) do

  create_table "u2d_associations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ulsne_department_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "u2d_associations", ["ulsne_department_id"], name: "index_u2d_associations_on_ulsne_department_id"
  add_index "u2d_associations", ["user_id"], name: "index_u2d_associations_on_user_id"

  create_table "ulsne_departments", force: :cascade do |t|
    t.string   "nome_servico"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ulsne_sites", force: :cascade do |t|
    t.string   "nome_unidade"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_phone_numbers", force: :cascade do |t|
    t.integer  "numero_contacto"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_phone_numbers", ["user_id"], name: "index_user_phone_numbers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "nome_utilizador"
    t.integer  "numero_mecanografico"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "ulsne_site_id"
  end

  add_index "users", ["ulsne_site_id"], name: "index_users_on_ulsne_site_id"

end
