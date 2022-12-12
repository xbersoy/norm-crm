# frozen_string_literal: true

class BreadCrumbComponent < ViewComponent::Base
  def initialize(path:)
    @path = path
  end

end
