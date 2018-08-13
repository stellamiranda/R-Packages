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
        package = package[1]
        unless Package.package_exist(package[:name], package[:version]) 
             packageInfo = get_package_info(package[:name], package[:version])
             puts packageInfo
        end
    end
  end

end
