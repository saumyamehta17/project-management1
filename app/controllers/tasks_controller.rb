class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @workspace = Workspace.find(params[:workspace_id])
    @project = Project.find_by_id(params[:project_id])
    @tasks = Task.where(:project_id => @project)
    @projects = @workspace.projects
    @workspaces = current_user.workspaces

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @assigned_to = "No one is selected"
    @task = Task.find(params[:id])
    @project = Project.find_by_id(params[:project_id])
    @workspace = Workspace.find(params[:workspace_id])
    @projects = @workspace.projects
    @workspaces = current_user.workspaces
     if @task.assigned_to.present?
       @assigned_to = @task.assigned_to.username
    end



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @workspaces = current_user.workspaces
    @project = Project.find_by_id(params[:project_id])
    @workspace = Workspace.find(params[:workspace_id])
    @projects = @workspace.projects
    @task.attachments.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @project = Project.find_by_id(params[:project_id])
    @workspace = Workspace.find(params[:workspace_id])
    @projects = @workspace.projects
    @workspaces = current_user.workspaces
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @workspaces = current_user.workspaces
    @project = Project.find_by_id(params[:project_id])
    @workspace = Workspace.find(params[:workspace_id])
    @projects = @workspace.projects
    @task.project = @project
    respond_to do |format|
      if @task.save
        format.html { redirect_to workspace_project_task_path(@workspace,@project,@task), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update

    @task = Task.find(params[:id])
    @workspaces = current_user.workspaces
    @project = Project.find_by_id(params[:project_id])
    @workspace = Workspace.find(params[:workspace_id])
    @projects = @workspace.projects
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to workspace_project_task_path(@workspace,@project,@task), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
     @task.destroy
    @project = Project.find_by_id(params[:project_id])
    @workspace = Workspace.find(params[:workspace_id])
    @workspaces = current_user.workspaces
    respond_to do |format|
      format.html { redirect_to workspace_project_tasks_path(@workspace,@project) }
      format.json { head :no_content }
    end
  end
end
