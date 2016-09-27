class AddUrlIdToKeywords < ActiveRecord::Migration[5.0]
  def change
    add_column :keywords, :url_id, :integer
  end
end
