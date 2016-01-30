require 'rails_helper'

RSpec.describe "user_groups/index", type: :view do
  before(:each) do
    assign(:user_groups, [
      UserGroup.create!(
        :user_id => 1,
        :group_name => "Group Name",
        :admin_id => 2
      ),
      UserGroup.create!(
        :user_id => 1,
        :group_name => "Group Name",
        :admin_id => 2
      )
    ])
  end

  it "renders a list of user_groups" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Group Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
