class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :tweet
      t.string :user_name

      t.timestamps 
    end
  end
end
