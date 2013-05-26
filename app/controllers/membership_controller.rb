class MembershipController < ApplicationController
  def index
  @mem = Membership.find_by_workspace_id(params[:workspace_id])  
  @workspace = Workspace.find(params[:workspace_id]) 
 
  if params[:invite_btn]
      @email = User.find(params[:membership][:invite_to_id]).email
      @id = User.find(params[:membership][:invite_to_id]).id
      UserMailer.registration_confirmation(@email,@workspace).deliver
      @workspace.memberships.create(:user_id => current_user.id , :owner_id => @id)
   end

  
  
  
    
  end
end
