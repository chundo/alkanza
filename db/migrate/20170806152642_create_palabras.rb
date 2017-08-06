class CreatePalabras < ActiveRecord::Migration[5.1]
  def change
    create_table :palabras do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
