class CreateUserUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :user_urls do |t|
      t.string :identification
      t.string :url

      t.timestamps
    end
  end
end
