class DocumentationController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'example'

  def index
    @user = User.new
  end
end
