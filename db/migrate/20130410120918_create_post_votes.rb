class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |pv|
      pv.references :user
      pv.references :post
      pv.timestamps
    end
  end
end
