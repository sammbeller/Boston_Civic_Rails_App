require 'spec_helper'

describe "loggings/new" do
  before(:each) do
    assign(:logging, stub_model(Logging,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new logging form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loggings_path, :method => "post" do
      assert_select "input#logging_user_id", :name => "logging[user_id]"
    end
  end
end
