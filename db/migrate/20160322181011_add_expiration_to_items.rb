class AddExpirationToItems < ActiveRecord::Migration
  def change
    add_column :items, :expires_at, :datetime
  end
end
