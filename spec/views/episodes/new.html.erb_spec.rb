require 'spec_helper'

describe "episodes/new" do
  before(:each) do
    assign(:episode, stub_model(Episode,
      :title => "MyString",
      :description => "MyText",
      :note => "MyString",
      :category_id => 1,
      :picture => "MyString",
      :video => "MyString"
    ).as_new_record)
  end

  it "renders new episode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => episodes_path, :method => "post" do
      assert_select "input#episode_title", :name => "episode[title]"
      assert_select "textarea#episode_description", :name => "episode[description]"
      assert_select "input#episode_note", :name => "episode[note]"
      assert_select "input#episode_category_id", :name => "episode[category_id]"
      assert_select "input#episode_picture", :name => "episode[picture]"
      assert_select "input#episode_video", :name => "episode[video]"
    end
  end
end
