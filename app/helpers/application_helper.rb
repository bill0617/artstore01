module ApplicationHelper
  def notice_message
    alert_types = { notice: :success, alert: :danger }

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe

  end

  def fb_post
    fb_posts = content_tag(:div, "", class: "fb-comments",
                           data: { href: "http://developers.facebook.com/docs/plugins/comments/",
                                   numposts: "5" }).html_safe

  end

  def render_cart_items_count(cart)
    cart.items.count
  end
  
  def render_total_price(cart) 
    cart.total_price
  end

  def render_order_state(order)
    t("orders.order_state.#{order.aasm_state}")
  end

  # def full_title(page_title = '')
  #   base_title = "Ruby on Rails Tutorial Sample App"
  #   if page_title.empty?
  #     base_title
  #   else
  #     page_title + " | " + base_title
  #   end
  # end


end
