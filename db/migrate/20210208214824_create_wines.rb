class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :country
      t.float :price
      t.float :rating
      t.string :varietal

      t.timestamps null: false
    end
  end
end
