module EventsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_events_path
    elsif action_name == 'edit'
      confirm_event_path(@event.id)
    end
  end

  def confirm_new_or_edit
    unless @event.id?
      events_path
    else
      event_path
    end
  end

  def confirm_form_method
    @event.id ? 'patch' : 'post' # 作成時はpost, 編集時は patchを指定
  end
end
