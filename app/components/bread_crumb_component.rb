# frozen_string_literal: true

class BreadCrumbComponent < ViewComponent::Base
  def initialize(path)
    @path = (path if path.present?)
  end
end
