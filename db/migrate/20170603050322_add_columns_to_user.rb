class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :nickname, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :avater, :string   #增加头像的栏位
  end
end
