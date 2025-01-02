# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_01_053938) do
  create_table "atribuicoes", force: :cascade do |t|
    t.string "funcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos", force: :cascade do |t|
    t.string "nome_do_cargo"
    t.boolean "lideranca"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos_atribuicoes", force: :cascade do |t|
    t.integer "cargo_id", null: false
    t.integer "atribuicao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atribuicao_id"], name: "index_cargos_atribuicoes_on_atribuicao_id"
    t.index ["cargo_id"], name: "index_cargos_atribuicoes_on_cargo_id"
  end

  create_table "cargos_setores", force: :cascade do |t|
    t.integer "cargo_id", null: false
    t.integer "setor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_cargos_setores_on_cargo_id"
    t.index ["setor_id"], name: "index_cargos_setores_on_setor_id"
  end

  create_table "delegacoes", force: :cascade do |t|
    t.integer "origem_cargo_id", null: false
    t.integer "destino_usuario_id", null: false
    t.integer "atribuicao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atribuicao_id"], name: "index_delegacoes_on_atribuicao_id"
    t.index ["destino_usuario_id"], name: "index_delegacoes_on_destino_usuario_id"
    t.index ["origem_cargo_id"], name: "index_delegacoes_on_origem_cargo_id"
  end

  create_table "setores", force: :cascade do |t|
    t.string "nome"
    t.integer "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cargos_atribuicoes", "atribuicaos"
  add_foreign_key "cargos_atribuicoes", "cargos"
  add_foreign_key "cargos_setores", "cargos"
  add_foreign_key "cargos_setores", "setors"
  add_foreign_key "delegacoes", "atribuicaos"
  add_foreign_key "delegacoes", "destino_usuarios"
  add_foreign_key "delegacoes", "origem_cargos"
end
