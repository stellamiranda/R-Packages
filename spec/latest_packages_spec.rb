# frozen_string_literal: true

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

  context 'When #download_package_info method is called' do
    it 'should fetch package info from URL' do
      expect(@dummy.download_latest_packages).to_not be_empty
    end
  end

  context 'When #download_latest_packages method is called' do
    it 'should download packages from URL' do
      sample = File.read('./spec/samples/download_latest_packages')
      output = @dummy.download_latest_packages()
      expect(output).to eq sample
    end
  end

  context 'When #parse_latest_packages method is called' do
    it 'should parse packages' do
      data = File.read('./spec/samples/download_latest_packages')
      sample = { "ABCanalysis" => { :name => "ABCanalysis", :version => "1.2.1" } }
      output = @dummy.parse_latest_packages(data)
      expect(output).to eq sample
    end
  end

  context 'When #latest_packages method is called' do
    it 'should return latest packages' do
      data = File.read('./spec/samples/download_latest_packages')
      sample = { "ABCanalysis" => { :name => "ABCanalysis", :version => "1.2.1" } }
      output = @dummy.latest_packages
      expect(output).to eq sample
    end
  end
end
