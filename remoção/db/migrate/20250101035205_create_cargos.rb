class CreateCargos < ActiveRecord::Migration[8.0]
  def change
    create_table :cargos do |t|
      t.string :nome_do_cargo
      t.boolean :lideranca
      t.text :descricao

      t.timestamps
    end
  end
end
