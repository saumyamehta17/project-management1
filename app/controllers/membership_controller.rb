class MembershipController < ApplicationController
  def index
    
  @mem = Membership.find_by_workspace_id(params[:workspace_id])  
  @workspace = Workspace.find(params[:workspace_id]) 
 
  if params[:invite_btn]
      
      # @email = params[:Enter]
      
      @email = User.find(params[:membership][:invite_to_id]).email
      @id = User.find(params[:membership][:invite_to_id]).id
      UserMailer.registration_confirmation(@email,@workspace).deliver
      @workspace.memberships.create(:user_id => @id)
      # @w = @workspace.memberships.create(:email => @email)
      # debugger
   end

  
  
  
    
  end
end
