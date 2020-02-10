class EventsController < ApplicationController
  before_action :set_event, only: %i(show)
  before_action :ensure_current_user, only: %i(edit update destroy)
  before_action :search_result, only: %i(syosinsya woman_supporter small_group)

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).display(params[:page])
    @all_ranks = Event.ranking
    if params[:sort]
      @events = Event.day_sort(params[:page])
    end
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
    @event.taggings.build
  end

  def confirm
    @event = Event.new(event_params)
    # @event.id = params[:id]
    @event.organizer = current_user
    render :new if @event.invalid?
  end

  def show
    #@event_participant_users = @event.participant_users
    #@participant_management = current_user.participant_managements.find_by(event_id: @event.id)
  end

  def edit
    # @event.attributes = params[:event] if request.put?
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
    if params[:back]
      render :new
    else
      if @event.save
        redirect_to events_path, notice: t('views.messages.notice_create')
      else
        render :new
      end
    end
  end

  def update
    if @event.update(event_params)
      flash[:update] = t('views.messages.notice_update')
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:delete] = t('views.messages.notice_delete')
    redirect_to events_path
  end

  def syosinsya
    @events = @events.tagjoin(1) if params[:syosinsya].present?
  end

  def woman_supporter
    @events = @events.tagjoin(3) if params[:woman_supporter].present?
  end

  def small_group
    @events = @events.tagjoin(2) if params[:small_group].present?
  end

  def search
    @q = Event.search(search_params)
    @events = @q.result(distinct: true)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:id, :title, :day, :place, :content, :cheering_team, :organizer_id, tag_ids: [])
  end

  def search_result
    @events = Event.select(:id, :title, :place, :cheering_team, :day)
  end

  def search_params
    params.require(:q).permit!
  end

  def ensure_current_user
    @event = Event.find_by(id:params[:id])
    if current_user == nil || @event.organizer_id != current_user.id
      flash[:notice] = t('views.messages.notice_authority')
      redirect_to events_path
    end
  end
end
