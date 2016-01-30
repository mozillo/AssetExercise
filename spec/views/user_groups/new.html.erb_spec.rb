require 'rails_helper'

RSpec.describe "user_groups/new", type: :view do
  before(:each) do
    assign(:user_group, UserGroup.new(
      :user_id => 1,
      :group_name => "MyString",
      :admin_id => 1
    ))
  end

  it "renders new user_group form" do
    render

    assert_select "form[action=?][method=?]", user_groups_path, "post" do

      assert_select "input#user_group_user_id[name=?]", "user_group[user_id]"

      assert_select "input#user_group_group_name[name=?]", "user_group[group_name]"

      assert_select "input#user_group_admin_id[name=?]", "user_group[admin_id]"
    end
  end
end
