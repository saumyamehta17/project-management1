class MembershipController < ApplicationController
  def index
  debugger
  @workspace = Workspace.all
    
  end
end
