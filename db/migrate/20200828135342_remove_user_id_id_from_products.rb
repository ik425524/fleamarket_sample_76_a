class RemoveUserIdIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :user_id_id, :integer
  end
end
