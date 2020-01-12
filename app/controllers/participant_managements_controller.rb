class ParticipantManagementsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = @event.organizer
    participant_management = current_user.participant_managements.create(event_id: params[:event_id])
    redirect_to events_url, notice: "#{participant_management.event.organizer.name}さんのイベントに参加しました"
    EventMailer.event_mail(@user, @event).deliver
  end

  def destroy
    participant_management = current_user.participant_managements.find_by(id: params[:id]).destroy
    redirect_to events_url, notice: "#{participant_management.event.organizer.name}さんのイベントをキャンセルしました"
  end

end
