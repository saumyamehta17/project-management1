class ChangeOwnerIdMembership < ActiveRecord::Migration
  def up
    remove_column :memberships , :owner_id 
    add_column :memberships , :email , :string
  end

  def down
  end
end
