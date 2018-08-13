class Package < ActiveRecord::Base

  def self.find_or_create(data)
    package_data =  data.last
    Package.where(name: package_data[:name], version: package_data[:version]).first_or_create do |package|
      package.publication_date = package_data[:publication_date]
      package.title = package_data[:title],
      package.description = package_data[:description],
      package.authors = package_data[:authors],
      package.maintainers = package_data[:maintainers]
    end
  end
  
end
