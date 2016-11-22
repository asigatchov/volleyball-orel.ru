class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :parent_id, default: 0
      t.integer :pos
      t.boolean :active

      t.timestamps
    end
  end
end
