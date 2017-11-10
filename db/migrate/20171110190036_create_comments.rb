class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :text do |t|
      t.string :comments
      t.integer :user_id
  end
end
