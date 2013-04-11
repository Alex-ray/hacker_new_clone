class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |c|
      c.text :body
      c.references :post 
      c.references :user
      c.timestamps 
    end
  end
end
