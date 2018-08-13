class HomeController < ApplicationController
  include LatestPackages
  include PackageInfo
  def index
    @text = ""
  end
end
