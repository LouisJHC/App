class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :cont
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
