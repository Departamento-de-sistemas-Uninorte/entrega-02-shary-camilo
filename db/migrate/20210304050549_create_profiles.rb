class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :tweet
      t.string :user_name
      t.belongs_to :user, foreign_key: true

      t.timestamps 
    end
  end
end
