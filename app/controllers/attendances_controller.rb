class AttendancesController < ApplicationController
  def new
  	@attendance = Attendance.new
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def edit
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
        flash.now[:error] = "Event not found."
        render 'new'
      end
  	else
      flash.now[:error] = "User not found."
  		render 'new'
  	end
  end

  def destroy
    Attendance.find(params[:code]).destroy
  end

  def index
    @attendances = Attendance.all
  end

  def temp
   
  end
  # def index
  #   @attendances = Attendance.order(:code)
  #   respond_to do |format|
  #     format.html
  #     format.csv { send_data @attendances.to_csv }
  #     format.xls { send_data @attendances.to_csv(col_sep: "\t") }
  #   end    
  # end
end