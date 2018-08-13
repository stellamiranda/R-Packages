require 'spec_helper'

require_relative '../lib/latest_packages'

#Test are fetching packages from this Sample page https://r-package-list.herokuapp.com/PACKAGES

class TestPackageClass
end

describe LatestPackages do

  before(:each) do
    @dummy = TestPackageClass.new
    @dummy.extend(LatestPackages)
  end

  context "When #download_package_info method is called" do
    it "should fetch package info from URL" do
      expect(@dummy.download_latest_packages).to_not be_empty
    end
  end

  context "When #download_latest_packages method is called" do
    it "should download packages from URL" do
      sample = File.read("./spec/samples/download_latest_packages")
      output = @dummy.download_latest_packages()
      expect(output).to eq sample
    end
  end

  context "When #parse_latest_packages method is called" do
    it "should parse packages" do
      data = File.read("./spec/samples/download_latest_packages")
      sample = {"A3"=>{:name=>"A3", :version=>"1.0.0"}, "abbyyR"=>{:name=>"abbyyR", :version=>"0.5.4"}, "abc"=>{:name=>"abc", :version=>"2.1"}, "abc.data"=>{:name=>"abc.data", :version=>"1.0"}, "ABC.RAP"=>{:name=>"ABC.RAP", :version=>"0.9.0"}, "ABCanalysis"=>{:name=>"ABCanalysis", :version=>"1.2.1"}}
      output = @dummy.parse_latest_packages(data)
      expect(output).to eq sample
    end
  end

  context "When #get_latest_packages method is called" do
    it "should return latest packages" do
      data = File.read("./spec/samples/download_latest_packages")
      sample = {"A3"=>{:name=>"A3", :version=>"1.0.0"}, "abbyyR"=>{:name=>"abbyyR", :version=>"0.5.4"}, "abc"=>{:name=>"abc", :version=>"2.1"}, "abc.data"=>{:name=>"abc.data", :version=>"1.0"}, "ABC.RAP"=>{:name=>"ABC.RAP", :version=>"0.9.0"}, "ABCanalysis"=>{:name=>"ABCanalysis", :version=>"1.2.1"}}
      output = @dummy.get_latest_packages
      expect(output).to eq sample
    end
  end
end
