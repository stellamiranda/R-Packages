require 'spec_helper'

require_relative '../lib/package_info'

#Test are fetching packages from this Sample page https://r-package-list.herokuapp.com/PACKAGES

class TestPackageClass
end

describe PackageInfo do

  before(:each) do
    @dummy = TestPackageClass.new
    @dummy.extend(PackageInfo)
  end
  context "When #download_package_info method is called" do
    it "should fetch package info from URL" do
      
    end
  end


end
