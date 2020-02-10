class ParticipantManagementsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = @event.organizer
    current_user.participant_managements.create(event_id: params[:event_id])
    render 'index.js.erb'
    #redirect_to events_url, notice: "#{participant_management.event.organizer.name}さんのイベントに参加しました"
    # EventMailer.event_mail(@user, @event).deliver
  end

  def destroy
    @participant_management = ParticipantManagement.find(params[:id])
    @event = @participant_management.event
    @user = @event.organizer
    current_user.participant_managements.find_by(id: params[:id]).destroy
    render 'index.js.erb'
    #redirect_to events_url, notice: "#{participant_management.event.organizer.name}さんのイベントをキャンセルしました"
    # CancelMailer.cancel_mail(@user, @event).deliver
  end

end
