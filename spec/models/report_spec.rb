require 'spec_helper'

describe Report do

	before do
		@report = Report.new(latitude: 42.3657306, longitude: -71.267405, timestamp: "1341235426528")
	end

	it { should respond_to(:latitude) }
	it { should respond_to(:longitude) }
	it { should respond_to(:timestamp) }
	it { should respond_to(:user) }

	describe "latitude must not be nil" do
		before { @report.latitude = nil }
		it { should_not be_valid }
	end

	describe "latitude must be present" do
		before { @report.latitude = " " }
		it { should_not be_valid }
	end

	describe "longitude must not be nil" do
		before { @report.longitude = nil }
		it { should_not be_valid }
	end

	describe "longitude must be present" do
		before { @report.longitude = " " }
		it { should_not be_valid }
	end

	describe "timestamp must not be nil" do
		before { @report.timestamp = nil }
		it { should_not be_valid }
	end

	describe "timestamp must be present" do
		before { @report.timestamp = " " }
		it { should_not be_valid }
	end