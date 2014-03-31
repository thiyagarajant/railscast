require 'spec_helper'

describe "episodes/index" do
  before(:each) do
    assign(:episodes, [
      stub_model(Episode,
        :title => "Title",
        :description => "MyText",
        :note => "Note",
        :category_id => 1,
        :picture => "Picture",
        :video => "Video"
      ),
      stub_model(Episode,
        :title => "Title",
        :description => "MyText",
        :note => "Note",
        :category_id => 1,
        :picture => "Picture",
        :video => "Video"
      )
    ])
  end

  it "renders a list of episodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
  end
end
