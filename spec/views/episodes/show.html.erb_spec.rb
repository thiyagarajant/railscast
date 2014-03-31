require 'spec_helper'

describe "episodes/show" do
  before(:each) do
    @episode = assign(:episode, stub_model(Episode,
      :title => "Title",
      :description => "MyText",
      :note => "Note",
      :category_id => 1,
      :picture => "Picture",
      :video => "Video"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Note/)
    rendered.should match(/1/)
    rendered.should match(/Picture/)
    rendered.should match(/Video/)
  end
end
