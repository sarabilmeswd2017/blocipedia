module WikiHelper
  def user_is_authorized_for_private
    (current_user.admin?) || (current_user.premium?) || (current.user = wiki.user)
  end
end
