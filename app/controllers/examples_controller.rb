class ExamplesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'example'

  def index
  end
end
