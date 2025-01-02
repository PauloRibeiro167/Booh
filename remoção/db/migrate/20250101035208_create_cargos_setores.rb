class CreateCargosSetores < ActiveRecord::Migration[8.0]
  def change
    create_table :cargos_setores do |t|
      t.references :cargo, null: false, foreign_key: true
      t.references :setor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
