class EventsController < ApplicationController
  respond_to(:json)

  def index
    @event = Event.new
    @events = Event.all
    respond_with(@events)
  end

  def list
    @events = Event.order(:start_time)
  end

  def new
  	@event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
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
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Event updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event removed."
    redirect_to root_path
  end

end
