class AddInviteToIdToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :invite_to_id, :integer
  end
end
