require 'spec_helper'

describe "currencies/show" do
  before(:each) do
    @currency = assign(:currency, stub_model(Currency,
      :name => "Name",
      :iso_code => "Iso Code",
      :leading_symbol => "Leading Symbol",
      :trailing_symbol => "Trailing Symbol",
      :thousands_separator => "Thousands Separator",
      :decimal_separator => "Decimal Separator",
      :active => false
    ))
  end

  xit "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Iso Code/)
    rendered.should match(/Leading Symbol/)
    rendered.should match(/Trailing Symbol/)
    rendered.should match(/Thousands Separator/)
    rendered.should match(/Decimal Separator/)
    rendered.should match(/false/)
  end
end
