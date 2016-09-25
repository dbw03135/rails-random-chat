class CreateChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_rooms do |t|
      t.references :user, foreign_key: true
      t.integer :user2

      t.timestamps
    end
  end
end
