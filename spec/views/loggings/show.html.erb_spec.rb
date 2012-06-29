require 'spec_helper'

describe "loggings/show" do
  before(:each) do
    @logging = assign(:logging, stub_model(Logging,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
