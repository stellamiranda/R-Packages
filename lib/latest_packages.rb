require 'dcf'
require 'open-uri'

module LatestPackages
  def download_latest_packages(url='https://cran.r-project.org/src/contrib/PACKAGES')
    file = open(url).read
  end

  def parse_latest_packages(text)
    # Explode text on empty line 
    packages = text.split("\n\n")
    # Iterate packages and parse DCF
    finalPackages = Hash.new
    packages.each do |package|
        metadata = (Dcf.parse package).reduce({}, :merge)
        finalPackages.merge!( { metadata["Package"] => 
          { name: metadata["Package"], version: metadata["Version"] }})
    end
    return finalPackages
  end

  def get_latest_packages
    latestPackagesFile = download_latest_packages()
    latestPackages = parse_latest_packages(latestPackagesFile)
    return latestPackages
  end 
end
