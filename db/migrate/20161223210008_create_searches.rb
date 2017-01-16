class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :user_search
      # t.float :search_latitude
      # t.float :search_longitude
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
