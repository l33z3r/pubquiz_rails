require 'spec_helper'

describe "currencies/index" do
  before(:each) do
    assign(:currencies, [
      stub_model(Currency,
        :name => "Name",
        :iso_code => "Iso Code",
        :leading_symbol => "Leading Symbol",
        :trailing_symbol => "Trailing Symbol",
        :thousands_separator => "Thousands Separator",
        :decimal_separator => "Decimal Separator",
        :active => false
      ),
      stub_model(Currency,
        :name => "Name",
        :iso_code => "Iso Code",
        :leading_symbol => "Leading Symbol",
        :trailing_symbol => "Trailing Symbol",
        :thousands_separator => "Thousands Separator",
        :decimal_separator => "Decimal Separator",
        :active => false
      )
    ])
  end

  xit "renders a list of currencies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Iso Code".to_s, :count => 2
    assert_select "tr>td", :text => "Leading Symbol".to_s, :count => 2
    assert_select "tr>td", :text => "Trailing Symbol".to_s, :count => 2
    assert_select "tr>td", :text => "Thousands Separator".to_s, :count => 2
    assert_select "tr>td", :text => "Decimal Separator".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
