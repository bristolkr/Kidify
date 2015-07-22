module ApplicationHelper
  def group_nav_link(label, url, controller_name)
    # <li class="active"><%= link_to 'Dashboard', user_path(current_user) %></li>
    content_tag :li, :class => ('active' if controller.controller_name == controller_name) do
      link_to label, url
    end
  end
end
