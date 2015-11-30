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

ActiveRecord::Schema.define(version: 20151119144021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "office_phone_numbers", force: :cascade do |t|
    t.string   "nome_gabinete"
    t.integer  "numero_gabinete"
    t.integer  "ulsne_site_id"
    t.integer  "ulsne_department_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "office_phone_numbers", ["ulsne_department_id"], name: "index_office_phone_numbers_on_ulsne_department_id", using: :btree
  add_index "office_phone_numbers", ["ulsne_site_id"], name: "index_office_phone_numbers_on_ulsne_site_id", using: :btree

  create_table "satisf_surv_surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ulsne_department_id"
    t.integer  "ulsne_site_id"
    t.integer  "idade"
    t.integer  "sexo"
    t.integer  "escolaridade"
    t.integer  "simpatia_disponibilidade"
    t.integer  "informacao_esclarecimentos"
    t.integer  "atencao_disponibilidade_medicos"
    t.integer  "medicos_explicaram_doenca"
    t.integer  "medicos_explicaram_medicacao"
    t.integer  "desempenho_medicos"
    t.integer  "atencao_disponibilizada_enfermeiros"
    t.integer  "rapidez_servico_enfermagem"
    t.integer  "desempenho_enfermeiros"
    t.integer  "avaliacao_pessoal_auxiliar"
    t.integer  "avaliacao_outros"
    t.string   "outros"
    t.integer  "conforto_enfermarias"
    t.integer  "limpeza_higiene"
    t.integer  "protecao_enfermarias"
    t.integer  "recomendaria_servico"
    t.integer  "globalmente_satisfeito"
    t.string   "opiniao"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "satisf_surv_surveys", ["ulsne_department_id"], name: "index_satisf_surv_surveys_on_ulsne_department_id", using: :btree
  add_index "satisf_surv_surveys", ["ulsne_site_id"], name: "index_satisf_surv_surveys_on_ulsne_site_id", using: :btree
  add_index "satisf_surv_surveys", ["user_id"], name: "index_satisf_surv_surveys_on_user_id", using: :btree

  create_table "satisf_surv_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nivel_acesso"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "satisf_surv_users", ["user_id"], name: "index_satisf_surv_users_on_user_id", using: :btree

  create_table "transp_destinations", force: :cascade do |t|
    t.string   "destino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transp_user_trips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ulsne_department_id"
    t.string   "assunto"
    t.integer  "numero_passageiros"
    t.integer  "transp_destination_id"
    t.datetime "data_inicio"
    t.integer  "local_inicio_id"
    t.datetime "data_fim"
    t.integer  "local_fim_id"
    t.string   "condutor"
    t.string   "observacoes"
    t.boolean  "supervisor"
    t.integer  "aprovacao"
    t.string   "comentarios_supervisor"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "transp_user_trips", ["transp_destination_id"], name: "index_transp_user_trips_on_transp_destination_id", using: :btree
  add_index "transp_user_trips", ["ulsne_department_id"], name: "index_transp_user_trips_on_ulsne_department_id", using: :btree
  add_index "transp_user_trips", ["user_id"], name: "index_transp_user_trips_on_user_id", using: :btree

  create_table "transp_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nivel_acesso"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "transp_users", ["user_id"], name: "index_transp_users_on_user_id", using: :btree

  create_table "u2d_associations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ulsne_department_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "u2d_associations", ["ulsne_department_id"], name: "index_u2d_associations_on_ulsne_department_id", using: :btree
  add_index "u2d_associations", ["user_id"], name: "index_u2d_associations_on_user_id", using: :btree

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

  add_index "user_phone_numbers", ["user_id"], name: "index_user_phone_numbers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nome_utilizador"
    t.integer  "numero_mecanografico"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "ulsne_site_id"
    t.string   "titulo"
    t.boolean  "administrator",        default: false
  end

  add_index "users", ["ulsne_site_id"], name: "index_users_on_ulsne_site_id", using: :btree

end
