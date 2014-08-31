require 'spec_helper'

describe "question_categories/index" do
  before(:each) do
    assign(:question_categories, [
      stub_model(QuestionCategory,
        :name => "Name",
        :question_category_id => 1,
        :active => false,
        :created_by => 2,
        :updated_by => 3,
        :country_id => 4
      ),
      stub_model(QuestionCategory,
        :name => "Name",
        :question_category_id => 1,
        :active => false,
        :created_by => 2,
        :updated_by => 3,
        :country_id => 4
      )
    ])
  end

  xit "renders a list of question_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
