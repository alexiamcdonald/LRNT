module ApplicationHelper
  def model_options(model_name, selected=nil, options={})
      if options[:option_title].presence || false
        opts = model_name.list_order.collect{|item| ["#{item.try(:option_title).presence || item.name}", item.id]}
      else
        opts = model_name.list_order.collect{|item| [item.name, item.id]}
      end
      options_for_select(opts, selected)
    end
end
