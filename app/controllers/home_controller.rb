class HomeController < ApplicationController
  def index
    @hospital = Hospital.all
  end
end
