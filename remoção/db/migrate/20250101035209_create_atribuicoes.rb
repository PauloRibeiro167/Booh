class CreateAtribuicoes < ActiveRecord::Migration[8.0]
  def change
    create_table :atribuicoes do |t|
      t.string :funcao

      t.timestamps
    end
  end
end
