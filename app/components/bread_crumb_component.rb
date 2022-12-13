# frozen_string_literal: true

class BreadCrumbComponent < ViewComponent::Base
  def initialize(path)
    if path.present?
      @path = path
    else
      @path = nil
    end
  end

end
