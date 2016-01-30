require 'rails_helper'

RSpec.describe "user_groups/show", type: :view do
  before(:each) do
    @user_group = assign(:user_group, UserGroup.create!(
      :user_id => 1,
      :group_name => "Group Name",
      :admin_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Group Name/)
    expect(rendered).to match(/2/)
  end
end
