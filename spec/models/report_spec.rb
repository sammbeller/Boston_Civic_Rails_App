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

	describe "when latitude is of incorrect format" do
		it "should be invalid" do
			values = ["string"]
			values.each do |value|
				@report.latitude = value
				@report.should_not be_valid
			end
		end
	end

	describe "when latitude is of correct format" do
		it "should be valid" do
			values = ["42.3657306"]
			values.each do |value|
				@report.latitude = value
				@report.should be_valid
			end
		end
	end

	describe "longitude must not be nil" do
		before { @report.longitude = nil }
		it { should_not be_valid }
	end

	describe "longitude must be present" do
		before { @report.longitude = " " }
		it { should_not be_valid }
	end

	describe "when longitude is of incorrect format" do
		it "should be invalid" do
			values = ["string"]
			values.each do |value|
				@report.longitude = value
				@report.should_not be_valid
			end
		end
	end

	describe "when longitude is of correct format" do
		it "should be valid" do
			values = ["42.3657306"]
			values.each do |value|
				@report.longitude = value
				@report.should be_valid
			end
		end
	end

	describe "timestamp must not be nil" do
		before { @report.timestamp = nil }
		it { should_not be_valid }
	end

	describe "timestamp must be present" do
		before { @report.timestamp = " " }
		it { should_not be_valid }
	end

	describe "when timestamp is of incorrect format" do
		it "should be invalid" do
			values = ["string", false]
			values.each do |value|
				@report.timestamp = value
				@report.should_not be_valid
			end
		end
	end

	describe "when timestamp is of correct format" do
		it "should be valid" do
			values = ["42.3657306"]
			values.each do |value|
				@report.timestamp = value
				@report.should be_valid
			end
		end
	end
end