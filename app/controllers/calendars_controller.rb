class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end

  def new
    if user_signed_in?
      @calendar = Calendar.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @calendar=Calendar.new(calendar_params)
    if @calendar.user_id != current_user.id
      redirect_to root_path
    else
      if@calendar.save
          redirect_to calendars_path
      else
          render 'new'
      end
    end
  end

  def edit
      @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.user_id != current_user.id
      render 'edit'
    else
      if @calendar.update_attributes(calendar_params)
        redirect_to calendar_path(@calendar.id)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path
  end

  def show
      @calendar = Calendar.find(params[:id])
      @events = Event.where(calendar_id: @calendar.id).order(time: :asc).limit(5)
  end

  def my
      if user_signed_in?
        @user = current_user
        @calendars = Calendar.where(user_id: @user.id).order(title: :desc)
      else
        redirect_to new_user_session_path
      end
  end

  private
  def calendar_params
    params.require(:calendar).permit(:title, :user_id)
  end

end
