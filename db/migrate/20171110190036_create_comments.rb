class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :comments
      t.integer
  end
end
