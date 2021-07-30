require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        name: "Name",
        description: "MyText",
        price: 2.5,
        category: "Category",
        user: nil
      ),
      Listing.create!(
        name: "Name",
        description: "MyText",
        price: 2.5,
        category: "Category",
        user: nil
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
