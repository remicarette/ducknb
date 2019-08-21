class AddPhotoToDucks < ActiveRecord::Migration[5.2]
  def change
    add_column :ducks, :photo, :string
  end
end
