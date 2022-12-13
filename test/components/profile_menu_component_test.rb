# frozen_string_literal: true

require 'test_helper'

class ProfileMenuComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    assert_equal(
      %(<div class="dropdown" id="profileMenu">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
        <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="color: black;">Burak Ersoy</span>
        <img src="https://github.com/mdo.png" alt="" width="40" height="40" class="rounded-circle mx-2">
      </a>
      <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
        <li><a class="dropdown-item" href="#">New project...</a></li>
        <li><a class="dropdown-item" href="#">Settings</a></li>
        <li><%= link_to 'Profile', edit_user_registration_path, class: 'dropdown-item' %></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">Sign out</a></li>
      </ul>
    </div>
    ),
      render_inline(ProfileMenuComponent.new(full_name: 'Burak Ersoy')).to_html
    )
  end
end
