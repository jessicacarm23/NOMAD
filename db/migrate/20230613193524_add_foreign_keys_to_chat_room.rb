class AddForeignKeysToChatRoom < ActiveRecord::Migration[7.0]
  def change
    # add_reference :chat_rooms, :user, null: false, foreign_key: true
    add_reference :chat_rooms, :user_initiator, foreign_key: { to_table: 'users'}
    add_reference :chat_rooms, :user_receiver, foreign_key: { to_table: 'users'}
  end
end
