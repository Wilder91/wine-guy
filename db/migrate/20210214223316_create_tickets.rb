class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :wine_id
      t.float :price
      t.float :rating
      t.timestamps null: false
    end
  end
end
