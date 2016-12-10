class AddLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_link, :string
    add_column :users, :vk_link, :string
    add_column :users, :google_link, :string
  end
end
