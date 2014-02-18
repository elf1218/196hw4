class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event=Event.new
  end

  def create
    @event=Event.new(event_params)
    if@event.save
        redirect_to events_path
    else
        render 'new'
    end
  end

  def edit
  end

  def show
  end

  private
  def event_params
    params.require(:event).permit(:time, :desc, :user_id, :calendar_id)
  end
end
