# frozen_string_literal: true

require_relative '../latest_packages'
require_relative '../package_info'
require_relative '../../app/models/package'

namespace :fetch_packages do
  include LatestPackages
  include PackageInfo

  desc 'Syncronize existing package with new packages/versions'
  task sync_packages: :environment do
    packages = latest_packages
    packages.each do |package|
      package_info = package.last
      unless package_info.nil?
        name = package_info[:name]
        version = package_info[:version]
        unless Package.find_package(name, version)
          package_full_data = package_info(name, version)
          Package.create(package_full_data)
        end
      end
    end
  end
end
