class Messages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :user_message_id
      t.string :message

      t.timestamps
    end
  end
end
