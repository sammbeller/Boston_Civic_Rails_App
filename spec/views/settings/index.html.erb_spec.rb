require 'spec_helper'

describe "settings/index" do
  before(:each) do
    assign(:settings, [
      stub_model(Setting,
        :prompt => "Prompt",
        :name => "Name",
        :value => 1
      ),
      stub_model(Setting,
        :prompt => "Prompt",
        :name => "Name",
        :value => 1
      )
    ])
  end

  it "renders a list of settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prompt".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
