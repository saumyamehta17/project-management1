class RemindersController < ApplicationController
  # GET /reminders
  # GET /reminders.json

  layout "workspaces"
  def index
    @reminders = Reminder.where(:user_id => current_user.id)

  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
    @reminder = Reminder.find(params[:id])

  end

  # GET /reminders/new
  # GET /reminders/new.json
  def new
    @reminder = Reminder.new
    @reminders = Reminder.where(:user_id => current_user.id)
  end

  # GET /reminders/1/edit
  def edit
    @reminder = Reminder.find(params[:id])
    @reminders = Reminder.where(:user_id => current_user.id)
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(params[:reminder])
    @reminder.user_id = current_user.id

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to reminders_path, notice: 'Reminder was successfully created.' }
        format.json { render json: @reminder, status: :created, location: @reminder }
      else
        format.html { render action: "new" }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reminders/1
  # PUT /reminders/1.json
  def update
    @reminder = Reminder.find(params[:id])

    respond_to do |format|
      if @reminder.update_attributes(params[:reminder])
        format.html { redirect_to reminders_path , notice: 'Reminder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    @reminders = current_user.reminders

    respond_to do |format|
      format.html { redirect_to reminders_path }
      format.json { head :no_content }
    end
  end
end
