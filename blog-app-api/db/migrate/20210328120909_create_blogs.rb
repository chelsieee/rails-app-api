class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.references :users, index: true, foreign_key: true
      t.references :categories, index: true, foreign_key: true

      t.timestamps



    end
  end
end
