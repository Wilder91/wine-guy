class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :country
      t.float :price
      t.float :rating
      t.string :varietal
      t.integer :user_id

      t.timestamps null: false
    end
  end

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :dob

      t.timestamps null: false
    end
  end

  
  def change
    
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :wine_id
      t.timestamps null: false
    end
  end
end
