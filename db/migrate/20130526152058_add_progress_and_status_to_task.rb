class AddProgressAndStatusToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :progress, :string
    add_column :tasks, :status, :string
  end
end
