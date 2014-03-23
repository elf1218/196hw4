class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    if user_signed_in?
      @event = Event.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @event=Event.new(event_params)
    if @event.user_id != current_user.id
      redirect_to root_path
      else
      if@event.save
          Notifications.new_event(@event).deliver
          redirect_to events_path
      else
          render 'new'
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.user_id != current_user.id
      render 'edit'
    else
      if @event.update_attributes(event_params)
        redirect_to event_path(@event.id)
      else
          render 'edit'
      end
    end
  end

  def show
      @event = Event.find(params[:id])
  end

  def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:time, :desc, :user_id, :calendar_id)
  end
end
