class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :short_description
      t.integer :parent_category_id

      t.timestamps
    end
  end
end
