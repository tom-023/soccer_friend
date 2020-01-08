class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy]  

  def index
    @events = Event.all
    @all_ranks = Event.find(ParticipantManagement.group(:event_id).order('count(event_id) desc').limit(3).pluck(:event_id))
    if params[:syosinsya].present?
      @events = @events.joins(:tags).where(tags: { id: 1 }) #初心者タグのイベント
    elsif params[:small_group].present?
      @events = @events.joins(:tags).where(tags: { id: 2 }) #少人数タグのイベント
    elsif params[:woman_supporter].present?
      @events = @events.joins(:tags).where(tags: { id: 3 }) #女性限定タグのイベント
    elsif params[:cheering_team]
      @events = @events.where('cheering_team LIKE ?', "%#{params[:cheering_team]}%")
    end
    @events = @events.page(params[:page]).per(4).order(created_at: :desc)
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
      # @event.taggings.build
    else
      @event = Event.new
    end
    @event.taggings.build
  end

  def confirm
    @event = Event.new(event_params)
    @event.organizer = current_user
    render :new if @event.invalid?
  end

  def show
    @event_participant_users = @event.participant_users
    @participant_management = current_user.participant_managements.find_by(event_id: @event.id)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
    if params[:back]
      render :new
    else
      if @event.save
        redirect_to events_path, notice: "イベントを作成しました！"
      else
        render :new
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
    params.require(:event).permit(:title, :day, :place, :content, :cheering_team, :organizer_id, tag_ids: [])
  end

  def ensure_correct_user
    @event = Event.find_by(id:params[:id])
    if current_user == nil || @event.organizer_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to events_path
    end
  end
end
