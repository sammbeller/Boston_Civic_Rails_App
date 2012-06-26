require 'spec_helper'

describe "settings/show" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :prompt => "Prompt",
      :name => "Name",
      :value => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prompt/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
