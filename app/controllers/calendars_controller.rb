class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end

  def new
    @calendar=Calendar.new
  end

  def create
    @calendar=Calendar.new(calendar_params)
    if@calendar.save
        redirect_to calendars_path
    else
        render 'new'
    end
  end

  def edit
  end

  def show
  end

  private
  def calendar_params
    params.require(:calendar).permit(:title, :user_id)
  end

end
