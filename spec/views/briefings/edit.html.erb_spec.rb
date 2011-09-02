require 'spec_helper'

describe "briefings/edit.html.erb" do
  before(:each) do
    @briefing = assign(:briefing, stub_model(Briefing,
      :title => "MyText",
      :description => "MyText",
      :category => "MyText",
      :source => "MyText",
      :is_quote => false,
      :user_id => 1
    ))
  end

  it "renders the edit briefing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => briefings_path(@briefing), :method => "post" do
      assert_select "textarea#briefing_title", :name => "briefing[title]"
      assert_select "textarea#briefing_description", :name => "briefing[description]"
      assert_select "textarea#briefing_category", :name => "briefing[category]"
      assert_select "textarea#briefing_source", :name => "briefing[source]"
      assert_select "input#briefing_is_quote", :name => "briefing[is_quote]"
      assert_select "input#briefing_user_id", :name => "briefing[user_id]"
    end
  end
end
