module ApplicationHelper
	  def header_logic
    if user_signed_in?
      @header_text = if (current_user.first_name.blank? && current_user.last_name.blank?)
                    'Edit profile'
                  else
                    'Hi, ' + current_user.first_name.to_s + ' ' + current_user.last_name.to_s                    
                  end
      render 'header/signout'
    else
      render 'header/signin'
    end
  end

  def bootstrap_class_for(name)
    {
      success: "alert-success",
      error: "alert-danger",
      danger: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }[name.to_sym] || name
  end
end
