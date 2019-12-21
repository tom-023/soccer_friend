class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy]  

  def index
    @events = Event.all
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  # def confirm
  #   binding.irb
  #   @event = Events.new(event_params)
  #   @event.organizer = current_user
  #   render :new if @event.invalid?
  # end

  def show
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
        binding.irb
    if params[:back]
      render :new
    else
      if @event.save
        redirect_to events_path, notice: "イベントを作成しました！"
      else
        render 'new'
      end
    end
  end

  def update
      if @event.update(event_params)
        flash[:update] = t'flash.update'
        redirect_to event_path
      else
        render :edit
      end
  end

  def destroy
    @event.destroy
    flash[:delete] = t'flash.delete'
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :day, :place, :content, :cheering_team, :organizer_id, label_ids: [])
  end

  def ensure_correct_user
    @event = Event.find_by(id:params[:id])
    if current_user == nil || @event.organizer_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to events_path
    end
  end
end
