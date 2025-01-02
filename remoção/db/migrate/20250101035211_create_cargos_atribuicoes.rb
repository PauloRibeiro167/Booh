class CreateCargosAtribuicoes < ActiveRecord::Migration[8.0]
  def change
    create_table :cargos_atribuicoes do |t|
      t.references :cargo, null: false, foreign_key: true
      t.references :atribuicao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
