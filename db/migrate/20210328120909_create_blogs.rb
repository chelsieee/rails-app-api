class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.timestamps
      t.belongs_to :user
      t.belongs_to :category
    end
  end
end
