class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :url
      p.string :title
      p.references :user
      p.timestamps
    end
  end
end
