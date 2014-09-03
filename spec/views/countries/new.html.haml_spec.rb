require 'spec_helper'

describe "countries/new" do
  before(:each) do
    assign(:country, stub_model(Country,
      :name => "MyString",
      :in_the_eu => false,
      :currency_id => 1
    ).as_new_record)
  end

  xit "renders new country form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", countries_path, "post" do
      assert_select "input#country_name[name=?]", "country[name]"
      assert_select "input#country_in_the_eu[name=?]", "country[in_the_eu]"
      assert_select "input#country_currency_id[name=?]", "country[currency_id]"
    end
  end
end
