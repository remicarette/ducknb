class CreateDuckPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :duck_photos do |t|
      t.references :duck, foreign_key: true
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
