class Package < ActiveRecord::Base

  def self.exist?(name, version)
    Package.where(name: name, version: version).first.exist?
  end

  def self.package_exist(name, version)
    return false 
  end
end
