require_relative '../latest_packages'
require_relative '../package_info'
require_relative '../../app/models/package'

include LatestPackages
include PackageInfo

namespace :fetch_packages do

  desc "Syncronize existing package with new packages/versions"
  
  task sync_packages: :environment do
    packages = get_latest_packages
    packages.each do |package|
      Package.find_or_create(package)
    end
  end

end
