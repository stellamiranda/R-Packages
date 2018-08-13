class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def create
    package = Package.new(package_params)
    if package.save
      puts "package was created"
    end
  end

  def package_params
    params.require(:package).permit(:name, :version, :publication_date, :title, :description, :authors, :maintainers )
  end
end


