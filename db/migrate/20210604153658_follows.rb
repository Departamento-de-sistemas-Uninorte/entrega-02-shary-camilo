class Follows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :following_id

      t.timestamps
    end
  end
end
