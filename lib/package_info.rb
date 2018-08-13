require 'dcf'
require 'open-uri'
require 'zlib'
require 'rubygems/package'

module PackageInfo

  def download_package_info(package, version)
    open('https://cran.r-project.org/src/contrib/' + package + '_' + version + '.tar.gz')
  end

  def extractDescription(package, file)
    tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.new ( file ))
    description = ""
    tar_extract.seek(package+"/DESCRIPTION") { |entry| description = entry.read }
    return description
  end

end
