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

ActiveRecord::Schema.define(version: 20161121124958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ajudas_tecnicas_contact_types", force: :cascade do |t|
    t.string   "tipo_contacto"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ajudas_tecnicas_contact_types", ["tipo_contacto"], name: "index_ajudas_tecnicas_contact_types_on_tipo_contacto", using: :btree

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

  add_index "ajudas_tecnicas_equipments", ["inventario"], name: "index_ajudas_tecnicas_equipments_on_inventario", using: :btree

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
    t.boolean  "obito",                        default: false, null: false
    t.integer  "ajudas_tecnicas_physician_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "ajudas_tecnicas_patients", ["ajudas_tecnicas_physician_id"], name: "index_ajudas_tecnicas_patients_on_ajudas_tecnicas_physician_id", using: :btree
  add_index "ajudas_tecnicas_patients", ["rnu"], name: "index_ajudas_tecnicas_patients_on_rnu", using: :btree

  create_table "ajudas_tecnicas_physicians", force: :cascade do |t|
    t.string   "nome_medico"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ajudas_tecnicas_physicians", ["nome_medico"], name: "index_ajudas_tecnicas_physicians_on_nome_medico", using: :btree

  create_table "ajudas_tecnicas_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nivel_acesso"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ajudas_tecnicas_users", ["user_id"], name: "index_ajudas_tecnicas_users_on_user_id", using: :btree

  create_table "body_parts", force: :cascade do |t|
    t.string   "parte_do_corpo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "body_parts", ["parte_do_corpo"], name: "index_body_parts_on_parte_do_corpo", using: :btree

  create_table "device_types", force: :cascade do |t|
    t.string   "nome_dispositivo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "device_types", ["nome_dispositivo"], name: "index_device_types_on_nome_dispositivo", using: :btree

  create_table "escala_vmer_groups", force: :cascade do |t|
    t.string   "nome_grupo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "escala_vmer_groups", ["nome_grupo"], name: "index_escala_vmer_groups_on_nome_grupo", using: :btree

  create_table "escala_vmer_schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "inicio_turno"
    t.integer  "tipo_turno"
    t.datetime "fim_turno"
    t.boolean  "escalado",     default: false, null: false
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
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "ulsne_department_id"
  end

  add_index "hig_maos_observations", ["ulsne_department_id"], name: "index_hig_maos_observations_on_ulsne_department_id", using: :btree
  add_index "hig_maos_observations", ["ulsne_site_id"], name: "index_hig_maos_observations_on_ulsne_site_id", using: :btree
  add_index "hig_maos_observations", ["user_id"], name: "index_hig_maos_observations_on_user_id", using: :btree

  create_table "hig_maos_opportunities", force: :cascade do |t|
    t.integer  "hig_maos_opportunities_cluster_id"
    t.boolean  "antes_doente",                      default: false, null: false
    t.boolean  "antes_assetico",                    default: false, null: false
    t.boolean  "apos_sangue_fluido",                default: false, null: false
    t.boolean  "apos_doente",                       default: false, null: false
    t.boolean  "apos_ambiente",                     default: false, null: false
    t.boolean  "friccao_antisetica",                default: false, null: false
    t.boolean  "lavagem",                           default: false, null: false
    t.boolean  "nao_realizado",                     default: false, null: false
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

  add_index "hig_maos_worker_categories", ["categoria_profissional"], name: "index_hig_maos_worker_categories_on_categoria_profissional", using: :btree

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

  create_table "patients", force: :cascade do |t|
    t.string   "nome"
    t.date     "data_nascimento"
    t.integer  "rnu"
    t.integer  "nif"
    t.integer  "numero_processo_sonho"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "patients", ["nif"], name: "index_patients_on_nif", using: :btree
  add_index "patients", ["numero_processo_sonho"], name: "index_patients_on_numero_processo_sonho", using: :btree
  add_index "patients", ["rnu"], name: "index_patients_on_rnu", using: :btree

  create_table "pneumo_devices_categories", force: :cascade do |t|
    t.string   "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pneumo_devices_categories", ["categoria"], name: "index_pneumo_devices_categories_on_categoria", using: :btree

  create_table "pneumo_forms_inhaler_devices", force: :cascade do |t|
    t.integer  "pneumo_inhaler_device_id"
    t.integer  "pneumology_form_id"
    t.string   "observacao"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "pneumo_forms_inhaler_devices", ["pneumo_inhaler_device_id"], name: "index_pneumo_forms_inhaler_devices_on_pneumo_inhaler_device_id", using: :btree
  add_index "pneumo_forms_inhaler_devices", ["pneumology_form_id"], name: "index_pneumo_forms_inhaler_devices_on_pneumology_form_id", using: :btree

  create_table "pneumo_inhaler_devices", force: :cascade do |t|
    t.integer  "pneumo_devices_category_id"
    t.string   "designacao"
    t.string   "dci"
    t.boolean  "ativo",                      default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pneumo_inhaler_devices", ["pneumo_devices_category_id"], name: "index_pneumo_inhaler_devices_on_pneumo_devices_category_id", using: :btree

  create_table "pneumo_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "nivel_acesso"
    t.boolean  "supervisor",   default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "pneumo_users", ["user_id"], name: "index_pneumo_users_on_user_id", using: :btree

  create_table "pneumology_forms", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "patient_id"
    t.date     "data"
    t.decimal  "peso"
    t.integer  "ta_s"
    t.integer  "ta_d"
    t.integer  "pulso"
    t.integer  "o2"
    t.boolean  "inaladores",                default: false, null: false
    t.string   "tecnica_inalatoria_antes"
    t.string   "tecnica_inalatoria_depois"
    t.string   "observacoes"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "pef"
    t.string   "o2_note"
  end

  add_index "pneumology_forms", ["patient_id"], name: "index_pneumology_forms_on_patient_id", using: :btree
  add_index "pneumology_forms", ["user_id"], name: "index_pneumology_forms_on_user_id", using: :btree

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

  add_index "transp_destinations", ["destino"], name: "index_transp_destinations_on_destino", using: :btree

  create_table "transp_materials", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ulsne_department_id"
    t.string   "assunto"
    t.integer  "local_saida_id"
    t.integer  "local_entrega_id"
    t.datetime "data_entrega"
    t.string   "observacoes"
    t.boolean  "supervisor",             default: false, null: false
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
    t.boolean  "supervisor",             default: false, null: false
    t.integer  "aprovacao"
    t.string   "comentarios_supervisor"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
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

  create_table "uci_devices", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.integer  "device_type_id"
    t.date     "data_introducao"
    t.date     "data_remocao"
    t.string   "observacao"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "uci_devices", ["device_type_id"], name: "index_uci_devices_on_device_type_id", using: :btree
  add_index "uci_devices", ["patient_id"], name: "index_uci_devices_on_patient_id", using: :btree
  add_index "uci_devices", ["user_id"], name: "index_uci_devices_on_user_id", using: :btree

  create_table "uci_tiss_values", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.date     "data"
    t.decimal  "valor"
    t.decimal  "b1_q1",      default: 0.0
    t.decimal  "b1_q2",      default: 0.0
    t.decimal  "b1_q3",      default: 0.0
    t.decimal  "b1_q4",      default: 0.0
    t.decimal  "b1_q5",      default: 0.0
    t.decimal  "b1_q6",      default: 0.0
    t.decimal  "b1_q7",      default: 0.0
    t.decimal  "b2_q1",      default: 0.0
    t.decimal  "b2_q2",      default: 0.0
    t.decimal  "b2_q3",      default: 0.0
    t.decimal  "b2_q4",      default: 0.0
    t.decimal  "b3_q1",      default: 0.0
    t.decimal  "b3_q2",      default: 0.0
    t.decimal  "b3_q3",      default: 0.0
    t.decimal  "b3_q4",      default: 0.0
    t.decimal  "b3_q5",      default: 0.0
    t.decimal  "b3_q6",      default: 0.0
    t.decimal  "b3_q7",      default: 0.0
    t.decimal  "b4_q1",      default: 0.0
    t.decimal  "b4_q2",      default: 0.0
    t.decimal  "b4_q3",      default: 0.0
    t.decimal  "b5_q1",      default: 0.0
    t.decimal  "b6_q1",      default: 0.0
    t.decimal  "b6_q2",      default: 0.0
    t.decimal  "b6_q3",      default: 0.0
    t.decimal  "b7_q1",      default: 0.0
    t.decimal  "b7_q2",      default: 0.0
    t.decimal  "b7_q3",      default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "uci_tiss_values", ["patient_id"], name: "index_uci_tiss_values_on_patient_id", using: :btree
  add_index "uci_tiss_values", ["user_id"], name: "index_uci_tiss_values_on_user_id", using: :btree

  create_table "uci_users", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "supervisor", default: false, null: false
    t.integer  "devices"
    t.integer  "wounds"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "tiss"
  end

  add_index "uci_users", ["user_id"], name: "index_uci_users_on_user_id", using: :btree

  create_table "uci_wounds", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "user_id"
    t.integer  "wound_type_id"
    t.integer  "body_part_id"
    t.date     "data_registo"
    t.string   "origem"
    t.boolean  "complicacoes",  default: false, null: false
    t.boolean  "antibioticos",  default: false, null: false
    t.string   "observacoes"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "uci_wounds", ["body_part_id"], name: "index_uci_wounds_on_body_part_id", using: :btree
  add_index "uci_wounds", ["patient_id"], name: "index_uci_wounds_on_patient_id", using: :btree
  add_index "uci_wounds", ["user_id"], name: "index_uci_wounds_on_user_id", using: :btree
  add_index "uci_wounds", ["wound_type_id"], name: "index_uci_wounds_on_wound_type_id", using: :btree

  create_table "ulsne_departments", force: :cascade do |t|
    t.string   "nome_servico"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ulsne_departments", ["nome_servico"], name: "index_ulsne_departments_on_nome_servico", using: :btree

  create_table "ulsne_sites", force: :cascade do |t|
    t.string   "nome_unidade"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ulsne_sites", ["nome_unidade"], name: "index_ulsne_sites_on_nome_unidade", using: :btree

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
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "ulsne_site_id"
    t.string   "titulo"
    t.boolean  "administrator",          default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["numero_mecanografico"], name: "index_users_on_numero_mecanografico", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["ulsne_site_id"], name: "index_users_on_ulsne_site_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "wound_types", force: :cascade do |t|
    t.string   "ferida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wound_types", ["ferida"], name: "index_wound_types_on_ferida", using: :btree

  add_foreign_key "pneumo_users", "users"
  add_foreign_key "pneumology_forms", "patients"
  add_foreign_key "pneumology_forms", "users"
end
