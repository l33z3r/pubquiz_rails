require 'spec_helper'

describe "currencies/edit" do
  before(:each) do
    @currency = assign(:currency, stub_model(Currency,
      :name => "MyString",
      :iso_code => "MyString",
      :leading_symbol => "MyString",
      :trailing_symbol => "MyString",
      :thousands_separator => "MyString",
      :decimal_separator => "MyString",
      :active => false
    ))
  end

  xit "renders the edit currency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", currency_path(@currency), "post" do
      assert_select "input#currency_name[name=?]", "currency[name]"
      assert_select "input#currency_iso_code[name=?]", "currency[iso_code]"
      assert_select "input#currency_leading_symbol[name=?]", "currency[leading_symbol]"
      assert_select "input#currency_trailing_symbol[name=?]", "currency[trailing_symbol]"
      assert_select "input#currency_thousands_separator[name=?]", "currency[thousands_separator]"
      assert_select "input#currency_decimal_separator[name=?]", "currency[decimal_separator]"
      assert_select "input#currency_active[name=?]", "currency[active]"
    end
  end
end
