# frozen_string_literal: true

class DashboardQuickCardComponent < ViewComponent::Base
  def initialize(icon_color, icon_type, title, value, direction, footer_value , footer_text)
    @icon_color = icon_color
    @icon_type = icon_type
    @title = title
    @value = value
    @direction = direction
    @footer_value = footer_value
    @footer_text = footer_text
    @text_state = direction == 'up' ? 'text-success' : 'text-danger'
  end
end
