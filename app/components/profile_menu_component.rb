# frozen_string_literal: true

class ProfileMenuComponent < ViewComponent::Base
  def initialize(full_name:)
    @full_name = full_name
  end
end
