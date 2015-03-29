class EventsController < ApplicationController
  respond_to(:json)

  def index
    @event = Event.new
    @events = Event.all
    respond_with(@events)
  end

  def new
  	@event = Event.new
  end

  def edit
    @event = Event.new
    @events = Event.all
  end

  def create
  	@event = Event.new(params[:event])
    @event.code = SecureRandom.hex(2)
  	if @event.save
  		flash[:success] = "Event created."
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def update
    if @event.update_attributes(params[:event])
      flash[:success] = "Event updated"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    Attendance.find(params[:code]).destroy
  end
end
