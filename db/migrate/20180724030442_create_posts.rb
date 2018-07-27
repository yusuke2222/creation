class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string    :name
      t.text      :text
      t.text      :image

      t.timestamps
    end
  end
end
