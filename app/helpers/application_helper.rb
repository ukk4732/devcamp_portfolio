module ApplicationHelper
  
  def header_links(style)
    if current_user.is_a?(GuestUser) && style == "text-white"
      (link_to "Register", new_user_registration_path, class: style) + "<br>".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    elsif current_user.is_a?(GuestUser)
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

  def nav_items(style, tag)
links = <<NAV
<#{tag}><a href="#{root_path}", class="#{style}">Home</a></#{tag}>
<#{tag}><a href="#{about_path}", class="#{style}">About</a></#{tag}>
<#{tag}><a href="#{contact_path}", class="#{style}">Contact</a></#{tag}>
<#{tag}><a href="#{blogs_path}", class="#{style}">Blogs</a></#{tag}>
<#{tag}><a href="#{portfolios_path}", class="#{style}">Portfolios</a></#{tag}>
NAV
links.html_safe
  end

end