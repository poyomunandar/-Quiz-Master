module ApplicationHelper
  def glyph_text_to(action, options, html_options = {})
    link_to("<span>#{html_options[:text] || action.capitalize}</span>".html_safe, options,
    { :class => "wide_button wide_button_#{action.downcase}" }.merge(html_options))
  end

  # renders will_paginate helper without line break and adds selector for items per page
  # in view use it like regular will_paginate:
  #   <%= will_paginate_extended @items %>
  # in controller don't forget to use paginate's :per_page parameter:
  #   @items = Item.paginate(:page => params[:page], :per_page => params[:per_page])
  def will_paginate_extended(collection, options = {})
    all_options = { style: 'display: inline-block;' }
    all_options = options.merge(all_options)

    (will_paginate(collection, all_options) || ''.html_safe) +
    '&nbsp;&nbsp;&nbsp;&nbsp;Per page: '.html_safe +
    select_tag(:per_page, options_for_select([5, 10, 20], params[:per_page] || 10),
    onchange: "if(this.value){window.location='?per_page='+this.value;}")
  end

  def glyph_to(action, options, html_options = {})
    link_to('', options, { :class => "button #{action.downcase}", title: action.capitalize }.merge(html_options))
  end

end
