class AddStatusToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :status, :string
    add_column :posts, :published_at, :datetime
  end
end
