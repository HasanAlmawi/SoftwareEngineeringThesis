class AttendancesController < ApplicationController
  def new
  	@attendance = Attendance.new
  end

  def create
  	user = User.where(email: params[:attendance][:email]).first
    event = Event.where(code: params[:attendance][:code]).first
    @attendance = Attendance.new
    if user
      if event
        @attendance = user.attendances.build(params[:attendance].except(:email))  	
    	  if @attendance.save
          flash[:success] = "Attendance logged."
    		  redirect_to root_path
        else
          render 'new'
        end
      else
        flash.now[:codefail] = "Event not found."
        render 'new'
      end
  	else
      flash.now[:userfail] = "User not found."
  		render 'new'
  	end
  end
end