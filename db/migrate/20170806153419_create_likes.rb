class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.string :url
      t.string :sitio
      t.string :palabra
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
