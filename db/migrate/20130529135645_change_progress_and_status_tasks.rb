class ChangeProgressAndStatusTasks < ActiveRecord::Migration
  def up
    remove_column :tasks , :progress 
    remove_column :tasks , :status
    add_column :tasks , :progress_id , :integer
    add_column :tasks , :status_id , :integer
  end

  def down

    
  end
end
