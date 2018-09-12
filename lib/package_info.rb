# frozen_string_literal: true

require 'dcf'
require 'open-uri'
require 'zlib'
require 'rubygems/package'

# Module PackageInfo

module PackageInfo

  def download_package_info(url = 'https://cran.r-project.org/src/contrib/', package, version)
    open( url + package + '_' + version + '.tar.gz')
  end

  def extract_description(package, file)
    tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.new(file))
    description = ''
    tar_extract.seek(package + '/DESCRIPTION') { |entry| description = entry.read }
    description
  end

  def parse_package_info(description_text)
    metadata = Dcf.parse description_text
    metadata
  end

  def package_info(url, name, version)
    file = download_package_info(url, name, version)
    description = extract_description(name, file)
    metadata = parse_package_info(description)
    metadata
  end

end
