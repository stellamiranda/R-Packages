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
      package_info = package.last
      name = package_info[:name]
      version = package_info[:version]
      unless Package.find_package(name, version)
        package_full_data = get_package_info(name, version)
        Package.create_package(package_full_data)
      end
    end
  end

end
