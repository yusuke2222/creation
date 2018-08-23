class ChangeDatatypePrefectureIdOfPosts < ActiveRecord::Migration
  def change
    change_column :posts, :prefecture_id, :integer
  end
end
