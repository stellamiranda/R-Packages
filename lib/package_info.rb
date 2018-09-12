# frozen_string_literal: true

require 'dcf'
require 'open-uri'
require 'zlib'
require 'rubygems/package'

# Module PackageInfo

module PackageInfo

  URL = 'https://cran.r-project.org/src/contrib/'

  def download_package_info(package, version)
    begin
      open( URL + package + '_' + version + '.tar.gz')
    rescue => exception
      puts package + " info Not Found"
      nil
    end
  
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

  def package_info(name, version)
    file = download_package_info(name, version)
    unless  file.nil?
      description = extract_description(name, file)
      metadata = parse_package_info(description)
      return metadata
    end
    return nil
  end

end
