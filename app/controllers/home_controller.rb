class HomeController < ApplicationController
  include LatestPackages
  def index
    @text = parse_latest_packages(download_latest_packages)
  end
end
