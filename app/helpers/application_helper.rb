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

  def link_items
    [
      {
        url: root_path,
        name: "Home"
      },
      {
        url: about_path,
        name: "About"
      },
      {
        url: contact_path,
        name: "Contact"
      },
      {
        url: blogs_path,
        name: "Blog"
      },
      {
        url: portfolios_path,
        name: "Portfolio"
      }
    ]
  end

  def nav_items(style, tag)
    links = ""
    link_items.each do |link|
      links << "<#{tag}><a href='#{link[:url]}', class='#{style} #{active?(link[:url])}'>#{link[:name]}</a></#{tag}>"
    end
    links.html_safe
  end

  def active? path
    "active" if current_page?(path)
  end

end