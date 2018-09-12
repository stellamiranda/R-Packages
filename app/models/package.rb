class Package < ActiveRecord::Base
  validates :name, :version, presence: true
  def self.find_package(name, version)
    Package.where(name: name, version: version).first
  end

  def self.create_package(data)
    package_data = data.reduce({}, :merge)
    Package.create(name: package_data['Package'], 
      version: package_data['Version'],
      publication_date: package_data['Date/Publication'],
      title: package_data['Title'],
      description: package_data['Description'],
      authors: package_data['Author'],
      maintainers: package_data['Maintainer'])
  end
  
end
