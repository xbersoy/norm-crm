# frozen_string_literal: true

class DashboardTitleSectionComponent < ViewComponent::Base
  def initialize(title, _breadcrumb_path = nil)
    @title = title
    @breadcrumb_path = ''
  end

end
