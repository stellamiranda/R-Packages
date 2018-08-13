require 'dcf'
require 'open-uri'
require 'zlib'
require 'rubygems/package'

module PackageInfo

  def download_package_info(package, version)
    open('https://cran.r-project.org/src/contrib/' + package + '_' + version + '.tar.gz')
  end

  def extract_description(package, file)
    tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.new ( file ))
    description = ""
    tar_extract.seek(package+"/DESCRIPTION") { |entry| description = entry.read }
    return description
  end

  def parse_package_info(descriptionText)
    metadata = Dcf.parse descriptionText
    return metadata
  end

  def get_package_info(name, version)
    file = download_package_info(name, version)
    description = extract_description(name, file)
    metadata = parse_package_info(description)
    return metadata
  end

end
