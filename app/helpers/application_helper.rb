module ApplicationHelper

  def logout_link
    if current_user
      link_to "Logout", logout_path, method: "post"
    end
  end

  def profile_link
    if current_user
      link_to "My Profile", user_path(current_user)
    end
  end

end
