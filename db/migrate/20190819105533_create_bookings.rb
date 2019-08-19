class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :duck, foreign_key: true
      t.date :start
      t.date :end
      t.string :status

      t.timestamps
    end
  end
end
