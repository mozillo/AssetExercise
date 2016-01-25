require "rails_helper"

RSpec.describe Admin, :type => :model do
  it "Creates admin example" do
    me = Admin.create!(email: '446146366@qq.com', password: '123456', password_confirmation: '123456')
    expect(Admin.last).to eq(me)
  end
end