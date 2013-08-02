class SearchesController < ApplicationController
    layout "workspaces"
    
	def new
		@search = Search.create!(:option_value => params[:option_value] , :keyword => params[:keyword])
        redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		
		# @path = @workspace_projects_path(@workspace) if @search[:option_value] = "Project" 
		# debugger
	end

end

		
