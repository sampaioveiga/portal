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

ActiveRecord::Schema.define(version: 20160413103747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ajudas_tecnicas_contact_types", force: :cascade do |t|
    t.string   "tipo_contacto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ajudas_tecnicas_contacts", force: :cascade do |t|
    t.string   "contacto"
    t.integer  "ajudas_tecnicas_patient_id"
    t.integer  "ajudas_tecnicas_contact_type_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "ajudas_tecnicas_contacts", ["ajudas_tecnicas_contact_type_id"], name: "contact_type", using: :btree
  add_index "ajudas_tecnicas_contacts", ["ajudas_tecnicas_patient_id"], name: "index_ajudas_tecnicas_contacts_on_ajudas_tecnicas_patient_id", using: :btree

  create_table "ajudas_tecnicas_equipments", force: :cascade do |t|
    t.string   "equipamento"
    t.integer  "inventario"
    t.string   "descricao"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ajudas_tecnicas_loans", force: :cascade do |t|
    t.string   "cuidador"
    t.date     "inicio_cedencia"
    t.date     "fim_cedencia"
    t.string   "observacoes"
    t.integer  "ajudas_tecnicas_patient_id"
    t.integer  "ajudas_tecnicas_equipment_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ajudas_tecnicas_loans", ["ajudas_tecnicas_equipment_id"], name: "index_ajudas_tecnicas_loans_on_ajudas_tecnicas_equipment_id", using: :btree
  add_index "ajudas_tecnicas_loans", ["ajudas_tecnicas_patient_id"], name: "index_ajudas_tecnicas_loans_on_ajudas_tecnicas_patient_id", using: :btree

  create_table "ajudas_tecnicas_patients", force: :cascade do |t|
    t.string   "nome_doente"
    t.date     "ddn"
    t.integer  "rnu"
    t.string   "sexo"
    t.string   "morada"
    t.integer  "cpostal"
    t.integer  "cpostal2"
    t.string   "localidade"
    t.boolean  "obito"
    t.integer  "ajudas_tecnicas_physician_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "ajudas_tecnicas_physicians", force: :cascade do |t|
    t.string   "nome_medico"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ajudas_tecnicas_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nivel_acesso"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "escala_vmer_groups", force: :cascade do |t|
    t.string   "nome_grupo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escala_vmer_schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "inicio_turno"
    t.integer  "tipo_turno"
    t.datetime "fim_turno"
    t.boolean  "escalado",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "obs"
  end

  add_index "escala_vmer_schedules", ["user_id"], name: "index_escala_vmer_schedules_on_user_id", using: :btree

  create_table "escala_vmer_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "escala_vmer_group_id"
    t.integer  "nivel_acesso"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "escala_vmer_users", ["escala_vmer_group_id"], name: "index_escala_vmer_users_on_escala_vmer_group_id", using: :btree
  add_index "escala_vmer_users", ["user_id"], name: "index_escala_vmer_users_on_user_id", using: :btree

  create_table "hig_maos_observations", force: :cascade do |t|
    t.datetime "inicio_sessao"
    t.datetime "fim_sessao"
    t.integer  "ulsne_site_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "hig_maos_observations", ["ulsne_site_id"], name: "index_hig_maos_observations_on_ulsne_site_id", using: :btree
  add_index "hig_maos_observations", ["user_id"], name: "index_hig_maos_observations_on_user_id", using: :btree

  create_table "hig_maos_opportunities", force: :cascade do |t|
    t.integer  "hig_maos_opportunities_cluster_id"
    t.boolean  "antes_doente",                      default: false
    t.boolean  "antes_assetico",                    default: false
    t.boolean  "apos_sangue_fluido",                default: false
    t.boolean  "apos_doente",                       default: false
    t.boolean  "apos_ambiente",                     default: false
    t.boolean  "friccao_antisetica",                default: false
    t.boolean  "lavagem",                           default: false
    t.boolean  "nao_realizado",                     default: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "hig_maos_opportunities", ["hig_maos_opportunities_cluster_id"], name: "oppo_cluster", using: :btree

  create_table "hig_maos_opportunities_clusters", force: :cascade do |t|
    t.integer  "hig_maos_observation_id"
    t.integer  "numero_profissionais"
    t.integer  "hig_maos_worker_category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "hig_maos_opportunities_clusters", ["hig_maos_observation_id"], name: "observation", using: :btree
  add_index "hig_maos_opportunities_clusters", ["hig_maos_worker_category_id"], name: "category", using: :btree

  create_table "hig_maos_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nivel_acesso"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hig_maos_users", ["user_id"], name: "index_hig_maos_users_on_user_id", using: :btree

  create_table "hig_maos_worker_categories", force: :cascade do |t|
    t.string   "categoria_profissional"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

  create_table "transp_materials", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ulsne_department_id"
    t.string   "assunto"
    t.integer  "local_saida_id"
    t.integer  "local_entrega_id"
    t.datetime "data_entrega"
    t.string   "observacoes"
    t.boolean  "supervisor",             default: false
    t.integer  "aprovacao"
    t.string   "comentarios_supervisor"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "urgente"
  end

  add_index "transp_materials", ["local_entrega_id"], name: "index_transp_materials_on_local_entrega_id", using: :btree
  add_index "transp_materials", ["local_saida_id"], name: "index_transp_materials_on_local_saida_id", using: :btree
  add_index "transp_materials", ["ulsne_department_id"], name: "index_transp_materials_on_ulsne_department_id", using: :btree
  add_index "transp_materials", ["user_id"], name: "index_transp_materials_on_user_id", using: :btree

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
