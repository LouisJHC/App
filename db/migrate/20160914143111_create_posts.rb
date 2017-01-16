class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :distance

      t.timestamps null: false
    end
  end
end
