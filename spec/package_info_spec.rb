# frozen_string_literal: true

require 'spec_helper'
require 'open-uri'

require_relative '../lib/package_info'

# Test are based on fetching first 5 packages

class TestPackageClass
end

describe PackageInfo do

  before(:each) do
    @dummy = TestPackageClass.new
    @dummy.extend(PackageInfo)
  end
  context 'When #download_package_info method is called' do
    it 'should fetch package info from URL' do
      expect(@dummy.download_package_info('spec/samples/', 'A3', '1.0.0')).to be_an_instance_of(File)
    end
  end

  context 'When #extract_description method is called' do
    it 'should extract DESCRIPTION content from .tar.gz' do
      file = open('spec/samples/A3_1.0.0.tar.gz')
      sample = File.read('./spec/samples/extract_description')
      expect(@dummy.extract_description('A3', file)).to eq(sample)
    end
  end

  context 'When #parse_package_info method is called' do
    it 'should parse data content to Hash' do
      data = 'Package: A3'
      sample = [{ 'Package' => 'A3' }]
      expect(@dummy.parse_package_info(data)).to eq(sample)
    end
  end

  context 'When #package_info method is called' do
    it 'should parse data content to Hash' do
      sample = [{ 'Package' => 'A3', 
                  'Type' => 'Package',
                  'Title' => 'Accurate, Adaptable, and Accessible Error Metrics for Predictive Models',
                  'Version' => '1.0.0',
                  'Date' => '2015-08-15',
                  'Author' => 'Scott Fortmann-Roe',
                  'Maintainer' => 'Scott Fortmann-Roe <scottfr@berkeley.edu>',
                  'Description' => 'Supplies tools for tabulating and analyzing the results of predictive models. The methods employed are applicable to virtually any predictive model and make comparisons between different methodologies straightforward.',
                  'License' => 'GPL (>= 2)',
                  'Depends' => 'R (>= 2.15.0), xtable, pbapply',
                  'Suggests' => 'randomForest, e1071',
                  'NeedsCompilation' => 'no',
                  'Packaged' => '2015-08-16 14:17:33 UTC; scott',
                  'Repository' => 'CRAN',
                  'Date/Publication' => '2015-08-16 23:05:52' }]
      expect(@dummy.package_info('spec/samples/', 'A3', '1.0.0')).to eq(sample)
    end
  end

end
