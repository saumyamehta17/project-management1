class AddWorkspaceIdToProjects < ActiveRecord::Migration
  def change
     add_column :projects, :workspace_id, :integer
  end
end
