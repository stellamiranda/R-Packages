# frozen_string_literal: true

require 'dcf'
require 'open-uri'

URL = 'spec/samples/r_packages_list'

# Module Latest packages
module LatestPackages
  def download_latest_packages(url = URL)
    open(url).read
  end

  def parse_latest_packages(text)
    # Explode text on empty line 
    packages = text.split('\n\n')
    # Iterate packages and parse DCF
    final_packages = {}
    packages.each do |package|
      metadata = (Dcf.parse package).reduce({}, :merge)
      final_packages.merge!({ metadata['Package'] =>
        { name: metadata['Package'], version: metadata['Version'] } })
    end
    final_packages
  end

  def latest_packages
    latest_package_files = download_latest_packages
    latest_packages = parse_latest_packages(latest_package_files)
    latest_packages
  end
end
