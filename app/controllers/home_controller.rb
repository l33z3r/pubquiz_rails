class HomeController < ApplicationController
  def index
    if current_user
      a = 1
    end
  end
end
