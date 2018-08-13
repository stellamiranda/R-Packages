require 'open-uri'

module LatestPackages
  def download_latest_packages
    file = open('https://cran.r-project.org/src/contrib/PACKAGES').read
  end
end
