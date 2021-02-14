class CreateWines < ActiveRecord::Migration[5.2]
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
end
