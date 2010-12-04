module ApplicationHelper
  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, {:sort => column, :direction => direction, :q => @q}, {:class => css_class}  
  end

  def alphabetical_query_list(query)
    li = link_to_unless query.blank?, "All"
    list = [content_tag(:li, li)]
    "A".upto("Z") do |l|
      li = link_to_unless l == query, l, :qs => l
      list.push(content_tag(:li, li)) 
    end
    content_tag :ul, list.join("\n").html_safe, :class => "alphabetical"
  end

  def nav_class(name)
    controller.controller_name == name ? "current" : 0
  end

  def page_title(title)
      content_for(:title) {title}
  end

  def help(helptext)
    '<span class="help"><span class="helpmark">?</span><div class="helptext">' + helptext + '</div></span>'
  end
end
