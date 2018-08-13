class HomeController < ApplicationController
  include LatestPackages
  def index
    @text = get_latest_packages
  end
end
