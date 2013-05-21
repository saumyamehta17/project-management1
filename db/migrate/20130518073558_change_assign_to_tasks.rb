class ChangeAssignToTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :assign_to
    add_column :tasks, :assigned_to_id, :integer
  end

  def down
    
  end
end
