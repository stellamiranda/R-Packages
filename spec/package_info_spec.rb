require 'spec_helper'
require 'open-uri'

require_relative '../lib/package_info'

#Test are based on fetching packages from this Sample page https://r-package-list.herokuapp.com/PACKAGES

class TestPackageClass
end

describe PackageInfo do

  before(:each) do
    @dummy = TestPackageClass.new
    @dummy.extend(PackageInfo)
  end
  context "When #download_package_info method is called" do
    it "should fetch package info from URL" do
      expect(@dummy.download_package_info("A3","1.0.0")).to be_an_instance_of(Tempfile)
    end
  end

  context "When #extract_description method is called" do
    it "is a pending example"
  end

  context "When #parse_package_info method is called" do
    it "is a pending example"
  end

  context "When #get_package_info method is called" do
    it "is a pending example"
  end

end
