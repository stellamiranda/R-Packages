require 'spec_helper'

require_relative '../lib/latest_packages'

class TestPackageClass
end

describe LatestPackages do

before(:each) do
  @dummy = TestPackageClass.new
  @dummy.extend(LatestPackages)
end

it "Download packages from URL" do
  sample = File.read("./spec/samples/download_latest_packages")
  output = @dummy.download_latest_packages('https://r-package-list.herokuapp.com/PACKAGES')
  expect(output).to eq sample
end

end
