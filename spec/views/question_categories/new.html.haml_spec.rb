require 'spec_helper'

describe "question_categories/new" do
  before(:each) do
    assign(:question_category, stub_model(QuestionCategory,
      :name => "MyString",
      :question_category_id => 1,
      :active => false,
      :created_by => 1,
      :updated_by => 1,
      :country_id => 1
    ).as_new_record)
  end

  xit "renders new question_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_categories_path, "post" do
      assert_select "input#question_category_name[name=?]", "question_category[name]"
      assert_select "input#question_category_question_category_id[name=?]", "question_category[question_category_id]"
      assert_select "input#question_category_active[name=?]", "question_category[active]"
      assert_select "input#question_category_created_by[name=?]", "question_category[created_by]"
      assert_select "input#question_category_updated_by[name=?]", "question_category[updated_by]"
      assert_select "input#question_category_country_id[name=?]", "question_category[country_id]"
    end
  end
end
