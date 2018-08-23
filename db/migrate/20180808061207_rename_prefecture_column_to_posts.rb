class RenamePrefectureColumnToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :prefecture, :prefecture_id
  end
end
