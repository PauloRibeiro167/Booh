class CreateDelegacoes < ActiveRecord::Migration[8.0]
  def change
    create_table :delegacoes do |t|
      t.references :origem_cargo, null: false, foreign_key: true
      t.references :destino_usuario, null: false, foreign_key: true
      t.references :atribuicao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
