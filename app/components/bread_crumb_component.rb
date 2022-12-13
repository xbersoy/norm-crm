# frozen_string_literal: true

class BreadCrumbComponent < ViewComponent::Base
  def initialize(path: nil)
    @path = path
  end

end
