# frozen_string_literal: true

# Package class
class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def create
    package = Package.new(package_params)
    package.save
  end

  def show
    @package = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:name, :version, :publication_date, :title,
                                    :description, :authors, :maintainers)
  end
end
