class HomeController < ApplicationController
  include LatestPackages
  include PackageInfo
  def index
    @packages = Package.all
  end
end
