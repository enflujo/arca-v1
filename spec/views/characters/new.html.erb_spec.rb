require 'rails_helper'

RSpec.describe "characters/new", :type => :view do
  before(:each) do
    assign(:character, Character.new(
      :name => "MyString",
      :biography => "MyText"
    ))
  end

  it "renders new character form" do
    render

    assert_select "form[action=?][method=?]", characters_path, "post" do

      assert_select "input#character_name[name=?]", "character[name]"

      assert_select "textarea#character_biography[name=?]", "character[biography]"
    end
  end
end
