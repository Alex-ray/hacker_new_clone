class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |cv|
      cv.references :user
      cv.references :comment
      cv.timestamps
    end 
  end
end
