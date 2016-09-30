class CreateEmailSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :email_subscribers do |t|
      t.string :name
      t.string :email
      t.string :list_name

      t.timestamps
    end
  end
end
