class AddBulletinIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :bulletin_id, :integer
    add_index :posts, :bulletin_id
  end
end
