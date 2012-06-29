require 'spec_helper'

describe "loggings/edit" do
  before(:each) do
    @logging = assign(:logging, stub_model(Logging,
      :user_id => 1
    ))
  end

  it "renders the edit logging form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loggings_path(@logging), :method => "post" do
      assert_select "input#logging_user_id", :name => "logging[user_id]"
    end
  end
end
