class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :support_team, :string, null: false, default: ""
    add_column :users, :support_history, :integer
    add_column :users, :introduce, :text, default: "よろしくお願いします！"
    add_column :users, :icon, :string, default: ""
  end
end
