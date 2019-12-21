module EventsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_events_path
    elsif action_name == 'edit'
      confirm_event_path(@event.id)
    end
  end
end
