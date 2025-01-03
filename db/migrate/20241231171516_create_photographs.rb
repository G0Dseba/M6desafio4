class CreatePhotographs < ActiveRecord::Migration[7.2]
  def change
    create_table :photographs do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
