class AddWinesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :user_id, :integer
  end
end
