module UsersHelper
  def choose_edit
    if action_name == 'edit'
      { method: :patch }
    end
  end
end
