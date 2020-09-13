class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name, null: false
      t.text       :description, null: false
      t.integer    :price, null: false
      t.integer    :state_id, null: false, foreign_key: true
      t.integer    :cost_id, null: false, foreign_key: true
      t.integer    :region_id, null: false, foreign_key: true
      t.integer    :period_id, null: false, foreign_key: true
      t.integer    :size_id, null: false, foreign_key: true
      t.string     :brand
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
