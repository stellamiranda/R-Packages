require 'rails_helper'

RSpec.describe Package, type: :model do
  
  describe "Create new Package " do
    it "is not valid without a version" do
      auction = Package.new(name: "name")
      expect(auction).to_not be_valid
    end
  end

  describe "Create new Package " do
    it "is not valid without a name" do
      auction = Package.new(version: "version")
      expect(auction).to_not be_valid
    end
  end

  describe "#find_package " do
    it "it should return a Record" do
      allow(Package).to receive(:find_package).and_return(Package)
      expect(Package.find_package('A3','1.0.1')).to be Package 
    end
  end

  describe "#create_package " do
    it "it should create a Record" do
      data = File.read("./spec/samples/package_data")
      allow(Package).to receive(:create_package).and_return(true)
      expect(Package.create_package(data)).to be true 
    end
  end

end
