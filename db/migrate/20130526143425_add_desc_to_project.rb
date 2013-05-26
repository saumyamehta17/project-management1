class AddDescToProject < ActiveRecord::Migration
  def change
    add_column :projects, :desc, :tinytext
  end
end
