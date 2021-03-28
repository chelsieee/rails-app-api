class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :blog, index: true, foreign_key: true
      t.string :username
      t.string :password

    end
  end
end
