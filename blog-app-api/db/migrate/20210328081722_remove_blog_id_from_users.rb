class RemoveBlogIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :blog_id, :string
  end
end
