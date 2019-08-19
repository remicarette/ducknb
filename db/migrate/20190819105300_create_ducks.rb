class CreateDucks < ActiveRecord::Migration[5.2]
  def change
    create_table :ducks do |t|
      t.date :birthdate
      t.references :user, foreign_key: true
      t.string :name
      t.string :race
      t.string :sex
      t.string :colour
      t.float :weight
      t.string :tags

      t.timestamps
    end
  end
end
