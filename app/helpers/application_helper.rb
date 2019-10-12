module ApplicationHelper
  
  def header_links(style)
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) + " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def visitor_message(layout)
    if session[:source]
      content_tag(:p, "Thanks for comming from: #{session[:source]}, currently you are on #{layout} layout.", class: "xyz")
    end
  end

  def copyright_message
    UmeshGem::Copyright.copyright_message("Umesh", "All right regerved.")
  end

end
