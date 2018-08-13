class HomeController < ApplicationController
  include LatestPackages
  def index
    @text = download_latest_packages
  end
end
